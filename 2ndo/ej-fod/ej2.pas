program ej2;
	type 
		archivo_enteros = file of integer;
	procedure crearArchivo(var a: archivo_enteros);
	var
		num: integer;
		nombre: String;
	begin
		writeln('ingrese nombre del archivo');
		readln(nombre);
		writeln('ingrese entero');
		readln(num);
		assign(a, nombre);
		rewrite(a);
		while (30000 <> num) do 
		begin
			write(a, num);
			writeln('ingrese entero');
			readln(num);
		end;
		close(a)
	end;
	procedure informar(var a: archivo_enteros);
	var
		menores, num, canttotal, suma: integer;
		promedio: real;
	begin
		reset(a);
		menores:= 0;
		canttotal:= 0;
		suma:= 0;
		while (not eof(a)) do 
		begin
			read(a,num);
			writeln(num);
			canttotal:= canttotal + 1;
			suma:= suma + num;
			if (num  < 1500) then
				menores:= menores + 1;
		end;	
		promedio:= (suma/canttotal);	
		writeln('El promedio es de ', promedio);
		writeln('La cantidad menor es de ', menores);
		close(a);
	end;
var
	arch: archivo_enteros;
begin
	crearArchivo(arch);
	informar(arch);
end.

