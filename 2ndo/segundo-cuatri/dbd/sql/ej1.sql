/* Ejercicio 1
Cliente (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura (nroTicket, total, fecha, hora, idCliente (fk))
Detalle (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto (idProducto, nombreP, descripcion, precio, stock) */ 

/* 1. Listar datos personales de clientes cuyo apellido comience con el string ‘Pe’. Ordenar por DNI */

select  c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
from cliente c
where (c.apellido LIKE 'Pe%')
ORDER BY c.DNI

/* 2. Listar nombre, apellido, DNI, teléfono y dirección de clientes que realizaron compras solamente
durante 2017. */

select  c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
from cliente c INNER JOIN factura f ON (c.idCliente = f.idCliente)
where (f.fecha BETWEEN 01/01/2017 AND  31/12/2017)	
EXCEPT
select  c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
from cliente c INNER JOIN factura f ON (c.idCliente = f.idCliente)
where (f.fecha < 01/01/2017 AND  f.fecha > 31/12/2017)	
/* 3. Listar nombre, descripción, precio y stock de productos vendidos al cliente con DNI 45789456,
pero que no fueron vendidos a clientes de apellido ‘Garcia’. */
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM producto p
INNER JOIN detalle d ON (p.idProducto = d.idProducto)
INNER JOIN factura f ON (f.nroTicket = f.nroTicket)
INNER JOIN cliente c ON (c.idCliente = f.idCliente)
WHERE (c.DNI=45789456)
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM producto p
INNER JOIN detalle d ON (p.idProducto = d.idProducto)
INNER JOIN factura f ON (f.nroTicket = f.nroTicket)
INNER JOIN cliente c ON (c.idCliente = f.idCliente)
WHERE (c.apellido="Garcia")

*/ 4. Listar nombre, descripción, precio y stock de productos no vendidos a clientes que tengan
teléfono con característica 221 (la característica está al comienzo del teléfono). Ordenar por
nombre. */
SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM producto p
WHERE p.idProduct NOT IN (
SELECT p.idProducto
FROM producto p
INNER JOIN detalle d ON (p.idProducto = d.idProducto)
INNER JOIN factura f ON (f.nroTicket = f.nroTicket)
INNER JOIN cliente c ON (c.idCliente = f.idCliente)
WHERE (C.telefono LIKE '221%')
)
ORDER BY p.nombreP

/* 5. Listar para cada producto nombre, descripción, precio y cuantas veces fue vendido. Tenga en
cuenta que puede no haberse vendido nunca el producto. */
SELECT p.nombreP, p.descripcion, p.precio, SUM(d.cantidad) as CantVendida
FROM producto p
LEFT JOIN detalle d ON (p.idProducto = d.idProducto)
GROUP BY p.idProducto, p.nombreP, p.descripcion, p.precio

/* 6. Listar nombre, apellido, DNI, teléfono y dirección de clientes que compraron los productos con
nombre ‘prod1’ y ‘prod2’ pero nunca compraron el producto con nombre ‘prod3’. */
SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM cliente c
INNER JOIN factura f ON (C.idCliente = f.idCliente)
INNER JOIN detalle d ON (F.nroTicket= d.nroTicket)
INNER JOIN Producto P ON (p.idProducto = D.idProducto)
FROM P.nombreP IN ("prod1","prod2")
AND c.idCliente NOT IN (
SELECT c.idCliente
FROM cliente c
INNER JOIN factura f ON (C.idCliente = f.idCliente)
INNER JOIN detalle d ON (p.nroTicket= d.nroTicket)
INNER JOIN Producto P ON (p.idProducto = D.idProducto)
WHERE p.nombre = "PROD3"
)
GROUP BY c.idCLiente
HAVING COUNT(DISTINCT P.NOMBRE) = 2

/* 8. Agregar un cliente con los siguientes datos: nombre:’Jorge Luis’, apellido:’Castor’, DNI:
40578999, teléfono: ‘221-4400789’, dirección:’11 entre 500 y 501 nro:2587’ y el id de cliente:
500002. Se supone que el idCliente 500002 no existe. */
INSERT INTO cliente (idCliente, nombre, apellido, DNI, telefono, direccion) 
VALUES (500002, 'Jorge Luis', 'Castor', 40578999, '221-4400789', '11 entre 500 y 501 nro:2587')
/* 9. Listar nroTicket, total, fecha, hora para las facturas del cliente ´Jorge Pérez´ donde no haya
comprado el producto ´Z´. */
SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM FACTURA F
INNER JOIN CLIENTE C ON (C.IDCLIENTE = F.IDCLIENTE)
WHERE C.NOMBRE = JORE PEREZ AND F.NROTICKET NOT IN (
SELECT D.NROTICKET 
FROM DETALLE D ON (D.NROTICKET = F.NROTICKET)
INNER JOIN PRODUCT P ON (P.IDPRODUCTO = D.IDPRODUCTO)
WHERE (P.NOMBREP = "Z"))

/* 10. Listar DNI, apellido y nombre de clientes donde el monto total comprado, teniendo en cuenta
todas sus facturas, supere $10.000.000. */
SELECT c.nombre, c.apellido, c.DNI
FROM cliente c
inner join facturas f on (f.idCliente = c.idCLiente)
group by c.idCliente
HAVING SUM(f.total) > 100000


/* Ejercicio 1
Cliente (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura (nroTicket, total, fecha, hora, idCliente (fk))
Detalle (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto (idProducto, nombreP, descripcion, precio, stock) */ 
