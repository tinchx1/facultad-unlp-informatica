program ej1;
type
    reclamo = record
    cod: integer;
    dni: integer;
    ano: integer;
    tipo: string;
    end;

    lista = ^nodo;
    nodo = record
    data: reclamo;
    sig: lista;
    end;

    dataNodo = record
    dni: integer;
    cantidadReclamos: integer;
    reclamos: lista;
    end;

    vector = array[1..100] of integer;

    arbol = ^nodoA;
    nodoA = record
    data: dataNodo;
    hd: arbol;
    hi: arbol;
    end;
    procedure crearArbol(var a: arbol);
        procedure leerReclamo(var r:reclamo);
        begin
            writeln('Ingrese cod');
            readln(r.cod);
            if (r.cod <> -1) then
            begin
                writeln('Ingrese dni');
                readln(r.dni);
                writeln('Ingrese ano');
                readln(r.ano);
                writeln('Ingrese tipo');
                readln(r.tipo);
            end;
        end;
        procedure agregarAdelante(var l: lista; r: reclamo);
        var 
            nue: lista;
        begin   
            new(nue);
            nue^.data:= r;
            nue^.sig:= l;
            l:= nue;
        end;

        procedure agregarArbol(var a: arbol; r: reclamo);
        begin
            if (a = nil) then begin
                new(a);
                a^.data.cantidadReclamos:= 1;
                a^.data.dni:= r.dni;
                new(a^.data.reclamos);
                agregarAdelante(a^.data.reclamos, r);
                a^.hi:= nil;
                a^.hd:= nil;
            end 
            else if (a^.data.dni > r.dni) then 
                agregarArbol(a^.hi, r)
            else if (a^.data.dni < r.dni) then
                agregarArbol(a^.hd, r)
            else 
            begin
                a^.data.cantidadReclamos:= a^.data.cantidadReclamos + 1;
                agregarAdelante(a^.data.reclamos, r);
            end;
        end;
    var 
        r: reclamo;
    begin
        leerReclamo(r);
        while (r.cod <> -1) do 
        begin
            agregarArbol(a,r);
            leerReclamo(r);
        end;
    end;

    procedure cantReclamos(a: arbol; dni: integer;var cant: integer);
    begin
        if (a <> nil) then
        begin
            if (dni = a^.data.dni) then
                cant:= a^.data.cantidadReclamos
            else if (dni < a^.data.dni) then
                cantReclamos(a^.hi,dni,cant)
            else
               cantReclamos(a^.hd,dni,cant)
        end;
    end;

    procedure entreRango(a: arbol; dni1: integer; dni2: integer; var cant: integer);
    begin
        if (a <> nil) then
        begin
            if (a^.data.dni >= dni1) and (a^.data.dni <= dni2) then
                cant:= cant + a^.data.cantidadReclamos;        
            if (a^.data.dni >= dni2) then
                entreRango(a^.hi, dni1, dni2, cant);
            if (a^.data.dni <= dni1) then
                entreRango(a^.hd, dni1, dni2, cant);
        end;
    end;

    procedure retornarAno(a: arbol; ano: integer; var v: vector; var diml: integer);
        procedure recorrerLista(l: lista; ano: integer; var v: vector; var diml: integer);
        begin
            while (l <> nil) do
            begin
                if (l^.data.ano = ano) then
                begin
                    v[diml]:= l^.data.cod;
                    diml:= diml + 1;
                end;
                l:= l^.sig;
            end;
        end;
    begin
        if (a <> nil) then begin
            recorrerLista(a^.data.reclamos, ano, v, diml);
            retornarAno(a^.hi, ano, v, diml);
            retornarAno(a^.hd, ano, v, diml);
        end;
    end;
var         
    a: arbol;
    i, ano, dni, dni1, dni2, cantEntreRango, cant, diml: integer;
    v: vector;
begin
    crearArbol(a);
    writeln('ingrese dni a buscar');
    readln(dni);
    cantReclamos(a,dni,cant);
    writeln(cant);
    readln(dni1);
    readln(dni2);
    cantEntreRango:= 0;
    entreRango(a,dni1,dni2,cantEntreRango);
    writeln(cantEntreRango);
    writeln('ingrese año a buscar');
    readln(ano);
    diml:= 0;
    retornarAno(a, ano, v, diml);
    for i:= 0 to diml do
        writeln(v[i]);
end.

