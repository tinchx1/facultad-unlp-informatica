



































{Una empresa posee un archivo con información de los ingresos percibcodos por diferentes
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
nombre y monto de la comisión. La información del archivo se encuentra ordenada por
código de empleado y cada empleado puede aparecer más de una vez en el archivo de
comisiones.
Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
única vez con el valor total de sus comisiones.
NOTA: No se conoce a priori la cantcodad de empleados. Además, el archivo debe ser
recorrcodo una única vez.}

Program ej1;

Const 
  valorAlto = 9999;

Type 
  templeado = Record
    cod: integer;
    nombre: string;
    salario: real;
  End;
  tfile = file Of templeado;
Procedure leerArch(Var arch:Text; Var dato: templeado);
Begin
  If (Not eof(arch)) Then
    Begin
      readln(arch,dato.cod,dato.nombre);
      readln(arch,dato.salario);
    End
  Else
    dato.cod := valorAlto;
End;
Procedure compactarArch(Var arch:tfile; Var empleados: Text);

Var 
  empleado, empleadoAux: templeado;
Begin
  reset(arch);
  reset(empleados);
  leerArch(empleados,empleado);
  While (empleado.cod <> valorAlto) Do
    Begin
      empleadoAux.salario := 0;
      empleadoAux.cod := empleado.cod;
      empleadoAux.nombre := empleado.nombre;
      While (empleado.cod = empleadoAux.cod) Do
        Begin
          empleadoAux.salario := empleadoAux.salario + empleado.salario;
          leerArch(empleados ,empleado);
        End;
      write(arch,empleadoAux);
    End;
  close(arch);
  close(empleados);
End;
Procedure imprimirArch(Var arch: tfile);

Var 
  empleado: templeado;
Begin
  reset(arch);
  While (Not eof(arch)) Do
    Begin
      read(arch,empleado);
      writeln('cod: ',empleado.cod);
      writeln('Nombre: ',empleado.nombre);
      writeln('Salario: ',empleado.salario:0:2);
    End;
  close(arch);
End;

Var 
  arch: tfile;
  empleados: Text;
Begin
  assign(arch, 'compact.dat');
  rewrite(arch);
  assign(empleados,'empleados.txt');
  compactarArch(arch,empleados);
  imprimirArch(arch);
End.
