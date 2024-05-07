
Program finalBandas;

Type 
  banda = Record
    nombre: string;
    fecha: string;
    cantidadCanciones: integer;
    montototal: real;
  End;
  arbol = ^nodo;
  nodo = Record
    dato: banda;
    HI: arbol;
    HD: arbol;
  End;
  lista = ^nodo2;
  nodo2 = Record
    dato: banda;
    sig: lista;
  End;
Procedure cargarBanda(Var b:banda);
Begin
  writeln('Ingrese el nombre de la banda');
  readln(b.nombre);
  If (b.nombre <> 'ZZZ') Then
    Begin
      writeln('Ingrese la fecha de la banda');
      readln(b.fecha);
      writeln('Ingrese la cantidad de canciones');
      readln(b.cantidadCanciones);
      writeln('Ingrese el monto total');
      readln(b.montototal);
    End;
End;
Procedure agregarArbol(Var a:arbol; b:banda);
Begin
  If (a = Nil) Then
    Begin
      new(a);
      a^.dato := b;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    If (b.montototal <= a^.dato.montototal) Then
      agregarArbol(a^.HI,b)
  Else
    agregarArbol(a^.HD,b);
End;
Procedure cargarArbol(Var a:arbol);

Var 
  b: banda;
Begin
  cargarBanda(b);
  While (b.nombre <> 'ZZZ') Do
    Begin
      agregarArbol(a,b);
      cargarBanda(b);
    End;
End;
Procedure entreValores(a:arbol; v1,v2:real; Var l:lista);
Procedure agregarAdelante(Var l:lista; b:banda);

Var 
  nue: lista;
Begin
  new(nue);
  nue^.dato := b;
  nue^.sig := l;
  l := nue;
End;
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato.montototal >= v1) And (a^.dato.montototal <= v2) Then
        agregarAdelante(l,a^.dato);
      If (a^.dato.montototal <= v1) Then
        entreValores(a^.HD,v1,v2,l);
      If (a^.dato.montototal >= v2) Then
        entreValores(a^.HI,v1,v2,l);
    End;
End;
Procedure imprimirLista(l:lista);
Begin
  While (l <> Nil) Do
    Begin
      writeln('Nombre: ',l^.dato.nombre);
      writeln('Fecha: ',l^.dato.fecha);
      writeln('Cantidad de canciones: ',l^.dato.cantidadCanciones);
      writeln('Monto total: ',l^.dato.montototal:2:2);
      l := l^.sig;
    End;
End;
Procedure cantCancionesMas12(a:arbol; Var cant:integer);
Begin
  If (a<>Nil) Then
    Begin
      If (a^.dato.cantidadCanciones>12) Then
        cant := cant+1;
      cantCancionesMas12(a^.HI,cant);
      cantCancionesMas12(a^.HD,cant);
    End;
End;

Var 
  a: arbol;
  l: lista;
  v1,v2: real;
  cant: integer;
Begin
  a := Nil;
  l := Nil;
  cargarArbol(a);
  writeln('Ingrese el valor 1');
  readln(v1);
  writeln('Ingrese el valor 2');
  readln(v2);
  entreValores(a,v1,v2,l);
  imprimirLista(l);
  cant := 0;
  cantCancionesMas12(a,cant);
  writeln('La cantidad de bandas con mas de 12 canciones es: ',cant);
  readln;
End.
