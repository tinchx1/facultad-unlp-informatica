

/* 1. Listar razón social, dirección y teléfono de agencias que realizaron viajes desde la ciudad de ‘La
Plata’ (ciudad origen) y que el cliente tenga apellido ‘Roma’. Ordenar por razón social y luego por
teléfono. */
SELECT a.RAZON_SOCIAL, a.direccion, a.telef
FROM agencia a
INNER JOIN viaje v ON (a.RAZON_SOCIAL = v.razon_social)
INNER JOIN ciudad c ON (v.cpOrigen = c.CODIGOPOSTAL)
INNER JOIN cliente cli ON (cli.DNI = v.DNI)
WHERE (c.nombreCiudad = 'La Plata' AND cli.apellido = 'Roma')
ORDER BY a.RAZON_SOCIAL, a.telef

/* 2. Listar fecha, hora, datos personales del cliente, nombres de ciudades origen y destino de viajes
realizados en enero de 2019 donde la descripción del viaje contenga el String ‘demorado’. */
SELECT v.fecha, v.HORA, c.DNI, c.nombre, c.apellido, c.telefono, c.direccion,origen.nombreCiudad, destino.nombreCiudad
FROM viaje v
INNER JOIN ciudad origen on (origen.CODIGOPOSTAL = v.cpOrigen)
INNER JOIN ciudad destino on (destino.CODIGOPOSTAL = v.cpDestino)
INNER JOIN cliente c on (c.dni = v.dni)
WHERE (v.fecha BETWEEN '2019-01-01' and '2019-01-31') and (v.descripcion LIKE "%demorado%")

/* 3. Reportar información de agencias que realizaron viajes durante 2019 o que tengan dirección de
mail que termine con ‘@jmail.com’. */
SELECT a.direccion, a.telef, a.e-mail, a.razon_social
FROM AGENCIA a
INNER JOIN VIAJE V ON (V.RAZON_SOCIAL = A.RAZON_SOCIAL)
WHERE (YEAR(V.FECHA) = 2019) OR (A.EMAIL like "%@jmail.com")

/* 4. Listar datos personales de clientes que viajaron solo con destino a la ciudad de ‘Coronel
Brandsen’ */ 



/* Ejercicio 5
AGENCIA = (RAZON_SOCIAL, dirección, telef, e-mail)
CIUDAD = (CODIGOPOSTAL, nombreCiudad, añoCreación)
CLIENTE = (DNI, nombre, apellido, teléfono, dirección)
VIAJE = (FECHA, HORA, DNI (fk), cpOrigen(fk), cpDestino(fk), razon_social(fk), descripcion)
//cpOrigen y cpDestino corresponden a la ciudades origen y destino del viaje */

