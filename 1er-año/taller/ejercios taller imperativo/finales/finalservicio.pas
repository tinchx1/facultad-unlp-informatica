program ej1;
const
    cant_categorias = 10;
    cant_afiliados = 200;
type    
    categorias = 1..cant_categorias;
    afiliados = record
    categoria: categorias;
    dni: integer;
    año: integer;
    num: integer;
    end;
    
    arbol = ^nodo;
    nodo = record
    data: denuncias;
    hi: arbol;
    hd: arbol;

    afiliado_vector = record
    categoria: categorias;
    dni: integer;
    num: integer;
    end;
    vector = [1..cant_afiliados] of afiliado_vector;
    end;
     
        
    end;
    procedure entreRango(a: arbol;var v: vector; dni1: integer; dni2: integer; cat: cant_categorias);
    var
        diml,i: integer;
    begin
        diml:= 0;
        if (a <> nil) then  
        begin
            if (a^.data.cat <> cat) then 
            begin
                entreRango(a^.hi,v,dni1,dni2,cat);
                entreRango(a^.hd,v,dni1,dni2,cat);
            else if (a^.data.dni < dni1) then
                entreRango(a^.hd,v,dni1,dni2,cat)
                else if (a^.data.dni > dni2) then
                entreRango(a^.hi,v,dni1,dni2,cat)
                else 
                begin
                    entreRango(a^.hi,v,dni1,dni2,cat);
                    if ((a^.data.dni > dni1) and (a^.data.dni < dni2) and (a^.data.cat = cat)) then
                    begin
                        v[diml].categoria:= a^.data.cat;
                        v[diml].dni:= a^.data.dni;
                        v[diml].num:= a^.data.num;
                        diml:= diml + 1;
                    end;
                    entreRango(a^.hd,v,dni1,dni2,cat);
                end;
            end;
        end;
        for i:=0 to diml do
        begin
            writeln(n)
    end;
