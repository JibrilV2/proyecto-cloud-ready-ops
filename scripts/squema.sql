CREATE DATABASE IF NOT EXISTS empresa_db;
USE empresa_db;

CREATE TABLE IF NOT EXISTS Empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO Empleados (nombre) VALUES ('Gabriel');