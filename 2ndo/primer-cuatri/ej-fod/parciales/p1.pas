
{Una empresa dedicada a la venta de golosinas posee un archivo que contiene información sobre los productos que tiene a la venta. De cada producto se registran los siguientes datos: código de producto, nombre comercial, precio de venta, stock actual y stock mínimo. La empresa cuenta con 20 sucursales. Diariamente se recibe un archivo detalle de cada una de las 20 sucursales de la empresa que indica las ventas diarias efectuadas por cada sucursal. De cada venta se registra código de producto y cantidad vendida. Se debe realizar un procedimiento que actualice el stock en el archivo maestro con la información disponible en los archivos detalles y que además informe en un archivo de texto aquellos productos cuyo monto total vendido en el día supere los $10000. En el archivo de texto a exportar, por cada producto incluido, se deben informar todos sus datos. Los datos de un producto se deben organizar en el archivo de texto para facilitar el uso eventual del mismo como un archivo de carga. El objetivo del ejercicio es escribir el procedimiento solicitado, junto con las estructuras de datos y módulos usados en el mismo.

NOTAS:

Todos los archivos se encuentran ordenados por codigo de producto.

En un archivo detalle pueden haber 0, 1 o N registros de un producto determinado.

Cada archivo detalle sólo contiene productos que seguro existen en el archivo maestro.

Los archivos se deben recorrer una sóla vez. En el mismo recorrido, se debe realizar la actualización del archivo maestro con los archivos detalles, así como la generación del archivo de texto solicitado.

Una empresa dedicada a la venta de golosinas posee un archivo que contiene información sobre los productos que tiene a la venta. De cada producto se registran los siguientes datos: código de producto, nombre comercial, precio de venta, stock actual y stock mínimo. La empresa cuenta con 20 sucursales. Diariamente se recibe un archivo detalle de cada una de las 20 sucursales de la empresa que indica las ventas diarias efectuadas por cada sucursal. De cada venta se registra código de producto y cantidad vendida. Se debe realizar un procedimiento que actualice el stock en el archivo maestro con la información disponible en los archivos detalles y que además informe en un archivo de texto aquellos productos cuyo monto total vendido en el día supere los $10000. En el archivo de texto a exportar, por cada producto incluido, se deben informar todos sus datos. Los datos de un producto se deben organizar en el archivo de texto para facilitar el uso eventual del mismo como un archivo de carga. El objetivo del ejercicio es escribir el procedimiento solicitado, junto con las estructuras de datos y módulos usados en el mismo.

NOTAS:

Todos los archivos se encuentran ordenados por codigo de producto.

En un archivo detalle pueden haber 0, 1 o N registros de un producto determinado.

Cada archivo detalle sólo contiene productos que seguro existen en el archivo maestro.

Los archivos se deben recorrer una sóla vez. En el mismo recorrido, se debe realizar la actualización del archivo maestro con los archivos detalles, así como la generación del archivo de texto solicitado.

}

Program p1;

Const 
  valorAlto = 9999;
  N = 20;

Type 
  producto = Record
    cod: integer;
    nombre: string[10];
    precio: real;
    stock_act: integer;
    stock_min: integer;
  End;

  venta = Record
    cod: integer;
    cant: integer;
  End;

  maestro = file Of producto;
  detalle = file Of venta;

  vectDetalles = array [1..N] Of detalle;
  vectVentas = array [1..N] Of venta;

Procedure leerDetalle(Var a: detalle; Var v: venta);
Begin
  If (Not eof(a)) Then
    read(a,v)
  Else
    v.cod := valorAlto;
End;
Procedure minimo(Var d: vectDetalles; Var v: vectVentas; Var min: venta);

Var 
  minIn, i: Integer;
Begin
  min.cod := valorAlto;
  For I:= 1 To N Do
    Begin
      If (v[i].cod < min.cod) Then
        Begin
          min := v[i];
          minIn := i;
        End;
    End;
  If (min.cod <> valorAlto) Then
    leerDetalle(d[minIn], v[minIn]);
End;

Procedure actualizar_informat(Var m: maestro;Var d: vectDetalles;Var txt: Text);

Var 
  min: venta;
  gasto: real;
  prodM: producto;
  v: vectVentas;
  i: integer;
Begin
  assign(txt, 'archivo.txt');
  rewrite(txt);
  assign(m, 'maestro');
  reset(m);
  For i:= 1 To N Do
    Begin
      assign(d[i], 'detalle' + IntToStr(i));
      reset(d[i]);
      leerDetalle(d[i], v[i]);
    End;
  minimo(d,v,min);
  While (min.cod <> valorAlto) Do
    Begin
      read(m,prodM);
      While (prodM.cod <> min.cod) Do
        read(m,prodM);
      gasto := 0;
      While ((min.cod <> valorAlto) And (min.cod = prodM.cod)) Do
        Begin
          gasto := gasto + (min.cant * prodM.precio);
          prodM.stock_act := prodM.stock_act - min.cant;
          minimo(d, v, min);
        End;
      seek(m, filepos(m) - 1);
      write(m, prodM);
      If (10000 > gasto) Then
        writeln(txt, prodM.cod, ' ', prodM.nombre, ' ', prodM.precio:0:2, ' ',
                prodM.stock_act, ' ', prodM.stock_min)
    End;
  For i:= 1 To N Do
    close(d[i]);
  close(m);
  close(txt);
End;


Var 
  txt: Text;
  m: maestro;
  d: vectDetalles;
Begin
  actualizar_informat(m,d,txt);
End.
