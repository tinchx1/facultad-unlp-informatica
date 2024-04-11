program nro1;
const
    DIMF = 5;
    DIMFCAT = 3;
type
    categorias = 1..DIMFCAT; 
    rango = 1..DIMF; //200
    afiliado = record
        dni:integer;
        categoria:categorias;
        anioIngreso:Integer;
    end;

    arbol = ^nodo;
    nodo = record
        HI:arbol;
        HD:arbol;
        dato:afiliado;
    end;

	vector = array [rango] of afiliado;
    vCategorias = array [categorias] of vector;
    vLogico = array [categorias] of Integer;

procedure LeerAfiliado(var afi:afiliado);
begin
    afi.dni := 1+random(100);
    afi.categoria := 1+random(3);
    afi.anioIngreso := 1;
end;
procedure Crear(var abb:arbol; afi:afiliado);
begin
    if abb = nil then
    begin
        new(abb);
        abb^.HI:=nil;
        abb^.HD:=nil;
        abb^.dato:=afi;
    end
    else
        if (abb^.dato.dni > afi.dni) then
            Crear(abb^.HI, afi)
        else
            Crear(abb^.HD, afi)
end;
procedure cargarArbol(var abb:arbol);
var 
    afi:afiliado;
    i:integer;
begin
    for i:=1 to DIMF do
    begin
      LeerAfiliado(afi);
      Crear(abb, afi);
    end;
end;

procedure imprimirArbol(abb:arbol);
begin
    if (abb <> nil) then
    begin
        imprimirArbol(abb^.HI);
        WriteLn('-------------------');
        Writeln('dni:',abb^.dato.dni, ' Cat:',abb^.dato.categoria);
        imprimirArbol(abb^.HD);
    end;
end;

procedure retornarAfiliados(abb:arbol; dni1,dni2:integer;nroCat:integer; var vc:vCategorias; var vl:vLogico);
begin
    if (abb <> nil) then
    begin
        retornarAfiliados(abb^.HI, dni1,dni2,nroCat,vc,vl);
        if (abb^.dato.dni > dni1) and (abb^.dato.dni < dni2) and (abb^.dato.categoria = nroCat) then
        begin
            vl[nroCat]:=vl[nroCat] + 1;
            (vc[nroCat])[vl[nroCat]]:=abb^.dato;    
            WriteLn('-------------------');
            Writeln('dni:',abb^.dato.dni, ' Cat:',abb^.dato.categoria);
        end;
        retornarAfiliados(abb^.HD, dni1,dni2,nroCat, vc,vl);
    end;
end;
procedure InicializarVector(var vl:vLogico);
var
    i:categorias;
begin
    for i:=1 to DIMFCAT do
        vl[i]:=0
end;
procedure imprimirArreglo(vc:vCategorias;vl:vLogico);
var
    i:categorias;
    j:rango;
begin
    for i:=1 to DIMFCAT do
    begin
        WriteLn('CATEGORIA: ', i);
        WriteLn('DIML: ', vl[i]);
        for j:=1 to vl[i] do
        begin
            WriteLn('Dni: ',(vc[i])[j].dni,' Categoria: ',(vc[i])[j].categoria);
        end;
            
        WriteLn('-------');
    end;
        
            
end;
var
    abb:arbol; 
    dni1,dni2:Integer;
    nroCat:Integer;
    vc:vCategorias;
    vl:vLogico;
begin
    randomize;
    abb:=Nil;

    cargarArbol(abb); //Se dispone
    imprimirArbol(abb);

    writeln('__________________________________');
    dni1:=0;
    dni2:=100;
    nroCat:=3;
    InicializarVector(vl);
    retornarAfiliados(abb, dni1,dni2,nroCat,vc,vl);
    WriteLn();
    imprimirArreglo(vc,vl);
    writeln('__________________________________');
end.
