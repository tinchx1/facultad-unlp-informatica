
Type 

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

  lista = ^nodo;
  nodo = Record
    nodos: array[1..orden] Of integer;
    indices: array[1..orden-1] Of longint;
    referencia: array[1..orden-1] Of integer;
    cant: integer;
    sig: lista;
  End;

  archivo2 = file Of nodo;
