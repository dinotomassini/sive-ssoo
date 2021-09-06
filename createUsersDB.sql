-- CREACION DE ROLES
CREATE ROLE IF NOT EXISTS dba, administrador, vendedor, cliente;

--  dba
GRANT ALL PRIVILEGES ON *.* TO dba;

-- CREACION DE USUARIO
-- create user 'app'@'localhost' identified by 'app-sive.21';
create user 'dba'@'localhost' identified by 'dba-sive.21';
create user 'respaldo'@'localhost' identified by 'respaldo-sive.21';
create user 'vendedor'@'localhost' identified by 'vendedor-sive.21';
create user 'cliente'@'localhost' identified by 'cliente-sive.21';
create user 'administrador'@'localhost' identified by 'administrador-sive.21';

-- ASIGNACION DE ROLES
grant dba to 'dba'@'localhost';
grant respaldo to 'respaldo'@'localhost';
grant administrador to 'administrador'@'localhost';
grant vendedor to 'vendedor'@'localhost';
grant cliente to 'cliente'@'localhost';

-- grant all privileges on *.* to 'dba'@'localhost';
-- grant all privileges on *.* to 'respaldo'@'localhost';
-- grant all privileges on bd_sive.* to 'administrador'@'localhost';
-- grant select,insert,update,delete on bd_sive.* to 'app'@'localhost';
-- grant select,insert,update,delete on bd_sive.* to 'vendedor'@'localhost';
-- grant select,insert,update,delete on bd_sive.* to 'cliente'@'localhost';

flush privileges;


