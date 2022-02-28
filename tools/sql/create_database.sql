create database loandepositrequest;
CREATE USER 'ldr'@'localhost' IDENTIFIED BY 'Asx919zx';
CREATE USER 'ldr'@'%' IDENTIFIED BY 'Asx919zx';
GRANT ALL PRIVILEGES ON loandepositrequest . * TO 'ldr'@'localhost';
GRANT ALL PRIVILEGES ON loandepositrequest . * TO 'ldr'@'%';
FLUSH PRIVILEGES;