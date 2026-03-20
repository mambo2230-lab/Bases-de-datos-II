CREATE TABLE Atenciones_1FN (
    id_atencion INT PRIMARY KEY,
    paciente VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(100),
    medico VARCHAR(100),
    especialidad VARCHAR(100),
    consultorio INT,
    tratamiento VARCHAR(100),
    precio INT
);

INSERT INTO Atenciones_1FN VALUES
(1, 'Ana Torres', '3001112222', 'Cali', 'Dr. Pérez', 'Cardiología', 101, 'Consulta', 120000),
(2, 'Ana Torres', '3001112222', 'Cali', 'Dr. Pérez', 'Cardiología', 101, 'Examen', 120000),
(3, 'Juan Díaz', '3109998888', 'Medellín', 'Dr. Gómez', 'Pediatría', 202, 'Consulta', 80000),
(4, 'Ana Torres', '3001112222', 'Cali', 'Dr. Pérez', 'Cardiología', 101, 'Control', 60000); 

CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    direccion VARCHAR(100)
);

INSERT INTO Pacientes VALUES
(1, 'Ana Torres', '3001112222', 'Cali'),
(2, 'Juan Díaz', '3109998888', 'Medellín'); 

CREATE TABLE Especialidades (
    id_especialidad INT PRIMARY KEY,
    nombre VARCHAR(100)
);

INSERT INTO Especialidades VALUES
(1, 'Cardiología'),
(2, 'Pediatría'); 

CREATE TABLE Medicos (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_especialidad INT,
    consultorio INT,
    FOREIGN KEY (id_especialidad) REFERENCES Especialidades(id_especialidad)
);

INSERT INTO Medicos VALUES
(1, 'Dr. Pérez', 1, 101),
(2, 'Dr. Gómez', 2, 202); 

CREATE TABLE Tratamientos (
    id_tratamiento INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio INT
);

INSERT INTO Tratamientos VALUES
(1, 'Consulta', 120000),
(2, 'Examen', 120000),
(3, 'Control', 60000); 

CREATE TABLE Atenciones (
    id_atencion INT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    id_tratamiento INT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamientos(id_tratamiento)
);

INSERT INTO Atenciones VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 2, 2, 1),
(4, 1, 1, 3);