{Insertar Ordenado}
Procedure InsertarElemento ( var pri: lista; x: Integer);
var 
    ant, nue, act: lista;
begin
    new (nue);
    nue^.dato := x;
    act := pri;
    ant := pri;
    while (act<>NIL) and (act^.dato < x) do 
    begin
        ant := act;
        act := act^.sig ;
    end;
    if (ant = act)  then 
        pri := nue   
    else  
        ant^.sig  := nue; 
    nue^.sig := act ;
end;

Procedure entreRango(a: arbol; min, max: integer; Var cant: integer);
Begin
  If (a <> Nil) Then
    Begin
      If (a^.dato >= min) And (a^.dato <= max) Then
        Begin
          cant := cant + 1;
          entreRango(a^.HI, min, max, cant);
          entreRango(a^.HD, min, max, cant);
        End
      Else If (a^.dato < min) Then
             entreRango(a^.HD, min, max, cant)
      Else If (a^.dato >= max) Then
             entreRango(a^.HI, min, max, cant);
    End;
End;
