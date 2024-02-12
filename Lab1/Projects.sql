create table Projects (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(8) NOT NULL,
	description TEXT NOT NULL,
	start_date DATE NOT NULL,
	status VARCHAR(12) NOT NULL,
	budget MONEY NOT NULL
);
insert into Projects (id, name, description, start_date, status, budget) values (1, 'Aqua', 'Donec semper sapien a libero.', '03/04/2023', 'on hold', '$8812.87');
insert into Projects (id, name, description, start_date, status, budget) values (2, 'Serenity', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '12/02/2023', 'delayed', '$14533.30');
insert into Projects (id, name, description, start_date, status, budget) values (3, 'Cascade', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', '04/06/2023', 'archived', '$69616.87');
insert into Projects (id, name, description, start_date, status, budget) values (4, 'Harmony', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '26/11/2023', 'approved', '$98087.95');
insert into Projects (id, name, description, start_date, status, budget) values (5, 'Zenith', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', '25/12/2023', 'delayed', '$39527.08');
insert into Projects (id, name, description, start_date, status, budget) values (6, 'Luminous', 'Praesent blandit. Nam nulla.', '10/11/2023', 'in progress', '$54714.80');
insert into Projects (id, name, description, start_date, status, budget) values (7, 'Tranquil', 'Praesent blandit lacinia erat.', '05/06/2023', 'cancelled', '$6438.23');
insert into Projects (id, name, description, start_date, status, budget) values (8, 'Euphoria', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', '25/04/2023', 'delayed', '$7532.72');
insert into Projects (id, name, description, start_date, status, budget) values (9, 'Radiance', 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', '19/06/2023', 'archived', '$66615.05');
insert into Projects (id, name, description, start_date, status, budget) values (10, 'Bliss', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '14/04/2023', 'rejected', '$4078.51');