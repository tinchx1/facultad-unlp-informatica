
Program e7;

Type 
  especie = Record
    codigo: integer;
    nombre: string[50];
    familia: string[25];
    descripcion: string[100];
    zona_geografica: string[50];
  End;
  arch_especies = file Of especie;
Procedure leerEspecie(Var arch:Text ; Var E: especie);
Begin
  readln(arch, E.codigo);
  readln(arch, E.nombre);
  readln(arch, E.familia);
  readln(arch, E.descripcion);
  readln(arch, E.zona_geografica);
  writeln();
End;
Procedure convertirArchivo(Var txt: Text; Var arch: arch_especies);

Var 
  E: especie;
Begin
  Reset(txt);
  Assign(arch,'maestro.dat');
  Rewrite(arch);
  While Not Eof(txt) Do
    Begin
      leerEspecie(txt,E);
      Write(arch,E);
    End;
  Close(txt);
End;
Procedure imprimirArchivo(Var arch: arch_especies);

Var 
  E: especie;
Begin
  Reset(arch);
  While Not Eof(arch) Do
    Begin
      Read(arch,E);
      writeln('Codigo: ', E.codigo);
      writeln('Nombre: ', E.nombre);
      writeln('Familia: ', E.familia);
      writeln('Descripcion: ', E.descripcion);
      writeln('Zona: ', E.zona_geografica);
      writeln('--------------');
    End;
  Close(arch);
End;

Procedure marcarEspecie(Var arch: arch_especies; codigo: integer; Var encontrado
                        : boolean);

Var 
  E: especie;
Begin
  encontrado := False;
  Reset(arch);
  While (Not eof(arch) And Not encontrado) Do
    Begin
      Read(arch, E);
      If E.codigo = codigo Then
        Begin
          encontrado := True;
          E.codigo := -1;
          seek(arch, filepos(arch) - 1);
          write(arch, E);
        End;
    End;
  If Not encontrado Then
    writeln('No se encontro la especie');
  Close(arch);
End;

Procedure eliminarEspecie(Var arch: arch_especies; codigo: integer);

Var 
  ultimo, e: especie;
  encontrado: boolean;
Begin
  encontrado := False;
  reset(arch);
  seek(arch, filesize(arch) - 1);
  read(arch, ultimo);
  seek(arch, 0);
  While (Not eof(arch) And Not encontrado) Do
    Begin
      read(arch, e);
      If e.codigo = codigo Then
        Begin
          encontrado := True;
          seek(arch, filepos(arch) - 1);
          write(arch, ultimo);
        End;
    End;
  seek(arch, filesize(arch) - 1);
  truncate(arch);
  close(arch);
End;
Procedure eliminarEspecies(Var arch: arch_especies);

Var 
  cod: integer;
  encontrado: boolean;
Begin
  writeln('Ingrese el codigo de la especie a marcar');
  readln(cod);
  While cod <> 5000 Do
    Begin
      marcarEspecie(arch, cod, encontrado);
      If encontrado Then
        eliminarEspecie(arch, cod);
      writeln('Ingrese el codigo de la especie a marcar');
      readln(cod);
    End;
End;

Var 
  txtMaestro: Text;
  datMaestro: arch_especies;
Begin
  Assign(txtMaestro,'maestro.txt');
  convertirArchivo(txtMaestro,datMaestro);
  WriteLn('---- ARCHIVO ORIGINAL ----');
  imprimirArchivo(datMaestro);
  WriteLn('Comenzado proceso de borrado...');
  eliminarEspecies(datMaestro);
  WriteLn('---- ARCHIVO CON ELIMINACIONES ----');
  imprimirArchivo(datMaestro);
End.
