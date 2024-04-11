program test;
type 
    tcelular = record
        codigo:integer;
        precio:real;
        marca:string[15];
        disponible:integer; //stock disponible
        minimo:integer;   //stock minimo
        descripcion:string[30];
        nombre:string[20];
    end;

    tarch = file of tcelular;

procedure imprimirCelular(celular:tcelular);
begin 
    writeln('Codigo: ',celular.codigo,
            ', Precio:',celular.precio:0:2,
            ', Marca:',celular.marca,
            ', Stock disponible:',celular.disponible,
            ', Stock minimo:',celular.minimo,
            ', Descripcion:',celular.descripcion,
            ', Nombre:',celular.nombre
            );
end;

procedure leerCelular(var celular:tcelular);
begin 
    writeln;
    write('Ingrese codigo: ');
    read(celular.codigo);
    write('Ingrese precio: ');
    read(celular.precio);
    write('Ingrese marca: ');
    read(celular.marca);
    write('Ingrese stock disponible: ');
    read(celular.disponible);
    write('Ingrese stock minimo: ');
    read(celular.minimo);
    write('Ingrese descripcion: ');
    read(celular.descripcion);
    write('Ingrese nombre: ');
    read(celular.nombre);
end;

procedure crearArchivo(var a: tarch);
var
	txt: Text;
	nombre: string;
	celular: tcelular;
begin
	assign(txt, 'celulares.txt');
	rewrite(txt);
	reset(txt);
	while
	
