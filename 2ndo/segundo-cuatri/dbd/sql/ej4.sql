/* Ejercicio 4
PERSONA = (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero)
ALUMNO = (DNI (fk), Legajo, Año_Ingreso)
PROFESOR = (DNI (fk), Matricula, Nro_Expediente)
TITULO = (Cod_Titulo, Nombre, Descripción)
TITULO-PROFESOR = (Cod_Titulo (fk), DNI (fk), Fecha)
CURSO = (Cod_Curso, Nombre, Descripción, Fecha_Creacion, Duracion)
ALUMNO-CURSO = (DNI (fk), Cod_Curso (fk), Año, Desempeño, Calificación)
PROFESOR-CURSO = (DNI (fk), Cod_Curso (fk), Fecha_Desde, Fecha_Hasta) */

/* 1. Listar DNI, legajo y apellido y nombre de todos los alumnos que tengan año de ingreso inferior a
2014. */
SELECT a.DNI, a.Legajo, p.nombre, p.apellido
FROM ALUMNO 
INNER JOIN PERSONA p on (p.DNI = a.DNI)
WHERE A.Año_Ingreso < 2014

/* 2. Listar DNI, matrícula, apellido y nombre de los profesores que dictan cursos que tengan más de
100 horas de duración. Ordenar por DNI. */
SELECT P.DNI, P.Matricula, PER.Apellido, PER.Nombre
FROM PERSONA PER
INNER JOIN PROFESOR p ON (p.dni = per.DN)
INNER JOIN profesor_curso pc ON (per.DNI = pc.DNI)
INNER JOIN curso c ON (pc.Cod_Curso = c.Cod_Curso)
WHERE (c.Duracion > 100)
ORDER BY p.DNI
/* 3. Listar el DNI, Apellido, Nombre, Género y Fecha de nacimiento de los alumnos inscriptos al
curso con nombre “Diseño de Bases de Datos” en 2023. */

SELECT p.DNI, p.Apellido, p.Nombre, p.Genero, p.Fecha_Nacimiento
FROM persona p
WHERE p.DNI IN (
    SELECT aCurso.DNI
    FROM alumno_curso aCurso
    INNER JOIN curso c ON (aCurso.Cod_Curso = c.Cod_Curso)
    WHERE (c.nombre = 'Diseño de Bases de Datos' AND YEAR(aCurso.Año)=2023)
)
/* 4. Listar el DNI, Apellido, Nombre y Calificación de aquellos alumnos que obtuvieron una
calificación superior a 8 en algún curso que dicta el profesor “Juan Garcia”. Dicho listado deberá
estar ordenado por Apellido y nombre. */
SELECT P.DNI, P.Apellido, P.Nombre, AC.Calificación
FROM PERSONA p
INNER JOIN alumno_curso AC ON (p.DNI = AC.DNI)
INNER JOIN PROFESOR-CURSO PC ON (PC.Cod_Curso = AC.Cod_Curso)
INNER JOIN PERSONA PR ON (PR.DNI = PC.DNI)
WHERE (ac.Calificación > 8) and (PR.Nombre = "JUAN") AND (PR.Apellido = "GARCIA")
ORDER BY P.Apellido, P.Nombre

/* 5. Listar el DNI, Apellido, Nombre y Matrícula de aquellos profesores que posean más de 3 títulos.
Dicho listado deberá estar ordenado por Apellido y Nombre. */
SELECT P.DNI, P.Apellido, P.Nombre, PR.Matricula
FROM PROFESOR PR
INNER JOIN PERSONA P ON (PR.DNI = P.DNI)
INNER JOIN TITULO-PROFESOR T ON (P.DNI = T.DNI)
GROUP BY P.DNI, P.Apellido, P.Nombre, PR.Matricula
HAVING COUNT(*) > 3
ORDER BY P.Apellido, P.Nombre
/* 6. Listar el DNI, Apellido, Nombre, Cantidad de horas y Promedio de horas que dicta cada profesor.
La cantidad de horas se calcula como la suma de la duración de todos los cursos que dicta. */
SELECT P.DNI, P.Apellido, P.Nombre, SUM(C.Duracion) AS CANT_HORAS, AVG(C.Duracion)
FROM PERSONA P
INNER JOIN PROFESOR PR ON (PR.DNI = P.DNI)
INNER JOIN PROFESOR-CURSO PF ON (PR.DNI = PF.DNI)
INNER JOIN CURSO C ON (PF.Cod_Curso = PF.Cod_Curso)
GROUP BY P.DNI, P.Apellido, P.Nombre

/* Ejercicio 4
PERSONA = (DNI, Apellido, Nombre, Fecha_Nacimiento, Estado_Civil, Genero)
ALUMNO = (DNI (fk), Legajo, Año_Ingreso)
PROFESOR = (DNI (fk), Matricula, Nro_Expediente)
TITULO = (Cod_Titulo, Nombre, Descripción)
TITULO-PROFESOR = (Cod_Titulo (fk), DNI (fk), Fecha)
CURSO = (Cod_Curso, Nombre, Descripción, Fecha_Creacion, Duracion)
ALUMNO-CURSO = (DNI (fk), Cod_Curso (fk), Año, Desempeño, Calificación)
PROFESOR-CURSO = (DNI (fk), Cod_Curso (fk), Fecha_Desde, Fecha_Hasta) */
