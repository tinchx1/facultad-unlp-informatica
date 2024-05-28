
Const 
  orden = 5;

Type 
  alumnos = Record
    nombre: string[30];
    apellido: string[30];
    ano: integer;
    legajo: integer;
    dni: integer;
  End;
  archivo = file Of alumnos;
  nodo = Record
    nodos: array[1..orden] Of integer;
    indices: array[1..orden-1] Of longint;
    referencia: array[1..orden-1] Of integer;
    cant: integer;
  End;

  archivo2 = file Of nodo;
{b) n = (m-1)x4 + (m-1)x4 + mx4 + 4
    512 = 4m - 4 + 4m - 4 + 4m + 4
    512 = 12m - 4
    512 + 4 = 12m
    516 = 12m
    m = 43

    
 }