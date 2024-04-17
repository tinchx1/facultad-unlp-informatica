
Program ej2;

Type 
  archivo_enteros = file Of integer;
Procedure crearArchivo(Var a: archivo_enteros);

Var 
  num: integer;
  nombre: String;
Begin
  writeln('ingrese nombre del archivo');
  readln(nombre);
  writeln('ingrese entero');
  readln(num);
  assign(a, nombre);
  rewrite(a);
  While (30000 <> num) Do
    Begin
      write(a, num);
      writeln('ingrese entero');
      readln(num);
    End;
  close(a)
End;
Procedure informar(Var a: archivo_enteros);

Var 
  menores, num, canttotal, suma: integer;
  promedio: real;
Begin
  reset(a);
  menores := 0;
  canttotal := 0;
  suma := 0;
  While (Not eof(a)) Do
    Begin
      read(a,num);
      writeln(num);
      canttotal := canttotal + 1;
      suma := suma + num;
      If (num  < 1500) Then
        menores := menores + 1;
    End;
  promedio := (suma/canttotal);
  writeln('El promedio es de ', promedio);
  writeln('La cantidad menor es de ', menores);
  close(a);
End;

Var 
  arch: archivo_enteros;
Begin
  crearArchivo(arch);
  informar(arch);
End.
