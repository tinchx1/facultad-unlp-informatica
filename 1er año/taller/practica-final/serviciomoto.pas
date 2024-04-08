//Un servicio de moto mensajería platense quiere procesar 
//los pedidos entregados. De cada pedido se conoce: número del repartidor, dirección del retiro del pedido, dirección de entrega del pedido y monto a cobrar por el servicio de entrega. 
//Se pide implementar un programa que://

//a) Lea los pedidos (finalizando con dirección de entrega ZZZ) y genere una estructura eficiente para la búsqueda por número de repartidor.
//La estructura debe contener para cada número de repartidor la cantidad de pedidos entregados por éste y el monto total cobrado por todos sus serviciós de entrega.//
//A partir de la estructura generada en a), realice módulos independientes para://
//b) Obtener la cantidad de repartidores que recaudaron un monto total que oscila entre dos valores ingresados.
//c) Imprimir en pantalla la información de aquellos repartidores cuyo número de repartidor oscila entre dos valores ingresados.

program serviciomoto;
type
    pedido = record
    num: integer;
    direc_retiro: string;
    direc_entrega: string;
    monto: integer;
    end;

    pedido_lista = record
    direc_retiro: string;
    direc_entrega: string;
    monto: real;
    end;

    lista = ^nodol;
    nodol = record
    data: pedido_lista;
    sig: lista;
    end;

    record_arbol = record
    pedidos: lista;
    num: integer;
    cantidad_pedidos: integer;
    monto_total: real;
    end;
    arbol = ^nodo;
    nodo = record
    data: record_arbol;
    hi: arbol;
    hd: arbol;
    end;

    procedure crearArbol(var a: arbol);

        procedure leerPedido(var p: pedido);
        begin
            writeln('Ingrese direc entrega');
            readln(p.direc_entrega);
            if (p.direc_entrega <> 'zzz') then
            begin
                writeln('Ingrese direc retiro');
                readln(p.direc_retiro);
                writeln('Ingrese monto');
                readln(p.monto);
                writeln('Ingrese num');
                readln(p.num);
            end;
        end;

        procedure agregarAdelante(var l: lista; p: pedido);
        var 
            nue: lista;
        begin
            new(nue);
            nue^.data.monto:= p.monto;
            nue^.data.direc_retiro:= p.direc_retiro;
            nue^.data.direc_entrega:= p.direc_entrega;
            nue^.sig:= l;
            l:= nue;
        end;

        procedure agregarArbol(var a: arbol; p: pedido);
        begin
            if (a = nil) then
            begin
                new(a);
                a^.data.num:= p.num;
                a^.data.cantidad_pedidos:= 1;
                a^.data.monto_total:= p.monto;
                new(a^.data.pedidos);
                agregarAdelante(a^.data.pedidos, p);
                a^.hi:= nil;
                a^.hd:= nil;
            end
            else if (a^.data.num = p.num) then
            begin
                a^.data.cantidad_pedidos:= a^.data.cantidad_pedidos+1;
                a^.data.monto_total:= a^.data.monto_total + p.monto;
                agregarAdelante(a^.data.pedidos, p);
            end 
            else if (a^.data.num > p.num) then
                agregarArbol(a^.hi, p)
            else    
                agregarArbol(a^.hd, p);
        end;

    var
        p: pedido;
    begin
        leerPedido(p);
        while(p.direc_entrega <> 'zzz') do
        begin
            agregarArbol(a, p);
            leerPedido(p);
        end;
    end;

    procedure entreRangob(a: arbol; monto1: real; monto2: real; var cant: integer);
    begin
        if (a <> nil) then
        begin
            if ((a^.data.monto_total > monto1) and (a^.data.monto_total < monto2)) then
                cant:= cant + 1;
            if (a^.data.monto_total < monto1) then
                entreRangob(a^.hd, monto1, monto2, cant);
            if (a^.data.monto_total > monto2) then
                entreRangob(a^.hi, monto1, monto2, cant);
        end;
    end;
    procedure entreRangoc(a: arbol; num1: integer; num2: integer);
        procedure imprimirTodo(r: record_arbol);
            procedure imprimirLista(l: lista);
            begin
                while (l <> nil) do
                begin
                    writeln(l^.data.direc_retiro);
                    writeln(l^.data.direc_entrega);
                    writeln(l^.data.monto);
                    l:= l^.sig;
                end;
            end;
        begin
            writeln(r.num);
            writeln(r.monto_total);
            writeln(r.cantidad_pedidos);
            imprimirLista(r.pedidos);
        end;
    begin
        if (a <> nil) then
        begin
            if ((a^.data.num > num1) and (a^.data.num < num2)) then
                imprimirTodo(a^.data);
            if (a^.data.num < num1) then
                entreRangoc(a^.hd, num1, num2);
            if (a^.data.monto_total > num2) then
                entreRangoc(a^.hi, num1, num2);
        end;
    end;
var
    a: arbol;
    num1,num2, cant: integer;
    monto1, monto2: real;
begin
    crearArbol(a);
    writeln('ingrese monto 1 a buscar');
    readln(monto1);
    writeln('ingrese monto 2 a buscar');
    readln(monto2);
    cant:= 0;
    entreRangob(a,monto1,monto2,cant);
    writeln(cant);
    writeln('ingrese num1');
    readln(num1);
    writeln('ingrese num2');
    readln(num2);
    entreRangoc(a,num1,num2);
end.