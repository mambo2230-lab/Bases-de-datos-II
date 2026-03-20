CREATE DATABASE TiendaDB;
GO

USE TiendaDB;
GO


CREATE TABLE Productos(
    IdProducto INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 0)
);
GO


INSERT INTO Productos VALUES
(1, 'Lapicero', 2.50),
(2, 'Cuaderno', 5.00),
(3, 'Resma de papel', 12.00),
(4, 'Carpeta plastica', 3.80),
(5, 'Borrador', 1.20),
(6, 'Agenda 2025', 15.50),
(7, 'Calculadora', 25.00),
(8, 'Marcadores', 8.90),
(9, 'Tijeras', 4.20),
(10, 'Pegante en barra', 2.00);
GO




SELECT * FROM Productos;


SELECT Nombre, Precio
FROM Productos;


INSERT INTO Productos VALUES
(11, 'Impresora', 350.00),
(12, 'Escritorio', 180.00),
(13, 'Silla Ergonomica', 220.00),
(14, 'Monitor 24 pulgadas', 520.00),
(15, 'Teclado Mecanico', 150.00),
(16, 'Audifonos Profesionales', 85.00);
GO


SELECT *
FROM Productos
WHERE Precio > 50;


INSERT INTO Productos VALUES
(17, 'Chocolate en barra', 5.50),
(18, 'Galletas con chocolate', 3.20),
(19, 'Bebida con chocolate', 4.80),
(20, 'Crema de chocolate', 7.00),
(21, 'Pastel de chocolate', 12.50),
(22, 'Chocolate blanco', 6.00);
GO


SELECT *
FROM Productos
WHERE LOWER(Nombre) LIKE '%chocolate%';


SELECT Nombre, Precio
FROM Productos
ORDER BY Precio ASC;