create database NominaDB;
go

use NominaDB;
go

create table Departamento (
IdDepartamento INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Cargo (
    IdCargo INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    SalarioBase DECIMAL(10,2) NOT NULL,
    IdDepartamento INT NOT NULL,
    FOREIGN KEY (IdDepartamento) REFERENCES Departamento(IdDepartamento)
);

CREATE TABLE TipoContrato (
IdTipoContrato INT IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE Empleado (
IdEmpleado INT IDENTITY(1,1) PRIMARY KEY,
Documento VARCHAR(20) UNIQUE NOT NULL,
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
FechaIngreso DATE NOT NULL,
	IdCargo INT NOT NULL,
	IdTipoContrato INT NOT NULL,
	FOREIGN KEY (IdCargo) REFERENCES Cargo (IdCargo),
	FOREIGN KEY (IdTipoContrato) REFERENCES TipoContrato(IdTipoContrato)
);

CREATE TABLE Nomina (
	IdNomina INT IDENTITY(1,1) PRIMARY KEY,
	IdEmpleado INT NOT NULL,
	FechaInicio DATE NOT NULL,
	FechaFin DATE NOT NULL,
	TotalDevengado DECIMAL(10,2),
	TotalDeducciones DECIMAL(10,2),
	NetoPagar DECIMAL(10,2),
	FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);
CREATE TABLE DetalleNomina (
    IdDetalle INT IDENTITY(1,1) PRIMARY KEY,
    IdNomina INT NOT NULL,
    Concepto VARCHAR(100) NOT NULL,
    Tipo VARCHAR(20) CHECK (Tipo IN ('DEVENGADO','DEDUCCION')),
    Valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (IdNomina) REFERENCES Nomina(IdNomina)
);

INSERT INTO Departamento (Nombre) VALUES
('Sistemas'),
('Contabilidad'),
('Recursos Humanos'),
('Ventas');

INSERT INTO Cargo (Nombre, SalarioBase, IdDepartamento) VALUES
('Desarrollador', 3500.00, 1),
('Contador', 3000.00, 2),
('Analista RRHH', 2800.00, 3),
('Vendedor', 2500.00, 4);

INSERT INTO TipoContrato (Descripcion) VALUES
('Indefinido'),
('Temporal'),
('Prestacion de Servicios'),
('Aprendizaje');

INSERT INTO Empleado 
(Documento, Nombre, Apellido, FechaIngreso, IdCargo, IdTipoContrato)
VALUES
('1001', 'Juan', 'Perez', '2023-01-10', 1, 1),
('1002', 'Maria', 'Gomez', '2023-02-15', 2, 2),
('1003', 'Carlos', 'Lopez', '2023-03-20', 3, 3),
('1004', 'Ana', 'Martinez', '2023-04-25', 4, 1);

INSERT INTO Nomina
(IdEmpleado, FechaInicio, FechaFin, TotalDevengado, TotalDeducciones, NetoPagar)
VALUES
(1, '2024-01-01', '2024-01-15', 1750.00, 200.00, 1550.00),
(2, '2024-01-01', '2024-01-15', 1500.00, 180.00, 1320.00),
(3, '2024-01-01', '2024-01-15', 1400.00, 150.00, 1250.00),
(4, '2024-01-01', '2024-01-15', 1300.00, 120.00, 1180.00); 


INSERT INTO DetalleNomina
(IdNomina, Concepto, Tipo, Valor)
VALUES
(1, 'Salario Base', 'DEVENGADO', 1750.00),
(1, 'Salud', 'DEDUCCION', 100.00),
(2, 'Salario Base', 'DEVENGADO', 1500.00),
(2, 'Pension', 'DEDUCCION', 180.00); 

SELECT * 
FROM Empleado; 

SELECT *
FROM Empleado
WHERE IdTipoContrato = 1; 

SELECT *
FROM Cargo
WHERE SalarioBase > 3000; 

SELECT
    E.Nombre,
    E.Apellido,
    C.Nombre AS Cargo,
    D.Nombre AS Departamento
FROM Empleado E
JOIN Cargo C ON E.IdCargo = C.IdCargo
JOIN Departamento D ON C.IdDepartamento = D.IdDepartamento; 

SELECT
    E.Nombre,
    SUM(DN.Valor) AS TotalDevengado
FROM Empleado E
JOIN Nomina N ON E.IdEmpleado = N.IdEmpleado
JOIN DetalleNomina DN ON N.IdNomina = DN.IdNomina
WHERE DN.Tipo = 'DEVENGADO'
GROUP BY E.Nombre; 

SELECT
    E.Nombre,
    SUM(DN.Valor) AS TotalDeducciones
FROM Empleado E
JOIN Nomina N ON E.IdEmpleado = N.IdEmpleado
JOIN DetalleNomina DN ON N.IdNomina = DN.IdNomina
WHERE DN.Tipo = 'DEDUCCION'
GROUP BY E.Nombre;