create table Teams (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(13) NOT NULL,
	project_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES Projects (id) 
);
insert into Teams (id, name, project_id) values (1, 'Lions', 9);
insert into Teams (id, name, project_id) values (2, 'Storm', 5);
insert into Teams (id, name, project_id) values (3, 'Trail Blazers', 7);
insert into Teams (id, name, project_id) values (4, 'Mustangs', 5);
insert into Teams (id, name, project_id) values (5, 'Wolves', 9);
insert into Teams (id, name, project_id) values (6, 'Knights', 3);
insert into Teams (id, name, project_id) values (7, 'Eagles', 3);
insert into Teams (id, name, project_id) values (8, 'Kings', 5);
insert into Teams (id, name, project_id) values (9, 'Wolves', 4);
insert into Teams (id, name, project_id) values (10, 'Wolves', 10);
insert into Teams (id, name, project_id) values (11, 'Falcons', 8);
insert into Teams (id, name, project_id) values (12, 'Bucks', 6);
insert into Teams (id, name, project_id) values (13, 'Celtics', 2);
insert into Teams (id, name, project_id) values (14, 'Hawks', 1);
insert into Teams (id, name, project_id) values (15, 'Spurs', 1);
insert into Teams (id, name, project_id) values (16, 'Rockets', 2);
insert into Teams (id, name, project_id) values (17, 'Cavaliers', 5);
insert into Teams (id, name, project_id) values (18, 'Rockets', 8);
insert into Teams (id, name, project_id) values (19, 'Pelicans', 5);
insert into Teams (id, name, project_id) values (20, 'Trojans', 9);
insert into Teams (id, name, project_id) values (21, 'Pelicans', 1);
insert into Teams (id, name, project_id) values (22, 'Jaguars', 7);
insert into Teams (id, name, project_id) values (23, 'Kings', 10);
insert into Teams (id, name, project_id) values (24, 'Celtics', 4);
insert into Teams (id, name, project_id) values (25, '76ers', 7);
insert into Teams (id, name, project_id) values (26, 'Warriors', 3);
insert into Teams (id, name, project_id) values (27, 'Dragons', 4);
insert into Teams (id, name, project_id) values (28, 'Bulldogs', 6);
insert into Teams (id, name, project_id) values (29, 'Mavericks', 5);
insert into Teams (id, name, project_id) values (30, 'Bears', 3);
insert into Teams (id, name, project_id) values (31, 'Dolphins', 7);
insert into Teams (id, name, project_id) values (32, 'Rockets', 3);
insert into Teams (id, name, project_id) values (33, 'Jaguars', 3);
insert into Teams (id, name, project_id) values (34, 'Nuggets', 5);
insert into Teams (id, name, project_id) values (35, 'Blazers', 9);
insert into Teams (id, name, project_id) values (36, 'Kings', 9);
insert into Teams (id, name, project_id) values (37, 'Dolphins', 10);
insert into Teams (id, name, project_id) values (38, 'Falcons', 10);
insert into Teams (id, name, project_id) values (39, 'Mustangs', 8);
insert into Teams (id, name, project_id) values (40, 'Rockets', 3);
insert into Teams (id, name, project_id) values (41, 'Wizards', 3);
insert into Teams (id, name, project_id) values (42, 'Blazers', 9);
insert into Teams (id, name, project_id) values (43, '76ers', 9);
insert into Teams (id, name, project_id) values (44, 'Heat', 8);
insert into Teams (id, name, project_id) values (45, 'Pelicans', 3);
insert into Teams (id, name, project_id) values (46, 'Cavaliers', 5);
insert into Teams (id, name, project_id) values (47, 'Cavaliers', 4);
insert into Teams (id, name, project_id) values (48, 'Wizards', 5);
insert into Teams (id, name, project_id) values (49, 'Kings', 1);
insert into Teams (id, name, project_id) values (50, 'Tigers', 6);
