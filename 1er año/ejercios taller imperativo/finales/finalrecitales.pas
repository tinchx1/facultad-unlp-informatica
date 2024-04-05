program ej1;
type 
	recital = record
	nombre: string;
	fecha: string;
	cantcanciones: integer;
	monto: real;
	end;
	
	arbol = ^nodo;
	nodo = record
	data: recital;
	hi: arbol;
	hd: arbol;
	end;
	
	lista = ^nodoa;
	nodoa = record
	data: recital;
	sig: lista;
	end;
	
	procedure leerRecital(var r: recital);
	begin 
		writeln('Ingrese nombre');
		readln(r.nombre);
		if (r.nombre <> 'zzz') then
		begin
			writeln('Ingrese fecha');
			readln(r.fecha);
			writeln('Ingrese cantcanciones');
			readln(r.cantcanciones);
			writeln('Ingrese monto');
			readln(r.monto);
		end;
	end;
	procedure agregarArbol(var a: arbol; r:recital);
	begin
		if (a = nil) then begin
			new(a);
			a^.data:= r;
			a^.hd:= nil;
			a^.hi:= nil;
		end else if (r.monto <= a^.data.monto) then
			agregarArbol(a^.hi, r)
			else
				agregarArbol(a^.hd, r)
	end;
	procedure crearArbol(var a: arbol);
	var
		r: recital;
	begin
		leerRecital(r);
		while (r.nombre <> 'zzz') do
		begin
			agregarArbol(a, r);
			leerRecital(r);
		end;
	end;
	procedure agregarAdelante(var l: lista; r: recital);
	var
		nue: lista;
	begin
		new(nue);
		nue^.data:= r;
		nue^.sig:=l;
		l:= nue;
	end;
	procedure nuevaLista(a: arbol; v1: real; v2: real; var l: lista);
	begin
		if (a^.data.monto < v1) then
			nuevaLista(a^.hd,v1,v2,l)
		else if (a^.data.monto > v2) then
			nuevaLista(a^.hi,v1,v2,l)
			else
			begin
				nuevaLista(a^.hi,v1,v2,l);
				if ((a^.data.monto > v1) and (a^.data.monto < v2)) then
					agregarAdelante(l, a^.data);
				nuevaLista(a^.hd,v1,v2,l)
			end;
	end;
var 
	a: arbol;
	l: lista;
	v1,v2: real;
BEGIN	
	crearArbol(A);
	writeln('ingrese num');
	readln(v1);
	writeln('ingrese num');
	readln(v2);
	nuevaLista(a,v1,v2, l);
	while (l <> nil) do 
		writeln(l^.data.nombre);
END.

