-- CREACION DE ROLES
CREATE ROLE IF NOT EXISTS DBA, BACKUP, ADMINISTRADOR, VENDEDOR, CLIENTE;

--  dba
GRANT ALL PRIVILEGES ON *.* TO DBA;
GRANT ALL PRIVILEGES ON *.* TO BACKUP;

-- CREACION DE USUARIO
-- create user 'app'@'localhost' identified by 'app-sive.21';
create user 'dba'@'localhost' identified by 'dba-Sive.21';
create user 'respaldo'@'localhost' identified by 'respaldo-Sive.21';
create user 'vendedor'@'%' identified by 'vendedor-Sive.21';
create user 'cliente'@'%' identified by 'cliente-Sive.21';
create user 'administrador'@'%' identified by 'administrador-Sive.21';

-- ASIGNACION DE ROLES
grant DBA to 'dba'@'localhost';
grant BACKUP to 'respaldo'@'localhost';
grant ADMINISTRADOR to 'administrador'@'%';
grant VENDEDOR to 'vendedor'@'%';
grant CLIENTE to 'cliente'@'%';

flush privileges;


