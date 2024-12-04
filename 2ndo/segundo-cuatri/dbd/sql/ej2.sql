/* 1. Listar especie, años, calle, nro y localidad de árboles podados por el podador ‘Juan Perez’ y por
el podador ‘Jose Garcia’. */
(SELECT DISTINCT A.especie, A.años, A.calle, A.nro, L.nombreL
FROM ARBOL A
INNER JOIN LOCALIDAD L ON (L.CODIGOPOSTAL = A.CODIGOPOSTAL)
INNER JOIN PODA P ON (A.NROARBOL = P.NROARBOL)
INNER JOIN PODADOR POD ON (POD.DNI = P.DNI)
WHERE (POD.NOMBRE = "JUAN" AND POD.APELLIDO = "PEREZ"))
INTERSECT 
(SELECT DISTINCT A.especie, A.años, A.calle, A.nro, L.nombreL
FROM ARBOL A
INNER JOIN LOCALIDAD L ON (L.CODIGOPOSTAL = A.CODIGOPOSTAL)
INNER JOIN PODA P ON (A.NROARBOL = P.NROARBOL)
INNER JOIN PODADOR POD ON (POD.DNI = P.DNI)
WHERE (POD.NOMBRE = "Jose" AND POD.APELLIDO = "Garcia"))
)
/* 2. Reportar DNI, nombre, apellido, fecha de nacimiento y localidad donde viven de aquellos
podadores que tengan podas realizadas durante 2023. */

SELECT DISTINCT POD.DNI, POD.nombre, POD.apellido, POD.FNAC, L.NOMBREL
FROM PODADOR POD
INNER JOIN LOCALIDAD L ON (L.CODIGOPOSTAL = POD.CODIGOPOSTALVIVE)
INNER JOIN PODA P ON (P.DNI = POD.DNI)
WHERE YEAR(P.FECHA) = 2023

/* 3. Listar especie, años, calle, nro y localidad de árboles que no fueron podados nunca. */
select a.especie, a.años, a.calle, a.nro, l.nombreL
from arbol a
inner join localidad l on a.codigoPostal = l.codigoPostal
where nroArbol not in (
	SELECT p.nroArbol
	from a
	poda p
)
/* 4. Reportar especie, años,calle, nro y localidad de árboles que fueron podados durante 2022 y no
fueron podados durante 2023. */
select a.especie, a.años, a.calle, a.nro, l.nombreL
from arbol a
inner join localidad l on a.codigoPostal = l.codigoPostal
inner join poda p on (A.NROARBOL = P.NROARBOL)
where YEAR (p.year) = 2022 and a.nroarbol not in (
	select a.nroarbol
	from arbol a
	inner join poda p on (A.NROARBOL = P.NROARBOL)
	where YEAR(P.YEAR) = 2023

)
/* 5. Reportar DNI, nombre, apellido, fecha de nacimiento y localidad donde viven de aquellos
podadores con apellido terminado con el string ‘ata’ y que tengan al menos una poda durante
2024. Ordenar por apellido y nombre. */
select p.DNI, p.nombre, p.apellido, p.fnac, l.nombreL
from podador p
inner join localidad l on (o.codigoPostalVive = l.codigoPostalVive)
where p.apellido LIKE "ata%" and p.dni in (
	select p.dni
	from poda p
	where Year(p.fecha) = 2024
)
order by p.DNI
/* 6. Listar DNI, apellido, nombre, teléfono y fecha de nacimiento de podadores que solo podaron
árboles de especie ‘Coníferas’. */
select p.DNI, p.nombre, p.apellido, p.fnac, p.telefono
from podador p
inner join poda pod on (p.dni = pod.dni)
inner join Arbol a on (a.nroArbol = pod.nroArbol)
where a.especia = Coníferas and p.DNI not in
(
SELECT p.DNI
FROM podador p
INNER JOIN poda pod ON (p.DNI = pod.DNI)
INNER JOIN arbol a ON (a.nroArbol = pod.nroArbol)
WHERE a.especie <> 'Coníferas'
)
/* 7. Listar especies de árboles que se encuentren en la localidad de ‘La Plata’ y también en la
localidad de ‘Salta’. */

SELECT a.especie
FROM arbol a
INNER JOIN localidad l ON (l.codigoPostal = a.codigoPostal)
WHERE l.nombreL = La Plata
INTERSECT
SELECT a.especie
FROM arbol a
INNER JOIN localidad l ON (l.codigoPostal = a.codigoPostal)
WHERE l.nombreL = Salta;
/* 8. Eliminar el podador con DNI 22234566. */

DELETE FROM podador WHERE DNI = 22234566
/* 9. Reportar nombre, descripción y cantidad de habitantes de localidades que tengan menos de 100
árboles. */
SELECT l.nombreL, l.descripcion, l.habitantes
FROM localidad l
INNER JOIN arbol a ON (a.codigoPostal = l.codigoPostal)
GROUP BY l.codigoPostal, l.nombreL, l.descripcion, l.habitantes
HAVING COUNT(*) < 100;
