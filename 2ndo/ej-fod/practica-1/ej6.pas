
Program test;

Type 
  tcelular = Record
    codigo: integer;
    precio: real;
    marca: string[15];
    disponible: integer;
    minimo: integer;
    descripcion: string[30];
    nombre: string[20];
  End;

  tarch = file Of tcelular;

Procedure imprimirCelular(celular:tcelular);
Begin
  writeln('Codigo: ',celular.codigo,
          ', Precio:',celular.precio:0:2,
          ', Marca:',celular.marca,
          ', Stock disponible:',celular.disponible,
          ', Stock minimo:',celular.minimo,
          ', Descripcion:',celular.descripcion,
          ', Nombre:',celular.nombre
  );
End;

Procedure leerCelular(Var celular:tcelular);
Begin
  writeln;
  writeln('Ingrese codigo: ');
  readln(celular.codigo);
  If (celular.codigo <> -1) Then
    Begin
      writeln('Ingrese precio: ');
      readln(celular.precio);
      writeln('Ingrese marca: ');
      readln(celular.marca);
      writeln('Ingrese stock disponible: ');
      readln(celular.disponible);
      writeln('Ingrese stock minimo: ');
      readln(celular.minimo);
      writeln('Ingrese descripcion: ');
      readln(celular.descripcion);
      writeln('Ingrese nombre: ');
      readln(celular.nombre);
    End;
End;
Procedure crearArchivo(Var a: tarch);

Var 
  txt: Text;
  nombre: string;
  celular: tcelular;
Begin
  writeln('Ingrese nombre del archivo');
  readln(nombre);
  assign(a, nombre);
  rewrite(a);
  assign(txt, 'celulares.txt');
  rewrite(txt);
  leerCelular(celular);
  While (celular.codigo <> -1) Do
    Begin
      writeln(txt, celular.codigo, celular.precio, celular.marca);
      writeln(txt, celular.disponible, celular.minimo, celular.descripcion);
      writeln(txt, celular.nombre);
      write(a, celular);
      leerCelular(celular);
    End;
  close(a);
  close(txt);
End;
Procedure opcionD(Var a: tarch);

Var 
  txt: Text;
  celular: tcelular;
Begin
  reset(a);
  assign(txt, 'celulares.txt');
  rewrite(txt);
  leerCelular(celular);
  While (Not eof(a)) Do
    Begin
      read(a, celular);
      write(txt, celular.codigo, celular.precio, celular.marca);
      write(txt, celular.disponible, celular.minimo, celular.descripcion);
      write(txt, celular.nombre);
    End;
  close(a);
  close(txt);
End;
Procedure opcionB(Var a: tarch);

Var 
  celular: tcelular;
Begin
  reset(a);
  While (Not eof(a)) Do
    Begin
      read(a, celular);
      If (celular.minimo > celular.disponible) Then
        imprimirCelular(celular)
    End;
End;
Procedure opcionC(Var a: tarch);

Var 
  celular: tcelular;
  texto: string;
Begin
  writeln('ingrese descripcion');
  readln(texto);
  reset(a);
  While (Not eof(a)) Do
    Begin
      read(a, celular);
      If (celular.descripcion = texto) Then
        imprimirCelular(celular)
    End;
End;
Procedure opcionE(Var a: tarch);

Var 
  celular: tcelular;
  cantidad,i : integer;
Begin
  reset(a);
  seek(a, fileSize(a));
  writeln('Ingrese la cantidad de celulares a añadir: ');
  readln(cantidad);
  For i := 1 To cantidad Do
    Begin
      leerCelular(celular);
      write(a, celular);
    End;
  close(a);
End;
Procedure opcionF(Var a: tarch);

Var 
  celular: tcelular;
  codigo: integer;
  encontrado: boolean;
Begin
  encontrado := false;
  writeln('Ingrese codigo del celular a modificar: ');
  readln(codigo);
  reset(a);
  While (Not eof(a)) And (Not encontrado) Do
    Begin
      read(a, celular);
      If (celular.codigo = codigo) Then
        Begin
          encontrado := true;
          writeln('Ingrese nuevo stock disponible: ');
          readln(celular.disponible);
          seek(a, filePos(a) - 1);
          write(a, celular);
          writeln('Stock modificado exitosamente.');
        End;
    End;
  close(a);
  If (Not encontrado) Then
    writeln('Celular no encontrado.');
End;
Procedure opcionG(Var a: tarch);

Var 
  txt: Text;
  celular: tcelular;
Begin
  reset(a);
  assign(txt, 'SinStock.txt');
  rewrite(txt);
  While (Not eof(a)) Do
    Begin
      read(a, celular);
      If (celular.disponible = 0) Then
        writeln(txt, celular.codigo, celular.precio, celular.marca,
                celular.disponible, celular.minimo, celular.descripcion,
                celular.nombre);
    End;
  close(a);
  close(txt);
End;

Var 
  opcion: char;
  archivo: tarch;
Begin
  Repeat
    writeln('Menu:');
    writeln('a. Crear archivo de registros de celulares');
    writeln('b. Listar celulares con stock menor al minimo');
    writeln('c. Listar celulares por descripcion');
    writeln('d. Exportar archivo a texto');
    writeln('e. Anadir uno o más celulares');
    writeln('f. Modificar el stock de un celular dado');
    writeln('g. Exportar archivo a SinStock.txt');
    writeln('h. Salir');
    write('Ingrese opcion: ');
    readln(opcion);
    Case opcion Of 
      'a': crearArchivo(archivo);
      'b': opcionB(archivo);
      'c': opcionC(archivo);
      'd': opcionD(archivo);
      'e': opcionE(archivo);
      'f': opcionF(archivo);
      'g': opcionG(archivo);
      'h': writeln('Saliendo...');
      Else
        writeln('Opcion no valida');
    End;

  Until (opcion = 'h');

End.
