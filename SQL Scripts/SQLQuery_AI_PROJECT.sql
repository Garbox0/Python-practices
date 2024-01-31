CREATE DATABASE ai_project;

USE ai_project;

CREATE TABLE "Usuario" 
(
idUsuario INT PRIMARY KEY IDENTITY,
nombreUsuario VARCHAR(MAX),
apellidoUsuario VARCHAR(MAX),
correoUsuario VARCHAR(MAX),
claveUsuario VARCHAR(MAX),
tipoPlan VARCHAR(MAX)
);

CREATE TABLE "Plan"
(
idPlan INT PRIMARY KEY IDENTITY,
nombrePlan VARCHAR(MAX),
descripcion VARCHAR(MAX),
beneficios VARCHAR(MAX),
precio DECIMAL(10, 2)
);

CREATE TABLE "Transaccion"
(
idTransaccion INT PRIMARY KEY IDENTITY,
fechaTransaccion DATETIME DEFAULT GETDATE(),
idUsuario INT REFERENCES "Usuario"(idUsuario),
idPlan INT REFERENCES "Plan"(idPlan)
);

CREATE TABLE "Asesor_C" (
idAsesorC INT PRIMARY KEY IDENTITY,
nombreAsesorC VARCHAR(MAX),
descripcion VARCHAR(MAX),
archivos VARCHAR(MAX),
prompt VARCHAR(MAX)
);

CREATE TABLE "Chat_C" 
(
idChatC INT PRIMARY KEY IDENTITY,
nombreChatC VARCHAR(MAX),
fechaInicio DATETIME,
fechaFin DATETIME,
idUsuario INT REFERENCES "Usuario"(idUsuario),
idAsesorC INT REFERENCES "Asesor_C"(idAsesorC)
);

CREATE TABLE "Archivo" 
(
idArchivo INT PRIMARY KEY IDENTITY,
nombreArchivo VARCHAR(MAX),
tipoArchivo VARCHAR(MAX),
contenido VARCHAR(MAX),
idAsesorC INT REFERENCES "Asesor_C"(idAsesorC)
);

CREATE TABLE "Asesor_H" 
(
idAsesorH INT PRIMARY KEY IDENTITY,
nombreAsesorH VARCHAR(MAX),
apellidoAsesorH VARCHAR(MAX),
especialidad VARCHAR(MAX),
credencial VARCHAR(MAX),
claveAsesorH VARCHAR(MAX)
);

CREATE TABLE "Chat_H" 
(
idChatH INT PRIMARY KEY IDENTITY,
nombreChatH VARCHAR(MAX),
fechaInicio DATETIME,
fechaFin DATETIME,
idUsuario INT REFERENCES "Usuario"(idUsuario),
idAsesorH INT REFERENCES "Asesor_H"(idAsesorH)
);

CREATE TABLE "Chat_History_H"
(
idChHistH INT PRIMARY KEY IDENTITY
);

CREATE TABLE "Chat_History_C"
(
idChHistC INT PRIMARY KEY IDENTITY
);

CREATE TABLE "Vector" 
(
idVector INT PRIMARY KEY IDENTITY,
vector VARCHAR(MAX)
);



SELECT * FROM Vector