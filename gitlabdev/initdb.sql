CREATE USER 'git'@'localhost' IDENTIFIED BY 'git';
SET storage_engine=INNODB;
CREATE DATABASE IF NOT EXISTS gitlabhq_production DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, LOCK TABLES ON gitlabhq_production.* TO 'git'@'localhost';

