program ej;
type
    auto = record
    patente: string;
    ano: string;
    marca: string;
    modelo: string;
    end;

    arbol1 = ^nodo1;
    nodo1 = record
    data: auto;
    hd: arbol1;
    hi: arbol1;
    end;

    rlista = record
    patente: string;
    ano: string;
    modelo: string;
    end;

    lista = ^nodol;
    nodol = record
    data: rlista;
    sig: lista;
    end;

    dataa2 = record
    autos: lista;
    marca: string;
    end;

    arbol2 = ^nodo2;
    nodo2 = record
    data: dataa2;
    hd: arbol2;
    hi: arbol2;
    end;

    procedure crearArboles(var a1: arbol1; var a2: arbol2 );
        procedure leerAuto(var a: auto);
        begin
            writeln('ingrese patente');
            readln(a.patente);
            if (a.patente <> 'zzz') then
            begin
                writeln('ingrese ano');
                readln(a.ano);        
                writeln('ingrese marca');
                readln(a.marca);        
                writeln('ingrese modelo');
                readln(a.modelo);        
            end;
        end;
        procedure agregarAdelante(var l: lista; a: auto);
        var
            nue: lista;
        begin
            new(nue);
            nue^.data.patente:= a.patente;
            nue^.data.ano:= a.ano;
            nue^.data.modelo:= a.modelo;
            nue^.sig:= l;
            l:= nue;
        end;
        procedure agregarArbol1(var a1: arbol1; a: auto);
        begin
            if (a1 = nil) then
            begin
                new(a1);
                a1^.data:= a;
                a1^.hi:= nil;
                a1^.hd:= nil;
            end
            else if (a1^.data.patente >= a.patente) then
                agregarArbol1(a1^.hi, a)
            else   
                agregarArbol1(a1^.hd, a);
        end;

        procedure agregarArbol2(var a2: arbol2; a: auto);
        begin
            if (a2 = nil) then
            begin
                new(a2);
                a2^.data.marca:= a.marca;
                agregarAdelante(a2^.data.autos, a);
                a2^.hi:= nil;
                a2^.hd:= nil;
            end
            else if (a2^.data.marca > a.marca) then
                agregarArbol2(a2^.hi, a)
            else if (a2^.data.marca = a.marca) then
                agregarAdelante(a2^.data.autos, a)
            else   
                agregarArbol2(a2^.hd, a);
        end;
    var
        a:auto;
    begin
        leerAuto(a);
        while (a.patente <> 'zzz') do begin
            agregarArbol1(a1, a);
            agregarArbol2(a2, a);
            leerAuto(a);
        end;
    end;

    procedure modulob(a: arbol1; marca: string; var cant: integer);
    begin
        if (a <> nil) then
        begin
            if (marca = a^.data.marca) then
                cant:= cant + 1;
            modulob(a^.hi, marca,cant);
            modulob(a^.hd, marca,cant)
        end;
    end;    
    procedure moduloc(a: arbol2; marca: string; var cant: integer);
        procedure recorrerLista(l: lista; var cant: integer);
        begin
            while (l<> nil) do
            begin
                cant:= cant + 1;
                l:= l^.sig;
            end;
        end;
    begin
        if (a <> nil) then
        begin
            if (marca = a^.data.marca) then
                recorrerLista(a^.data.autos,cant);
            if (a^.data.marca < marca) then
                moduloc(a^.hd, marca,cant);
            if (a^.data.marca > marca) then
                moduloc(a^.hi, marca,cant)
        end;
    end;    

    procedure procesoe(a: arbol1; patente: string; var modelo: string);
    begin
        if (a <> nil) then 
        begin
            if (modelo = a^.data.modelo) then
                modelo:= a^.data.patente;
            if (modelo <= a^.data.modelo) then
                procesoe(a^.hi, patente, modelo);
            if (modelo > a^.data.modelo) then
                procesoe(a^.hd, patente, modelo);
        end;
    end;
var 
    a1: arbol1;
    a2: arbol2;
    patente, modelo,marca: string;
    cant1, cant2: integer;
begin
    crearArboles(a1,a2);
    cant1:= 0;
    cant2:= 0;
    writeln('ingrese marca a buscar');
    readln(marca);
    modulob(a1,marca,cant1);
    moduloc(a2,marca,cant2);
    writeln(cant1);
    writeln(cant2);
    writeln('ingrese patente a buscar');
    readln(patente);
    procesoe(a1, patente, modelo);
    writeln(modelo);
end.


