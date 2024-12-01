-- Paso 1: Crear la base de datos y las tablas
CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Libros (
    id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    anio_publicacion   INT
);

CREATE TABLE Prestamos (
    id INT PRIMARY KEY,
    libro_id INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (libro_id) REFERENCES Libros(id)
);

-- Paso 2: Insertar datos
INSERT INTO Libros (id, titulo, autor, anio_publicacion ) VALUES
(1, 'El Mago de Toz', 'L. Frank Baum', 1967),
(2, 'El Señor de los gramillos', 'J.R.R. Tolkien', 1985),
(3, 'El Guardián entre el Centeno', 'J.D. Salinger', 1949),
(4, 'Don Quijote me la Mancha', 'Miguel de Cervantes', 1605),
(5, 'El show de Freeman', 'Michael Crichton', 1813);

INSERT INTO Prestamos (id, libro_id, fecha_prestamo, fecha_devolucion) VALUES
(1, 1, '2024-01-01', '2024-01-15'),
(2, 2, '2024-01-10', '2024-01-20'),
(3, 1, '2024-01-22', '2024-02-05');

-- Paso 3: Consultas

-- 3.1. Libros prestados con fecha de devolución después de la fecha actual
SELECT Libros.titulo, Prestamos.fecha_prestamo
FROM Prestamos
JOIN Libros ON Prestamos.libro_id = Libros.id
WHERE Prestamos.fecha_devolucion > '2024-01-20'; -- Reemplaza manualmente la fecha actual

SELECT Libros.titulo
FROM Libros
WHERE (
    SELECT COUNT(*)
    FROM Prestamos
    WHERE Prestamos.libro_id = Libros.id
) > 1;

-- Paso 4: Actualizar y eliminar

-- 4.1. Actualizar la fecha de devolución a la fecha actual
UPDATE Prestamos
SET fecha_devolucion = '2024-03-15' -- Reemplaza manualmente la fecha actual
WHERE id = 3;  -- Cambia el ID según sea necesario

-- 4.2. Eliminar préstamos vencidos (fecha de devolución anterior a la fecha actual)
DELETE FROM Prestamos
WHERE fecha_devolucion < '2024-01-18'; -- Reemplaza manualmente la fecha actual
