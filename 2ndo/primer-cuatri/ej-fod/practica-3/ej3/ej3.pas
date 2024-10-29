
Program ej3;

Type 
  str20 = string[20];
  novelas = Record
    id: integer;
    genero: str20;
    nombre: str20;
    director: str20;
    duracion: integer;
    precio: real;
  End;
  archivo = file Of novelas;

Procedure leerNovela(Var r:novelas);
Begin
  writeln('Ingrese el id de la novela');
  readln(r.id);
  If (r.id <> -1) Then
    Begin
      writeln('Ingrese el genero de la novela');
      readln(r.genero);
      writeln('Ingrese el nombre de la novela');
      readln(r.nombre);
      writeln('Ingrese el director de la novela');
      readln(r.director);
      writeln('Ingrese la duracion de la novela');
      readln(r.duracion);
      writeln('Ingrese el precio de la novela');
      readln(r.precio);
    End;
End;

Procedure cargarArchivo(Var a:archivo);

Var 
  name: string;
  r: novelas;
Begin
  r.id := 0;
  r.genero := '';
  r.nombre := '';
  r.director := '';
  r.duracion := 0;
  r.precio := 0;
  writeln('Ingrese el nombre del archivo');
  readln(name);
  assign(a, name);
  rewrite(a);
  write(a, r);
  leerNovela(r);
  While (r.id <> -1) Do
    Begin
      write(a, r);
      leerNovela(r);
    End;
  close(a);
End;

Procedure agregarNovela(Var a:archivo);

Var 
  r, c: novelas;
Begin
  leerNovela(r);
  reset(a);
  read(a, c);
  If (c.id <> 0) Then
    Begin
      seek(a, -c.id);
      read(a, c);
      seek(a, filepos(a)-1);
      write(a, r);
      seek(a, 0);
      write(a, c);
    End
  Else
    Begin
      seek(a, filesize(a));
      write(a, r);
    End;
End;

Procedure modificarNovela(Var a:archivo);

Var 
  r, act: novelas;
Begin
  leerNovela(r);
  reset(a);
  read(a, act);
  While ((Not eof(a)) And (act.id <> r.id)) Do
    Begin
      read(a, act);
      If (act.id = r.id) Then
        Begin
          seek(a, filepos(a)-1);
          write(a, r);
        End;
    End;
  If (act.id <> r.id) Then
    writeln('No se encontro la novela');
  close(a);
End;

Procedure eliminar(Var a:archivo);

Var 
  c, r: novelas;
  id: integer;
  encontro: boolean;
Begin
  encontro := false;
  writeln('Ingrese el id de la novela a eliminar');
  readln(id);
  reset(a);
  read(a, c);
  read(a, r);
  While (Not eof(a) And Not encontro) Do
    Begin
      If (r.id = id) Then
        Begin
          encontro := true;
          seek(a, filepos(a)-1);
          write(a, c);
          c.id := filepos(a) - 1;
          seek(a, 0);
          write(a, c);
        End;
      read(a, r);
    End;
  If (Not encontro) Then
    writeln('No se encontro la novela');
  close(a);
End;
Procedure exportarATexto(Var arch: archivo);

Var 
  archivoTexto: Text;
  N: novelas;
Begin
  assign(archivoTexto, 'novelas.txt');
  rewrite(archivoTexto);
  reset(arch);
  While Not eof(arch) Do
    Begin
      read(arch, N);
      writeln(archivoTexto, 'id: ', N.id);
      writeln(archivoTexto, 'genero: ', N.genero);
      writeln(archivoTexto, 'nombre: ', N.nombre);
      writeln(archivoTexto, 'duracion: ', N.duracion);
      writeln(archivoTexto, 'director: ', N.director);
      writeln(archivoTexto, 'precio: ', N.precio:0:2);
      writeln(archivoTexto, '------------');
    End;
  close(archivoTexto);
  close(arch);
  writeln('Contenido exportado a "novelas.txt".');
End;

Var 
  novela: archivo;
  opcion: char;
Begin
  Repeat
    writeln('Seleccione una opcion:');
    writeln('1. Crear archivo de novelas');
    writeln('3. Eliminar novela');
    writeln('4. Modificar novela');
    writeln('5. Agregar novela');
    writeln('6. Exportar novelas');
    writeln('7. Salir');
    readln(opcion);
    Case opcion Of 
      '1': cargarArchivo(novela);
      '3': eliminar(novela);
      '4': modificarNovela(novela);
      '5': agregarNovela(novela);
      '6': exportarATexto(novela);
      '7': writeln('Saliendo del programa...');
      Else
        writeln('Opcion inválida.');
    End;
  Until opcion = '7';
End.
