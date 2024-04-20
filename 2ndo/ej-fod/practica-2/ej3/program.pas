






{El encargado de ventas de un negocio de productos de limpieza desea administrar el stock
de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los
productos que comercializa. De cada producto se maneja la siguiente información: código de
producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se
genera un archivo detalle donde se registran todas las ventas de productos realizadas. De
cada venta se registran: código de producto y cantidad de unidades vendidas. Se pide
realizar un programa con opciones para:
a. Actualizar el archivo maestro con el archivo detalle, sabiendo que:
● Ambos archivos están ordenados por código de producto.
● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del
archivo detalle.
● El archivo detalle sólo contiene registros que están en el archivo maestro.
b. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo
stock actual esté por debajo del stock mínimo permitido}

Program ej3;

Const 
  numAlto = 9999;

Type 
  producto = Record
    cod: integer;
    nombre: string;
    precio: real;
    stockActual: integer;
    stockMin: integer;
  End;
  detalle = Record
    cod: integer;
    cantVendida: integer;
  End;
  maestro = file Of producto;
  detalleF = file Of detalle;

Procedure generarMaestro(Var m:maestro; Var txtm: Text);

Var 
  p: producto;
Begin
  reset(m);
  reset(txtm);
  While (Not eof(txtm)) Do
    Begin
      readln(txtm, p.cod, p.nombre);
      readln(txtm, p.precio, p.stockActual, p.stockMin);
      write(m, p);
    End;
End;
Procedure generarDetalle(Var d:detalleF; Var txtd: Text);

Var 
  p: detalle;
Begin
  reset(d);
  reset(txtd);
  While (Not eof(txtd)) Do
    Begin
      readln(txtd, p.cod, p.cantVendida);
      write(d, p);
    End;
End;
Procedure actualizarMaestro(Var m:maestro; Var d:detalleF);
Procedure leerDetalle(Var d:detalle; Var df:detalleF);
Begin
  If (Not eof(df)) Then
    read(df, d)
  Else
    d.cod := numAlto;
End;

Var 
  p: producto;
  det: detalle;
Begin
  reset(m);
  reset(d);
  leerDetalle(det, d);
  While (det.cod <> numAlto) Do
    Begin
      read(m, p);
      While (det.cod <> p.cod) Do
        read(m, p);
      While ((det.cod = p.cod) And (det.cod <> numAlto)) Do
        Begin
          p.stockActual := p.stockActual - det.cantVendida;
          leerDetalle(det, d);
        End;
      seek(m, filepos(m) - 1);
      write(m, p);
    End;
  close(m);
  close(d);
End;
Procedure listarStockMinimo(Var m:maestro; Var txtm: Text);

Var 
  p: producto;
Begin
  reset(m);
  assign(txtm, 'stock_minimo.txt');
  rewrite(txtm);
  While (Not eof(m)) Do
    Begin
      read(m, p);
      If (p.stockActual < p.stockMin) Then
        writeln(txtm, p.cod, ' ', p.nombre, ' ', p.stockActual, ' ', p.stockMin)
      ;
    End;
  close(m);
  close(txtm);
End;

Var 
  stock_minimo: Text;
  m: maestro;
  d: detalleF;
  txtm, txtd: Text;
Begin
  assign(m, 'maestro.dat');
  assign(d, 'detalle.dat');
  rewrite(m);
  rewrite(d);
  assign(txtm, 'maestro.txt');
  assign(txtd, 'detalle.txt');
  assign(stock_minimo, 'stock_minimo.txt');
  generarMaestro(m, txtm);
  generarDetalle(d, txtd);
  actualizarMaestro(m, d);
  listarStockMinimo(m, stock_minimo);
End.
