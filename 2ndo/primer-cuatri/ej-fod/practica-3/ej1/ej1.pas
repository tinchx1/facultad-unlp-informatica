
Program ej3;

Type 
  empleado = Record
    num: integer;
    apellido: string;
    nombre: string;
    edad: integer;
    dni: integer;
  End;

  file_empleados = file Of empleado;

Procedure leerEmpleado(Var e:empleado);
Begin
  write('Ingrese apellido de empleado: ');
  readln(e.apellido);
  If (e.apellido<>'fin') Then
    Begin
      write('Ingrese nombre de empleado: ');
      readln(e.nombre);
      write('Ingrese numero de empleado: ');
      readln(e.num);
      write('Ingrese edad de empleado: ');
      readln(e.edad);
      write('Ingrese dni de empleado: ');
      readln(e.dni);
    End;
End;

Procedure escribirEmpleado(e: empleado);
Begin
  writeln(' Numero: ',e.num,
          ' Apellido: ',e.apellido,
          ' Nombre: ',e.nombre,
          ' Edad: ',e.edad,
          ' DNI: ',e.dni
  );
End;
Procedure crearArchivo(Var a: file_empleados);

Var 
  empl: empleado;
  nombre: string;
Begin
  writeln('ingrese nombre file');
  readln(nombre);
  assign(a, nombre);
  rewrite(a);
  leerEmpleado(empl);
  While (empl.apellido <> 'fin') Do
    Begin
      write(a, empl);
      leerEmpleado(empl);
    End;
  close(a);
End;

Procedure mostrarDeterminado(Var a: file_empleados);

Var 
  id: string;
  emp: empleado;
Begin
  writeln('ingrese nombre o apellido a buscar');
  readln(id);
  reset(a);
  While (Not eof(a)) Do
    Begin
      read(a, emp);
      If ((emp.nombre = id) Or (emp.apellido = id)) Then
        escribirEmpleado(emp);
    End;
  close(a);
End;

Procedure mostrarMayores(Var a: file_empleados);

Var 
  emp: empleado;
Begin
  reset(a);
  While (Not eof(a)) Do
    Begin
      read(a, emp);
      If (emp.edad > 70) Then
        escribirEmpleado(emp);
    End;
  close(a);
End;
Procedure mostrartodos(Var a: file_empleados);

Var 
  emp: empleado;
Begin
  reset(a);
  While (Not eof(a)) Do
    Begin
      read(a, emp);
      escribirEmpleado(emp);
    End;
  close(a);
End;

Procedure agregar(Var a: file_empleados);
Procedure unidad(Var a: file_empleados; id: integer; Var result: boolean);

Var 
  emp: empleado;
Begin
  reset(a);
  read(a, emp);
  While (Not eof(a)) Do
    Begin
      If (id = emp.num) Then
        result := false;
      read(a, emp);
    End;
  result := true;
End;

Var 
  emp: empleado;
  result: boolean;
Begin
  leerEmpleado(emp);
  reset(a);
  seek(a, fileSize(a));
  While (emp.apellido <> 'fin') Do
    Begin
      unidad(a, emp.num, result);
      If (result) Then
        write(a, emp);
      leerEmpleado(emp);
    End;
  close(a);
End;

Procedure modificarEdad(Var a: file_empleados);

Var 
  emp: empleado;
  id, edad: integer;
  result: boolean;
Begin
  reset(a);
  read(a, emp);
  writeln('ingrese id');
  readln(id);
  writeln('ingrese edad');
  readln(edad);
  result := true;
  While (Not eof(a)) Do
    Begin
      If (id = emp.num) Then
        Begin
          seek(a, filepos(a)-1);
          emp.edad := edad;
          write(a, emp);
          result := false;
          break
        End;
      read(a, emp);
    End;
  If (result) Then
    writeln('empleado no existe');
  close(a);
End;
Procedure exportarTodos(Var a: file_empleados);

Var 
  txt: Text;
  emp: empleado;
Begin
  Assign(txt, 'todos_empleados.txt');

  reset(a);
  rewrite(txt);
  While (Not eof(a)) Do
    Begin
      read(a, emp);
      writeln(txt,
              ' ',emp.num,
              ' ',emp.apellido,
              ' ',emp.nombre,
              ' ',emp.edad,
              ' ',emp.dni
      )
    End;
  close(a);
  close(txt);
End;
Procedure exportarSinDni(Var a: file_empleados);

Var 
  txt: Text;
  emp: empleado;
Begin
  Assign(txt, 'faltaDNIEmpleado.txt');

  reset(a);
  rewrite(txt);
  While (Not eof(a)) Do
    Begin
      read(a, emp);
      If (emp.dni = 00) Then
        Begin
          writeln(txt,
                  ' ',emp.num,
                  ' ',emp.apellido,
                  ' ',emp.nombre,
                  ' ',emp.edad,
                  ' ',emp.dni
          )
        End;
    End;
  close(a);
  close(txt);
End;
Procedure eliminar(Var a: file_empleados);

Var 
  ultimo,emp: empleado;
  id: integer;
  result: boolean;
Begin
  result := false;
  writeln('Ingrese el num del empleado a eliminar');
  readln(id);
  reset(a);
  seek(a, filesize(a)-1);
  read(a, ultimo);
  seek(a, 0);
  While (Not eof(a)) And (Not result) Do
    Begin
      read(a,emp);
      If (id = emp.num) Then
        Begin
          result := true;
          seek(a, filepos(a)-1);
          write(a,ultimo);
        End;
    End;
  If (Not result) Then
    writeln('No se encontro el empleado')
  Else
    Begin
      seek(a, filesize(a)-1);
      truncate(a);
      writeln('Empleado eliminado');
    End;
  close(a);
End;
Procedure menu(Var a: file_empleados);

Var 
  opcion: integer;
Begin
  While (true) Do
    Begin
      writeln('Ingrese la operacion deseada: ');
      writeln('1 - Buscar empleado. ');
      writeln('2 - Mostrar empleados registrados. ');
      writeln('3 - Mostrar empleados mayores a 70 annos.');
      writeln('4 - agregar empleados. ');
      writeln('5 - modificar edad. ');
      writeln('6 - exportar Todos. ');
      writeln('7 - exportar Sin Dni. ');
      writeln('8 - Dar baja. ');
      writeln('9 - Finalizar el programa. ');
      Write('--> ');
      readln(opcion);
      Case opcion Of 
        1:  mostrarDeterminado(a);
        2:  mostrartodos(a);
        3:  mostrarMayores(a);
        4:  agregar(a);
        5:  modificarEdad(a);
        6:  exportarTodos(a);
        7:  exportarSinDni(a);
        8:  eliminar(a);
        9:  break;
        Else
          writeln('operacion invalida');
      End;
    End;
End;

Var 
  a: file_empleados;
Begin
  crearArchivo(a);
  menu(a);
End.
