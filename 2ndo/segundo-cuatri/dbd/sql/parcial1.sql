/*
Especialista = (Matricula, nombre, apellido, domicilio)
ObraSocial = (nombre, descripción)
Paciente = (DNI, nombre, apellido, domicilio, telefono)
Turno = ((Matricula (FK), DNI (FK), fecha, motivo, nombre (FK)?, observaciones?) // El nombre es el de la
Obra Social.
Realizar 1, 2, 3 y 4 en AR y 2, 3, 4, 5 y 6 en SQL
1. Para los turnos del 26/06/2022 listar matrícula, nombre y apellido de los especialistas, DNI, nombre, apellido,
teléfono de los pacientes involucrados, fecha del turno, nombre y descripción de la obra social.
2. Listar los datos de los pacientes que se atendieron con todos los especialistas...
3.
Listar las pacientes que se atendieron en el año 2021 pero no se atendieron en el año 2019.
4.
Listar los pacientes que se atendieron por la obra social "OSDE" y también "IOMA".
5.
Listar para cada especialista la cantidad de turnos en el 2022.
Listar los pacientes que se hayan atendido más de 5 veces en el año 2020.
*/