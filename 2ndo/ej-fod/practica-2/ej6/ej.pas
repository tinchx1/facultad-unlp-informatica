













{Suponga que trabaja en una oficina donde está montada una LAN (red local). La misma fue
	construida sobre una topología de red que conecta 5 máquinas entre sí y todas las
	máquinas se conectan con un servidor central. Semanalmente cada máquina genera un
	archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por
	cuánto tiempo estuvo abierta. Cada archivo detalle contiene los siguientes campos:
	cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos
	detalle y genere un archivo maestro con los siguientes datos: cod_usuario, fecha,
	tiempo_total_de_sesiones_abiertas.

	Notas:
	
	● Cada archivo detalle está ordenado por cod_usuario y fecha.
	● Un usuario puede iniciar más de una sesión el mismo día en la misma máquina, o
	inclusive, en diferentes máquinas.
	● El archivo maestro debe crearse en la siguiente ubicación física: /var/log.
}

Program ejercicio6;

Const 
  valorAlto = 999;
  dimF = 3;

Type 

  rango = 1..dimF;

  maestro = Record
    id: integer;
    fecha: string[10];
    tiempoTotal: integer;
  End;
  detalle = Record
    id: integer;
    fecha: string[10];
    tiempoSesion: integer;
  End;

  archivoMaestro = file Of maestro;
  archivoDetalle = file Of detalle;

  vectDetalles = array[rango] Of archivoDetalle;
  vectRegistros = array[rango] Of detalle;
  vectString = array[rango] Of string;


Procedure leerDetalleTxt (Var arch: Text ; Var D: detalle);
Begin
  If Not eof(arch) Then
    Begin
      readln(arch,D.id);
      readln(arch,D.fecha,D.tiempoSesion);
      writeln('Id: ', D.id);
      writeln('Fecha: ', D.fecha);
      writeln('Tiempo: ', D.tiempoSesion);
      writeln();
    End;
End;
Procedure generarDetalle ( Var arch: archivoDetalle; nombre: String);

Var 
  dat,txt: string;
  detalleTxt: Text;
  D: detalle;
Begin
  txt := nombre + '.txt';
  assign(detalleTxt,txt);
  reset(detalleTxt);
  dat := nombre + '.dat';
  assign(arch,dat);
  rewrite(arch);
  While Not eof(detalleTxt) Do
    Begin
      leerDetalleTxt(detalleTxt,D);
      write(arch,D);
    End;
  writeln('Archivo detalle ',dat,' exitosamente creado');
  writeln();
  writeln('-------------------------------------------');
  writeln();
  close(detalleTxt);
  close(arch);
End;
Procedure generarArchivosDetalles(Var V: vectDetalles );

Var 
  i: rango;
  vNombres: vectString;
Begin
  vNombres[1] := 'detalleUno';
  vNombres[2] := 'detalleDos';
  vNombres[3] := 'detalleTres';
  For i:= 1 To dimF Do
    generarDetalle(V[i],vNombres[i]);
  writeln('Se han generado todos los detalles.')
End;

Procedure imprimirMaestro( Var arch: archivoMaestro);

Var 
  M: maestro;
Begin
  reset(arch);
  While Not eof(arch) Do
    Begin
      read(arch,M);
      writeln('USER ID: ', M.id);
      writeln('- FECHA: ', M.fecha);
      writeln('- MINUTOS: ', M.tiempoTotal);
      writeln();
    End;
  close(arch);
End;
Procedure leerDetalle(Var arch: archivoDetalle; Var D: detalle);
Begin
  If (Not eof(arch)) Then
    read(arch, D)
  Else
    D.id := valorAlto;
End;
Procedure minimo(Var V: vectRegistros; Var min: detalle; Var vectD: vectDetalles
);

Var 
  i, minPos: integer;
Begin
  min.id := valorAlto;
  For i:= 1 To dimF Do
    Begin
      If (V[i].id < min.id) Then
        Begin
          min := V[i];
          minPos := i;
        End;
      If (min.id <> valorAlto) Then
        leerDetalle(vectD[minPos], V[minPos]);
    End;
End;
Procedure crearMaestro(Var archMaestro: archivoMaestro; Var V: vectDetalles);

Var 
  i: integer;
  min: detalle;
  reg: maestro;
  VRegistros: vectRegistros;
Begin
  For i:= 1 To dimF Do
    Begin
      reset(V[i]);
      leerDetalle(V[i], VRegistros[i]);
    End;
  assign(archMaestro, 'maestro.dat');
  rewrite(archMaestro);
  minimo(VRegistros, min, V);
  While (min.id <> valorAlto) Do
    Begin
      reg.id := min.id;
      reg.fecha := min.fecha;
      reg.tiempoTotal := 0;
      While (min.id <> valorAlto) And (min.id = reg.id) And (min.fecha = reg.
            fecha) Do
        Begin
          reg.tiempoTotal := reg.tiempoTotal + min.tiempoSesion;
          minimo(VRegistros, min, V);
        End;
      write(archMaestro, reg);
    End;
  close(archMaestro);
  For i:= 1 To dimF Do
    close(V[i]);
End;

Var 
  V: vectDetalles;
  archMaestro: archivoMaestro;
Begin
  generarArchivosDetalles(V);
  crearMaestro(archMaestro, V);
  imprimirMaestro(archMaestro);
End.
