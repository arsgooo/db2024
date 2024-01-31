CREATE DATABASE db2024_Lab1;
CREATE USER arsgoo WITH PASSWORD '123';
GRANT ALL PRIVILEGES ON DATABASE "db2024_Lab1" TO arsgoo;
\c db2024_Lab1
CREATE ROLE readonly_user;
GRANT pg_read_all_data TO readonly_user;
SET ROLE arsgoo;