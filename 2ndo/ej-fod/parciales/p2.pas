Procedure MyProcedure(params);

Type 
  empleado = Record
    dni: integer;
    apellido: string[20];
    nombre: string[20];
    edad: integer;
    domicilio: string[50];
    fechaNacimiento: string[10];
  End;
  archivo = file Of empleado;
Procedure cargarEmpleado(Var e: empleado);
Begin
  writeln('Ingrese el DNI del empleado: ');
  readln(e.dni);
  writeln('Ingrese el apellido del empleado: ');
  readln(e.apellido);
  writeln('Ingrese el nombre del empleado: ');
  readln(e.nombre);
  writeln('Ingrese la edad del empleado: ');
  readln(e.edad);
  writeln('Ingrese el domicilio del empleado: ');
  readln(e.domicilio);
  writeln('Ingrese la fecha de nacimiento del empleado: ');
  readln(e.fechaNacimiento);
End;
Procedure agregarEmpleado(Var a: archivo);

Var 
  e,cab: empleado;
Begin
  leerEmpleado(e);
  If (existeEmpleado(a,e.dni)) Then
    writeln('El empleado ya existe en el archivo')
  Else
    Begin
      reset(a);
      read(a,cab);
      If (cab.dni = 0) Then
        Begin
          seek(a, filesize(a));
          write(a,e);
        End
      Else
        Begin
          seek(a, -(cab.dni));
          read(a,cab);
          seek(a, filepos(a)-1);
          write(a,e);
          seek(a, 0);
          write(a,cab);
        End;
    End;
  close(a);
End;
Procedure eliminarEmpleado(Var a: archivo);

Var 
  dni: integer;
  cab, e: empleado;
  cumple: boolean;
Begin
  writeln('Ingrese el DNI del empleado a eliminar: ');
  readln(dni);
  If (Not existeEmpleado(a,dni)) Then
    writeln('El empleado no existe en el archivo')
  Else
    Begin
      reset(a);
      read(a,cab);
      cumple := false;
      While (Not eof(a) And Not cumple) Do
        Begin
          read(a,e);
          If (e.dni = dni) Then
            Begin
              cumple := true;
              seek(a, filepos(a)-1);
              write(a,cab);
              cab.dni := -(filepos(a - 1));
              seek(a, 0);
              write(a,cab);
            End;
        End;
    End;
  close(a);
End;
