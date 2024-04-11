program ej3;
type
	empleado = record
	num: integer;
	apellido: string;
	nombre: string;
	edad: integer;
	dni: integer;
	end;
	
	file_empleados = file of empleado;
	
	procedure leerEmpleado(var e:empleado);
	begin 
		write('Ingrese apellido de empleado: ');
		readln(e.apellido);
		if (e.apellido<>'fin') then 
		begin
			write('Ingrese nombre de empleado: ');
			readln(e.nombre);
			write('Ingrese numero de empleado: ');
			readln(e.num);
			write('Ingrese edad de empleado: ');
			readln(e.edad);
			write('Ingrese dni de empleado: ');
			readln(e.dni);
		end;
	end;
		
	procedure escribirEmpleado(e: empleado);
	begin
		writeln(' Numero: ',e.num,
            ' Apellido: ',e.apellido,
            ' Nombre: ',e.nombre,
            ' Edad: ',e.edad,
            ' DNI: ',e.dni
            );
	end;
	procedure crearArchivo(var a: file_empleados);
	var
		empl: empleado;
		nombre: string;
	begin
		writeln('ingrese nombre file');
		readln(nombre);
		assign(a, nombre);
		rewrite(a);
		leerEmpleado(empl);
		while (empl.apellido <> 'fin') do
		begin
			write(a, empl);
			leerEmpleado(empl);
		end;
		close(a);
	end;
	
	procedure mostrarDeterminado(var a: file_empleados);
	var
		id: string;
		emp: empleado;
	begin
		writeln('ingrese nombre o apellido a buscar');
		readln(id);
		reset(a);
		while (not eof(a)) do
		begin
			read(a, emp);
			if ((emp.nombre = id) or (emp.apellido = id)) then
				escribirEmpleado(emp);
		end;
		close(a);
	end;

	procedure mostrarMayores(var a: file_empleados);
	var
		emp: empleado;
	begin
		reset(a);
		while (not eof(a)) do
		begin
			read(a, emp);
			if (emp.edad > 70) then
				escribirEmpleado(emp);
		end;
		close(a);
	end;
	procedure mostrartodos(var a: file_empleados);
	var
		emp: empleado;
	begin
		reset(a);
		while (not eof(a)) do
		begin
			read(a, emp);
			escribirEmpleado(emp);
		end;
		close(a);
	end;
	
	procedure agregar(var a: file_empleados);
		procedure unidad(var a: file_empleados; id: integer; var result: boolean);
		var
			emp: empleado;
		begin
			reset(a);
			read(a, emp);
			while (not eof(a)) do
			begin
				if (id = emp.num) then
					result:= false;
				read(a, emp);
			end;
			result:= true;
		end;
	var
		emp: empleado;
		result: boolean;
	begin
		leerEmpleado(emp);
		reset(a);
		seek(a, fileSize(a));
		while (emp.apellido <> 'fin')do
		begin
			unidad(a, emp.num, result);
			if (result) then
				write(a, emp);
			leerEmpleado(emp);
		end;
		close(a);
	end;
		
	procedure modificarEdad(var a: file_empleados);
	var
		emp: empleado;
		id, edad: integer;
		result: boolean;
	begin
		reset(a);
		read(a, emp);
		writeln('ingrese id');
		readln(id);
		writeln('ingrese edad');
		readln(edad);
		result:= true;
		while (not eof(a)) do
		begin
			if (id = emp.num) then
			begin
				seek(a, filepos(a)-1);
				emp.edad:= edad;
				write(a, emp);
				result:= false;
				break
			end;
			read(a, emp);
		end;
		if (result) then
			writeln('empleado no existe');
		close(a);
	end;
	procedure menu(var a: file_empleados);
	var
		opcion: integer;
	begin
		while (true) do begin
	        writeln('Ingrese la operacion deseada: ');
            writeln('1 - Buscar empleado. ');
            writeln('2 - Mostrar empleados registrados. ');
            writeln('3 - Mostrar empleados mayores a 70 annos.');
            writeln('4 - agregar empleados. ');            
            writeln('5 - modificar edad. ');

            writeln('9 - Finalizar el programa. ');
            write('--> ');
            readln(opcion);
            case opcion of
				1:  mostrarDeterminado(a);
				2:  mostrartodos(a);
				3:  mostrarMayores(a);
				4:  agregar(a);
				5: 	modificarEdad(a);
				6:  break;
            else
				writeln('operacion invalida');
			end;
		end;
	end;
var
	a: file_empleados;
begin
	crearArchivo(a);
	menu(a);
end.
