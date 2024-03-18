from flask import Flask, jsonify, request
import psycopg2

app = Flask(__name__)
connection = psycopg2.connect( # Establishing connection to the database
        user="postgres",
        password="admin",
        host="localhost",
        port="5432",
        database="db2024_Lab1"
    )

CREATE_PROJECTS_TABLE = '''CREATE TABLE IF NOT EXISTS Projects (
    id SERIAL NOT NULL PRIMARY KEY, 
    name VARCHAR(8) NOT NULL, 
    description TEXT NOT NULL, 
    start_date DATE NOT NULL, 
    status VARCHAR(12) NOT NULL, 
    budget MONEY NOT NULL
    );'''
SELECT_ALL_PROJECTS = "SELECT * FROM Projects ORDER BY id;"
SELECT_PROJECT_BY_ID = "SELECT * FROM Projects WHERE id=%s;"
INSERT_PROJECT_RETURN_ID = "INSERT INTO projects (name, description, start_date, status, budget) VALUES (%s, %s, %s, %s, %s) RETURNING id;"
UPDATE_PROJECT_BY_ID = "UPDATE Projects SET name=%s, description=%s, start_date=%s, status=%s, budget=%s WHERE id=%s"
DELETE_PROJECT_BY_ID = "DELETE FROM Projects WHERE id=%s"

CREATE_TASKS_TABLE = '''CREATE TABLE IF NOT EXISTS Tasks (
	id SERIAL NOT NULL PRIMARY KEY,
  	description TEXT NOT NULL,
  	deadline DATE NOT NULL,
  	status VARCHAR(11) NOT NULL,
	project_id INT NOT NULL,
  	FOREIGN KEY (project_id) REFERENCES Projects (id) ON DELETE CASCADE
    );'''
SELECT_ALL_TASKS = "SELECT * FROM Tasks ORDER BY id;"
SELECT_TASK_BY_ID = "SELECT * FROM Tasks WHERE id=%s;"
INSERT_TASK_RETURN_ID = "INSERT INTO Tasks (description, deadline, status, project_id) VALUES (%s, %s, %s, %s) RETURNING id;"
UPDATE_TASK_BY_ID = "UPDATE Tasks SET description=%s, deadline=%s, status=%s, project_id=%s WHERE id=%s;"
DELETE_TASK_BY_ID = "DELETE FROM Tasks WHERE id=%s;"

CREATE_TEAMS_TABLE = '''CREATE TABLE IF NOT EXISTS Teams (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(13) NOT NULL,
	project_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES Projects (id) ON DELETE CASCADE
    );'''
SELECT_ALL_TEAMS = "SELECT * FROM Teams ORDER BY id;"
SELECT_TEAM_BY_ID = "SELECT * FROM Teams WHERE id=%s;"
INSERT_TEAM_RETURN_ID = "INSERT INTO Teams (name, project_id) VALUES (%s, %s) RETURNING id;"
UPDATE_TEAM_BY_ID = "UPDATE Teams SET name=%s, project_id=%s WHERE id=%s;"
DELETE_TEAM_BY_ID = "DELETE FROM Teams WHERE id=%s;"

CREATE_MEMBERS_TABLE = '''CREATE TABLE IF NOT EXISTS Members (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	role VARCHAR(18) NOT NULL,
	phone_number TEXT NOT NULL,
	team_id INT NOT NULL,
	FOREIGN KEY (team_id) REFERENCES Teams (id) ON DELETE CASCADE
    );'''
SELECT_ALL_MEMBERS = "SELECT * FROM Members ORDER BY id;"
SELECT_MEMBER_BY_ID = "SELECT * FROM Members WHERE id=%s;"
INSERT_MEMBER_RETURN_ID = "INSERT INTO Members (name, role, phone_number, team_id) VALUES (%s, %s, %s, %s) RETURNING id;"
UPDATE_MEMBER_BY_ID = "UPDATE Members SET name=%s, role=%s, phone_number=%s, team_id=%s WHERE id=%s;"
DELETE_MEMBER_BY_ID = "DELETE FROM Members WHERE id=%s;"


# -------------------------   PROJECTS   -------------------------
# Create a project
@app.route("/api/project", methods=["POST"])
def create_project():
    data = request.get_json()
    name = data['name']
    description = data['description']
    start_date = data['start_date']
    status = data['status']
    budget = data['budget']
    
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(CREATE_PROJECTS_TABLE)
            cursor.execute(INSERT_PROJECT_RETURN_ID, (name, description, start_date, status, budget))
            project_id = cursor.fetchone()[0]
    
    return {"id": project_id, "name": name, "message": f"Project {name} was created!"}, 201

# Read all projects
@app.route("/api/projects", methods=["GET"])
def get_all_projects():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_ALL_PROJECTS)
            projects = cursor.fetchall()
            if projects:
                data = []
                for project in projects:
                    data.append({"id": project[0], "name": project[1], "description": project[2], "start_date": project[3], "status": project[4], "budget": project[5]})
                return jsonify(data)
            else:
                return jsonify({"error": f"Projects are not found."}), 404

# Read a specific project
@app.route("/api/project/<int:project_id>", methods=["GET"])
def get_project_by_id(project_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_PROJECT_BY_ID, (project_id,)) 
            project = cursor.fetchone()
            if project:
                return jsonify({"id": project[0], "name": project[1], "description": project[2], "start_date": project[3], "status": project[4], "budget": project[5]})
            else:
                return jsonify({"error": f"Project with ID {project_id} was not found"}), 404

# Update a project
@app.route("/api/project/<int:project_id>", methods=["PUT"])
def update_project_by_id(project_id):
    data = request.get_json()
    name = data['name']
    description = data['description']
    start_date = data['start_date']
    status = data['status']
    budget = data['budget']

    with connection:
        with connection.cursor() as cursor:
            cursor.execute(UPDATE_PROJECT_BY_ID, (name, description, start_date, status, budget, project_id))
            if cursor.rowcount == 0:
                return jsonify({"error": f"Project with ID {project_id} was not found"}), 404

    return {"id": project_id, "name": name, "description": description, "start_date": start_date, "status": status, "budget": budget, "message": f"Project with ID {project_id} was updated!"}

# Delete a project
@app.route("/api/project/<int:project_id>", methods=["DELETE"])
def delete_project_by_id(project_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(DELETE_PROJECT_BY_ID, (project_id,))
            if cursor.rowcount == 0:
                return jsonify({"error": f"Project with ID {project_id} was not found"}), 404
    
    return {"message": f"Project with ID {project_id} was deleted!"}


# -------------------------   TASKS   -------------------------
# Create a task
@app.route("/api/task", methods=["POST"])
def create_task():
    data = request.get_json()
    description = data['description']
    deadline = data['deadline']
    status = data['status']
    project_id = data['project_id']
    
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(CREATE_TASKS_TABLE)
            cursor.execute(INSERT_TASK_RETURN_ID, (description, deadline, status, project_id))
            task_id = cursor.fetchone()[0]
    
    return {"id": task_id, "message": f"Task was created!"}, 201

# Read all tasks
@app.route("/api/tasks", methods=["GET"])
def get_all_tasks():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_ALL_TASKS)
            tasks = cursor.fetchall()
            if tasks:
                data = []
                for task in tasks:
                    data.append({"id": task[0], "description": task[1], "deadline": task[2], "status": task[3], "project_id": task[4]})
                return jsonify(data)
            else:
                return jsonify({"error": f"Tasks are not found."}), 404

# Read a specific task
@app.route("/api/task/<int:task_id>", methods=["GET"])
def get_task_by_id(task_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_TASK_BY_ID, (task_id,)) 
            task = cursor.fetchone()
            if task:
                return jsonify({"id": task[0], "description": task[1], "deadline": task[2], "status": task[3], "project_id": task[4]})
            else:
                return jsonify({"error": f"Task with ID {task_id} was not found"}), 404

# Update a task
@app.route("/api/task/<int:task_id>", methods=["PUT"])
def update_task_by_id(task_id):
    data = request.get_json()
    description = data['description']
    deadline = data['deadline']
    status = data['status']
    project_id = data['project_id']

    with connection:
        with connection.cursor() as cursor:
            cursor.execute(UPDATE_TASK_BY_ID, (description, deadline, status, project_id, task_id))
            if cursor.rowcount == 0:
                return jsonify({"error": f"Task with ID {task_id} was not found"}), 404

    return {"id": task_id, "description": description, "deadline": deadline, "status": status, "project_id": project_id, "message": f"Task with ID {task_id} was updated!"}

# Delete a task
@app.route("/api/task/<int:task_id>", methods=["DELETE"])
def delete_task_by_id(task_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(DELETE_TASK_BY_ID, (task_id,))
            if cursor.rowcount == 0:
                return jsonify({"error": f"Task with ID {task_id} was not found"}), 404
    
    return {"message": f"Task with ID {task_id} was deleted!"}


# -------------------------   TEAMS   -------------------------
# Create a team
@app.route("/api/team", methods=["POST"])
def create_team():
    data = request.get_json()
    name = data['name']
    project_id = data['project_id']
    
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(CREATE_TEAMS_TABLE)
            cursor.execute(INSERT_TEAM_RETURN_ID, (name, project_id))
            team_id = cursor.fetchone()[0]
    
    return {"id": team_id, "message": f"Team {name} was created!"}, 201

# Read all teams
@app.route("/api/teams", methods=["GET"])
def get_all_teams():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_ALL_TEAMS)
            teams = cursor.fetchall()
            if teams:
                data = []
                for team in teams:
                    data.append({"id": team[0], "name": team[1], "project_id": team[2]})
                return jsonify(data)
            else:
                return jsonify({"error": f"Teams are not found."}), 404

# Read a specific team
@app.route("/api/team/<int:team_id>", methods=["GET"])
def get_team_by_id(team_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_TEAM_BY_ID, (team_id,)) 
            team = cursor.fetchone()
            if team:
                return jsonify({"id": team[0], "name": team[1], "project_id": team[2]})
            else:
                return jsonify({"error": f"Team with ID {team_id} was not found"}), 404

# Update a team
@app.route("/api/team/<int:team_id>", methods=["PUT"])
def update_team_by_id(team_id):
    data = request.get_json()
    name = data['name']
    project_id = data['project_id']

    with connection:
        with connection.cursor() as cursor:
            cursor.execute(UPDATE_TEAM_BY_ID, (name, project_id, team_id))
            if cursor.rowcount == 0:
                return jsonify({"error": f"Team with ID {team_id} was not found"}), 404

    return {"id": team_id, "name": name, "project_id": project_id, "message": f"Team with ID {team_id} was updated!"}

# Delete a team
@app.route("/api/team/<int:team_id>", methods=["DELETE"])
def delete_team_by_id(team_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(DELETE_TEAM_BY_ID, (team_id,))
            if cursor.rowcount == 0:
                return jsonify({"error": f"Team with ID {team_id} was not found"}), 404
    
    return {"message": f"Team with ID {team_id} was deleted!"}



# -------------------------   MEMBERS   -------------------------
# Create a member
@app.route("/api/member", methods=["POST"])
def create_member():
    data = request.get_json()
    name = data['name']
    role = data['role']
    phone_number = data['phone_number']
    team_id = data['team_id']
    
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(CREATE_MEMBERS_TABLE)
            cursor.execute(INSERT_MEMBER_RETURN_ID, (name, role, phone_number, team_id))
            member_id = cursor.fetchone()[0]
    
    return {"id": member_id, "message": f"Member {name} was created!"}, 201

# Read all members
@app.route("/api/members", methods=["GET"])
def get_all_members():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_ALL_MEMBERS)
            members = cursor.fetchall()
            if members:
                data = []
                for member in members:
                    data.append({"id": member[0], "name": member[1], "role": member[2], "phone_number": member[3], "team_id": member[4]})
                return jsonify(data)
            else:
                return jsonify({"error": f"Members are not found."}), 404

# Read a specific member
@app.route("/api/member/<int:member_id>", methods=["GET"])
def get_member_by_id(member_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_MEMBER_BY_ID, (member_id,)) 
            member = cursor.fetchone()
            if member:
                return jsonify({"id": member[0], "name": member[1], "role": member[2], "phone_number": member[3], "team_id": member[4]})
            else:
                return jsonify({"error": f"Member with ID {member_id} was not found"}), 404

# Update a member
@app.route("/api/member/<int:member_id>", methods=["PUT"])
def update_member_by_id(member_id):
    data = request.get_json()
    name = data['name']
    role = data['role']
    phone_number = data['phone_number']
    team_id = data['team_id']

    with connection:
        with connection.cursor() as cursor:
            cursor.execute(UPDATE_MEMBER_BY_ID, (name, role, phone_number, team_id, member_id))
            if cursor.rowcount == 0:
                return jsonify({"error": f"Member with ID {member_id} was not found"}), 404

    return {"id": member_id, "name": name, "role": role, "phone_number": phone_number, "team_id": team_id, "message": f"Member with ID {member_id} was updated!"}

# Delete a member
@app.route("/api/member/<int:member_id>", methods=["DELETE"])
def delete_member_by_id(member_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(DELETE_MEMBER_BY_ID, (member_id,))
            if cursor.rowcount == 0:
                return jsonify({"error": f"Member with ID {member_id} was not found"}), 404
    
    return {"message": f"Member with ID {member_id} was deleted!"}