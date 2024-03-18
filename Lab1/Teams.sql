CREATE TABLE Teams (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(13) NOT NULL,
	project_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES Projects (id) ON DELETE CASCADE
);
insert into Teams (name, project_id) values ('Lions', 9);
insert into Teams (name, project_id) values ('Storm', 5);
insert into Teams (name, project_id) values ('Trail Blazers', 7);
insert into Teams (name, project_id) values ('Mustangs', 5);
insert into Teams (name, project_id) values ('Wolves', 9);
insert into Teams (name, project_id) values ('Knights', 3);
insert into Teams (name, project_id) values ('Eagles', 3);
insert into Teams (name, project_id) values ('Kings', 5);
insert into Teams (name, project_id) values ('Wolves', 4);
insert into Teams (name, project_id) values ('Wolves', 10);
insert into Teams (name, project_id) values ('Falcons', 8);
insert into Teams (name, project_id) values ('Bucks', 6);
insert into Teams (name, project_id) values ('Celtics', 2);
insert into Teams (name, project_id) values ('Hawks', 1);
insert into Teams (name, project_id) values ('Spurs', 1);
insert into Teams (name, project_id) values ('Rockets', 2);
insert into Teams (name, project_id) values ('Cavaliers', 5);
insert into Teams (name, project_id) values ('Rockets', 8);
insert into Teams (name, project_id) values ('Pelicans', 5);
insert into Teams (name, project_id) values ('Trojans', 9);
insert into Teams (name, project_id) values ('Pelicans', 1);
insert into Teams (name, project_id) values ('Jaguars', 7);
insert into Teams (name, project_id) values ('Kings', 10);
insert into Teams (name, project_id) values ('Celtics', 4);
insert into Teams (name, project_id) values ('76ers', 7);
insert into Teams (name, project_id) values ('Warriors', 3);
insert into Teams (name, project_id) values ('Dragons', 4);
insert into Teams (name, project_id) values ('Bulldogs', 6);
insert into Teams (name, project_id) values ('Mavericks', 5);
insert into Teams (name, project_id) values ('Bears', 3);
insert into Teams (name, project_id) values ('Dolphins', 7);
insert into Teams (name, project_id) values ('Rockets', 3);
insert into Teams (name, project_id) values ('Jaguars', 3);
insert into Teams (name, project_id) values ('Nuggets', 5);
insert into Teams (name, project_id) values ('Blazers', 9);
insert into Teams (name, project_id) values ('Kings', 9);
insert into Teams (name, project_id) values ('Dolphins', 10);
insert into Teams (name, project_id) values ('Falcons', 10);
insert into Teams (name, project_id) values ('Mustangs', 8);
insert into Teams (name, project_id) values ('Rockets', 3);
insert into Teams (name, project_id) values ('Wizards', 3);
insert into Teams (name, project_id) values ('Blazers', 9);
insert into Teams (name, project_id) values ('76ers', 9);
insert into Teams (name, project_id) values ('Heat', 8);
insert into Teams (name, project_id) values ('Pelicans', 3);
insert into Teams (name, project_id) values ('Cavaliers', 5);
insert into Teams (name, project_id) values ('Cavaliers', 4);
insert into Teams (name, project_id) values ('Wizards', 5);
insert into Teams (name, project_id) values ('Kings', 1);
insert into Teams (name, project_id) values ('Tigers', 6);
