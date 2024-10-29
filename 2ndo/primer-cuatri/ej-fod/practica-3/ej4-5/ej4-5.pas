
Program ej5y6;

Type 
  reg_flor = Record
    nombre: String[45];
    codigo: Integer;
  End;
  tArchFlores = file Of reg_flor;

Procedure agregarFlor (Var a: tArchFlores ; nombre: String; codigo:integer);

Var 
  c, nuevo: reg_flor;
Begin
  reset(a);
  read(a,c);
  nuevo.nombre := nombre;
  nuevo.codigo := codigo;
  If (c.codigo <> 0) Then
    Begin
      seek(a, -c.codigo);
      read(a,c);
      seek(a, filesize(a)-1);
      write(a,nuevo);
      seek(a, 0);
      write(a,c);
    End
  Else
    If (c.codigo = 0) Then
      Begin
        seek(a, filesize(a));
        write(a,nuevo);
      End;
  close(a);
End;
Procedure listarFlores(Var a: tArchFlores);

Var 
  c: reg_flor;
Begin
  reset(a);
  While Not eof(a) Do
    Begin
      read(a,c);
      If (c.codigo > 0) Then
        Begin
          writeln('Nombre: ', c.nombre);
          writeln('Codigo: ', c.codigo);
        End;
    End;
  close(a);
End;
Procedure eliminarFlor (Var a: tArchFlores; flor:reg_flor);

Var 
  cab,f: reg_flor;
  cumple: boolean;
Begin
  reset(a);
  read(a,cab);
  cumple := false;
  While (Not eof(a) And Not cumple) Do
    Begin
      read(a,f);
      If (f.codigo = flor.codigo) Then
        Begin
          cumple := true;
          seek(a, filepos(a)-1);
          write(a,cab);
          cab.codigo := -(filepos(a)-1);
          seek(a,0);
          write(a,cab);
        End;
    End;
  close(a);
End;

Var 
  a: tArchFlores;
  flor: reg_flor;
Begin
  assign(a, 'flores.dat');
  rewrite(a);
  // Agregar flores
  flor.codigo := 0;
  flor.nombre := '';
  agregarFlor(a,flor.nombre, flor.codigo);
  flor.codigo := 1;
  flor.nombre := 'Rosa';
  agregarFlor(a,flor.nombre, flor.codigo);

  flor.codigo := 2;
  flor.nombre := 'Tulipan';
  agregarFlor(a,flor.nombre, flor.codigo);

  flor.codigo := 3;
  flor.nombre := 'Margarita';
  agregarFlor(a,flor.nombre, flor.codigo);

  // Listar flores
  writeln('Flores antes de eliminar:');
  listarFlores(a);

  // Eliminar una flor
  flor.codigo := 2;
  eliminarFlor(a, flor);

  // Listar flores después de eliminar
  writeln('Flores después de eliminar:');
  listarFlores(a);
End.
