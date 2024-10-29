
Program pipipi;

Type 
  tnovela = Record
    codigo: longint;
    nombre: string[40];
    genero: string[20];
    precio: real;
  End;

  tarch = file Of tnovela;

Procedure imprimirNovela(novela:tnovela);
Begin
  writeln('Codigo: ',novela.codigo,
          ', Nombre:',novela.nombre,
          ', Genero:',novela.genero,
          ', Stock precio:',novela.precio:0:2
  );
End;

Procedure leerNovela(Var novela:tnovela);
Begin
  writeln;
  write('Ingrese codigo: ');
  readln(novela.codigo);
  write('Ingrese nombre: ');
  readln(novela.nombre);
  write('Ingrese genero: ');
  readln(novela.genero);
  write('Ingrese precio: ');
  readln(novela.precio);
End;

Procedure cargar(Var arch:tarch);

Var 
  nombre: string;
  txt: Text;
  novela: tnovela;
Begin
  writeln;
  writeln('Cargando datos desde "novelas.txt".');
  write('Ingrese el nombre del archivo binario: ');
  readln(nombre);
  assign(arch, nombre);
  rewrite(arch);
  assign(txt,'novelas.txt');
  {$I-}
  // desactiva el manejo automático de errores
  reset(txt);
  {$I+}
  // reactiva el manejo automático de errores
  If IOResult <> 0 Then
    Begin
      writeln('Error: no se pudo abrir el archivo "novelas.txt".');
      exit;
    End;
  leerNovela(novela);
  While (Not eof(txt)) Do
    Begin
      readln(txt,novela.codigo,novela.precio,novela.genero);
      readln(txt,novela.nombre);
      write(arch, novela);
      leerNovela(novela);
    End;
  close(txt);
  close(arch);
End;


Procedure agregar(Var arch:tarch);

Var 
  novela: tnovela;
  opcion: string;
Begin
  reset(arch);
  seek(arch, filesize(arch));
  leerNovela(novela);
  While (True) Do
    Begin
      write(arch, novela);
      writeln;
      write('Desea ingresar otra novela [s/n]?');
      readln(opcion);
      If (opcion = 'n') Then
        break
      Else
        leerNovela(novela);
    End;
  close(arch);
End;

Procedure modificar(Var arch:tarch);

Var 
  cod: integer;
  novela: tnovela;
  cumple: boolean;
Begin
  writeln('ingrese cod novela a modificar');
  readln(cod);
  reset(arch);
  cumple := true;
  While (Not eof(arch) And cumple) Do
    Begin
      read(arch,novela);
      If (novela.codigo = cod) Then
        Begin
          leerNovela(novela);
          seek(arch, filePos(arch) -1);
          write(arch, novela);
          cumple := false;
        End;
    End;
  close(arch)
End;

Procedure mostrar(Var arch:tarch);

Var 
  novela: tnovela;
Begin
  reset(arch);
  writeln;
  writeln('Las novelas cargadas son: ');
  While (Not eof(arch)) Do
    Begin
      read(arch,novela);
      imprimirNovela(novela);
    End;
  close(arch);
End;

Procedure exportar(Var arch:tarch);

Var 
  txt: Text;
  novela: tnovela;
Begin
  assign(txt,'novelas.txt');
  rewrite(txt);
  reset(arch);
  While (Not eof(arch)) Do
    Begin
      read(arch, novela);
      writeln(txt,novela.codigo,' ',novela.precio:0:2,' ',novela.genero);
      writeln(txt,novela.nombre);
    End;
  close(arch);
  close(txt);
End;

Procedure runMenu(Var arch:tarch);

Var 
  opcion: string;
Begin
  While (True) Do
    Begin
      writeln;
      writeln('Ingrese la operacion deseada:');
      writeln('1 - Cargar datos.');
      writeln('2 - Agregar novela.');
      writeln('3 - Modificar novela.');
      writeln('4 - Mostrar novelas cargadas.');
      writeln('5 - Exportar datos.');
      writeln('6 - Finalizar programa.');
      write('--> ');
      readln(opcion);
      Case opcion Of 
        '1': cargar(arch);
        '2': agregar(arch);
        '3': modificar(arch);
        '4': mostrar(arch);
        '5': exportar(arch);
        '6': break;
        Else
          writeln('La operacion ingresada es invalida.');
      End;
    End;
End;

Var 
  arch: tarch;
Begin
  cargar(arch);
  runMenu(arch);
End.
