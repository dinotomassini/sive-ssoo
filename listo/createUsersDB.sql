create user 'dba'@'localhost' identified by 'dba-sive.21';
create user 'app'@'localhost' identified by 'app-sive.21';
create user 'respaldo'@'localhost' identified by 'respaldo-sive.21';

grant all privileges on *.* to 'dba'@'localhost';
grant select,insert,update,delete on *.* to 'app'@'localhost';
grant all privileges on *.* to 'respaldo'@'localhost';

flush privileges;
