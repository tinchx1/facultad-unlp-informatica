















{
	
	Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados.
	De cada producto se almacena: código del producto, nombre, descripción, stock disponible,
	stock mínimo y precio del producto.
	Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se
	debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo
	maestro. La información que se recibe en los detalles es: código de producto y cantidad
	vendida. Además, se deberá informar en un archivo de texto: nombre de producto,
	descripción, stock disponible y precio de aquellos productos que tengan stock disponible por
	debajo del stock mínimo. Pensar alternativas sobre realizar el informe en el mismo
	procedimiento de actualización, o realizarlo en un procedimiento separado (analizar
	ventajas/desventajas en cada caso).

	Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle
	puede venir 0 o N registros de un determinado producto.
}

Program ej5;

Const 
  valoralto = 9999;
  dimf = 3;

Type 
  rango = 1..dimF;

  maestro = Record
    id: integer;
    nombre: string[20];
    descripcion: string[50];
    stockDisp: integer;
    stockMin: integer;
    precio: real;
  End;
  registro = Record
    id: integer;
    cantVendida: integer;
  End;
  archivoMaestro = file Of maestro;
  archivoDetalle = file Of registro;

  vectDetalles = array[rango] Of archivoDetalle;
  vectRegistros = array[rango] Of registro;
  vectString = array[rango] Of string;
Procedure leerMaestroTxt (Var arch: Text; Var M: maestro);
Begin
  readln(arch,M.id);
  readln(arch,M.nombre);
  readln(arch,M.descripcion);
  readln(arch,M.stockDisp,M.stockMin,M.precio);
  writeln('ID: ', M.id);
  writeln('Nombre: ', M.nombre);
  writeln('Descripcion: ', M.descripcion);
  writeln('Stock disponible: ', M.stockDisp);
  writeln('Stock minimo: ', M.stockMin);
  writeln('Precio: ', M.precio:0:2);
  writeln();
End;
Procedure generarArchivoMaestro(Var txt: Text ; Var arch: archivoMaestro);

Var 
  M: maestro;
Begin
  reset(txt);
  While Not eof(txt) Do
    Begin
      leerMaestroTxt(txt,M);
      write(arch,M);
    End;
  close(arch);
  close(txt);
End;
Procedure leerDetalleTxt (Var arch: Text ; Var R: registro);
Begin
  If Not eof(arch) Then
    Begin
      readln(arch,R.id);
      readln(arch,R.cantVendida);
      writeln('id: ', R.id);
      writeln('cantidad: ', R.cantVendida);
    End;
End;
Procedure generarDetalle ( Var arch: archivoDetalle; nombre: String);

Var 
  dat,txt: string;
  detalleTxt: Text;
  R: registro;
Begin
  txt := nombre + '.txt';
  assign(detalleTxt,txt);
  reset(detalleTxt);
  dat := nombre + '.dat';
  assign(arch,dat);
  rewrite(arch);
  While Not eof(detalleTxt) Do
    Begin
      leerDetalleTxt(detalleTxt,R);
      write(arch,R);
    End;
  writeln('Archivo detalle ',dat,' exitosamente creado');
  close(detalleTxt);
  close(arch);
End;
Procedure generarArchivosDetalles(Var V: vectDetalles );

Var 
  i: rango;
  vNombres: vectString;
Begin
  vNombres[1] := 'detalleUno';
  vNombres[2] := 'detalleDos';
  vNombres[3] := 'detalleTres';
  For i:= 1 To dimF Do
    generarDetalle(V[i],vNombres[i]);
  writeln('Se han generado todos los detalles.')
End;

Procedure imprimirMaestro( Var arch: archivoMaestro);

Var 
  M: maestro;
Begin
  reset(arch);
  While Not eof(arch) Do
    Begin
      read(arch,M);
      writeln('ID: ', M.id);
      writeln('Nombre: ', M.nombre);
      writeln('Descripcion: ', M.descripcion);
      writeln('Stock disponible: ', M.stockDisp);
      writeln('Stock minimo: ', M.stockMin);
      writeln('Precio: ', M.precio:0:2);
      writeln();
    End;
  close(arch);
End;
Procedure leerDetalle (Var arch:archivoDetalle; Var R: registro);
Begin
  If (Not eof(arch)) Then
    read(arch, R)
  Else
    R.id := valoralto;

End;
Procedure minimo (Var V: vectDetalles; Var min: registro; Var Vr: vectRegistros)
;

Var 
  i: rango;
  posMin: integer;
Begin
  min.id := valoralto;
  For i:= 1 To dimF Do
    Begin
      If (Vr[i].id < min.id) Then
        Begin
          min := Vr[i];
          posMin := i;
        End;
      If (min.id <> valoralto) Then
        leerDetalle(V[posMin],Vr[posMin]);
    End;
End;
Procedure actualizarMaestro(V: vectDetalles; Var archMaestro: archivoMaestro);

Var 
  min: registro;
  Vr: vectRegistros;
  M: maestro;
  i, aux,cant: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      reset(V[i]);
      read(V[i],Vr[i]);
    End;
  reset(archMaestro);
  minimo(V,min,Vr);
  While (min.id <> valoralto) Do
    Begin
      aux := min.id;
      cant := 0;
      While ((min.id <> valoralto) And (min.id = aux)) Do
        Begin
          cant := cant + min.cantVendida;
          minimo(V,min,Vr);
        End;
      read(archMaestro,M);
      While (M.id <> aux) Do
        read(archMaestro,M);
      M.stockDisp := M.stockDisp - cant;
      seek(archMaestro, filepos(archMaestro) - 1);
      write(archMaestro,M);
    End;
  close(archMaestro);
  For i:= 1 To dimF Do
    close(V[i]);
End;

Var 
  archMaestro: archivoMaestro;
  V: vectDetalles;
  txt: Text;
Begin
  assign(txt,'maestro.txt');
  assign(archMaestro,'maestro.dat');
  rewrite(archMaestro);
  generarArchivoMaestro(txt,archMaestro);
  generarArchivosDetalles(V);
  actualizarMaestro(V,archMaestro);
  imprimirMaestro(archMaestro);
End.
