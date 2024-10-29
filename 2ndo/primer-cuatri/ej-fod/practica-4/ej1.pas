
Program ej1;
orden = 6;

Type 
  alumnos = Record
    nombre: string[30];
    apellido: string[30];
    ano: integer;
    legajo: integer;
    dni: integer;
  End;
  tnodo = Record
    nodos: array[1..orden] Of integer;
    elementos: array[1..orden-1] Of alumnos;
    cant: integer;
  End;
  tarchivo = File Of tnodo;
Begin

{b
  
  n = (m-1)x64+mx4+4
512 = 64m-64+4m+4
512 = 68m-64
512+64 = 68m
576 = 68m
m = 8.47

n = (8-1)x64+8x4+4
n = 7x64+32+4
n =  448+32+4 
n = 484
}

  Assign(archivo, 'archivo.dat');
  Rewrite(archivo);
  For i:= 1 To 100 Do
  Begin
    nodo.cant:= 0;
    For j:= 1 To orden Do
    Begin
      nodo.nodos[j]:= -1;
      nodo.elementos[j].nombre:= '';
      nodo.elementos[j].apellido:= '';
      nodo.elementos[j].ano:= 0;
      nodo.elementos[j].legajo:= 0;
      nodo.elementos[j].dni:= 0;
    End;
    Write(archivo, nodo);
  End;
  Close(archivo);
  Assign(archivo, 'archivo.dat');
  Reset(archivo);
  For i:= 1 To 100 Do
  Begin
    Read(archivo, nodo);
    For j:= 1 To orden Do
    Begin
      WriteLn('Nodo: ', i, ' Elemento: ', j);
      WriteLn('Nombre: ', nodo.elementos[j].nombre);
      WriteLn('Apellido: ', nodo.elementos[j].apellido);
      WriteLn('Año: ', nodo.elementos[j].ano);
      WriteLn('Legajo: ', nodo.elementos[j].legajo);
      WriteLn('DNI: ', nodo.elementos[j].dni);
    End;
  End;
  Close(archivo);
  Assign(archivo, 'archivo.dat');
  Reset(archivo);
  For i:= 1 To 100 Do
  Begin
    Read(archivo, nodo);
    For j:= 1 To orden Do
    Begin
      nodo.elementos[j].nombre:= 'Nombre';
      nodo.elementos[j].apellido:= 'Apellido';
      nodo.elementos[j].ano:= 1990;
      nodo.elementos[j].legajo:= 1234;
      nodo.elementos[j].dni:= 12345678;
    End;
    Write(archivo, nodo);
  End;
  Close(archivo);
  Assign(archivo, 'archivo.dat');
  Reset(archivo);
  For i:= 1 To 100 Do
  Begin
    Read(archivo, nodo);
    For j:= 1 To orden Do
    Begin
      WriteLn('Nodo: ', i, ' Elemento: ', j);
      WriteLn('Nombre: ', nodo.elementos[j].nombre);
      WriteLn('Apellido: ', nodo.elementos[j].apellido 
}
End;
