/* Ejercicio 3
Banda = (codigoB, nombreBanda, genero_musical, año_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk)) */

/* 1. Listar DNI, nombre, apellido, dirección y email de integrantes nacidos entre 1980 y 1990 y que
hayan realizado algún recital durante 2023. */
SELECT  i.DNI, i.nombre, i.apellido, i.dirección, i.email
FROM integrante i
WHERE I.fecha_nacimiento BETWEEN 1980/01/01 AND 1990/01/01 AND I.DNI IN (
	SELECT I.DNI
	FROM integrante i
	inner join recital r on (i.codigoB = r.codigoB)
	WHERE YEAR(R.FECHA) = 2023
)
/* 2. Reportar nombre, género musical y año de creación de bandas que hayan realizado recitales
durante 2023, pero no hayan tocado durante 2022. */
select b.nombreBanda,  b.genero_musical,  b.año_creacion
from banda b
inner join Recital r on (b.codigoB = r.codigoB)
where r.fecha BETWEEN "2023/01/01" and "2023/12/31" and b.codigoB not in (
	select b.codigoB
	from banda b
	inner join Recital r on (b.codigoB = r.codigoB)
	where r.fecha BETWEEN "2022/01/01" and "2022/12/31"
)
/* 3. Listar el cronograma de recitales del día 04/12/2023. Se deberá listar nombre de la banda que
ejecutará el recital, fecha, hora, y el nombre y ubicación del escenario correspondiente. */
SELECT b.nombreBanda, r.fecha, r.hora, e.nombre_escenario, e.ubicacion
FROM banda b
INNER JOIN recital r ON (b.codigoB = r.codigoB)
INNER JOIN escenario e ON (e.nroEscenario = r.nroEscenario)
WHERE r.fecha = '2023-12-04'
/* 4. Listar DNI, nombre, apellido, email de integrantes que hayan tocado en el escenario con nombre
‘Gustavo Cerati’ y en el escenario con nombre ‘Carlos Gardel’. */ 
SELECT i.dni, i.nombre, i.apellido, i.email 
FROM integrante I
INNER JOIN recital r on (r.codigoB = I.codigoB)
INNER JOIN escenario e on (e.nroEscenario = r.nroEscenario)
WHERE e.nombre_escenario = ‘Gustavo Cerati’
INTERSECT
SELECT i.dni, i.nombre, i.apellido, i.email 
FROM integrante I
INNER JOIN recital r on (r.codigoB = I.codigoB)
INNER JOIN escenario e on (e.nroEscenario = r.nroEscenario)
WHERE e.nombre_escenario = ‘Carlos Gardel’

/* 5. Reportar nombre, género musical y año de creación de bandas que tengan más de 8 integrantes. */
SELECT b.nombreBanda, b.genero_musical, b.año_creacion
FROM Banda b
INNER JOIN Integrante i ON (B.codigoB = I.codigoB)
GROUP BY B.codigoB, b.nombreBanda, b.genero_musical, b.año_creacion
HAVING COUNT(*) > 8
/* 6. Listar nombre de escenario, ubicación y descripción de escenarios que solo tuvieron recitales
con el género musical rock and roll. Ordenar por nombre de escenario */
SELECT e.nombre_escenario, e.ubicacion, e.descripcion
FROM escenario e
INNER JOIN Recital r on (r.nroEscenario = e.nroEscenario)
WHERE 


/* Ejercicio 3
Banda = (codigoB, nombreBanda, genero_musical, año_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk)) */
