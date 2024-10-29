{Se dispone de un archivo con información de los alumnos de la Facultad de Informática. Por
cada alumno se dispone de su código de alumno, apellido, nombre, cantidad de materias
(cursadas) aprobadas sin final y cantidad de materias con final aprobado. Además, se tiene
un archivo detalle con el código de alumno e información correspondiente a una materia
(esta información indica si aprobó la cursada o aprobó el final).
Todos los archivos están ordenados por código de alumno y en el archivo detalle puede
haber 0, 1 ó más registros por cada alumno del archivo maestro. Se pide realizar un
programa con opciones para:
a. Actualizar el archivo maestro de la siguiente manera:
i.Si aprobó el final se incrementa en uno la cantidad de materias con final aprobado,
y se decrementa en uno la cantidad de materias sin final aprobado.
ii.Si aprobó la cursada se incrementa en uno la cantidad de materias aprobadas sin
final.
b. Listar en un archivo de texto aquellos alumnos que tengan más materias con finales
aprobados que materias sin finales aprobados. Teniendo en cuenta que este listado
es un reporte de salida (no se usa con fines de carga), debe informar todos los
campos de cada alumno en una sola línea del archivo de texto.
NOTA: Para la actualización del inciso a) los archivos deben ser recorridos sólo una vez}

Program ej2;

Const 
  valorAlto = 9999;

Type 
  alumno = Record
    codigo: integer;
    apellido: string;
    nombre: string;
    cantMateriasCursadas: integer;
    cantMateriasFinalesAprobados: integer;
  End;
  detalle = Record
    codigo: integer;
    estado: string;
  End;
  maestro = file Of alumno;
  detalleFile = file Of detalle;
Procedure generarDetalle(Var archivo:detalleFile;Var detalle: Text);

Var 
  dato: detalle;
Begin
  reset(archivo);
  reset(detalle);
  While (Not eof(detalle)) Do
    Begin
      readln(detalle,dato.codigo);
      readln(detalle,dato.estado);
      write(archivo,dato);
    End;
  close(archivo);
  close(detalle);
End;
Procedure generarMaestro(Var archivo:maestro;Var maestro: Text);

Var 
  dato: alumno;
Begin
  reset(maestro);
  reset(archivo);
  While (Not eof(maestro)) Do
    Begin
      readln(maestro,dato.codigo);
      readln(maestro,dato.apellido);
      readln(maestro,dato.nombre);
      readln(maestro,dato.cantMateriasCursadas, dato.
             cantMateriasFinalesAprobados);
      write(archivo,dato);
    End;
  close(maestro);
  close(archivo);
End;


Procedure leerDetalle(Var archivo:detalleFile; Var dato:detalle);
Begin
  If (Not eof(archivo)) Then
    read(archivo,dato)
  Else
    dato.codigo := valorAlto;
End;

Procedure actualizarMaestro(Var maestro:maestro; Var detalle:detalleFile);

Var 
  regM: alumno;
  regD: detalle;
Begin
  reset(maestro);
  reset(detalle);
  leerDetalle(detalle,regD);
  writeln('Codigo: ',regD.estado);
  While (regD.codigo <> valorAlto) Do
    Begin
      read(maestro,regM);
      While (regM.codigo <> regD.codigo) Do
        read(maestro,regM);
      While ((regM.codigo = regD.codigo) And (regD.codigo <> valorAlto)) Do
        Begin
          If (regD.estado = 'Final') Then
            Begin
              regM.cantMateriasFinalesAprobados := regM.
                                                   cantMateriasFinalesAprobados
                                                   + 1;
              regM.cantMateriasCursadas := regM.cantMateriasCursadas - 1;

              write('Codigo: ',regM.cantMateriasCursadas);
            End
          Else If (regD.estado = 'Cursada') Then
                 regM.cantMateriasCursadas := regM.cantMateriasCursadas + 1;
          leerDetalle(detalle,regD);
        End;
      seek(maestro, filepos(maestro) - 1);
      write(maestro,regM);
    End;
  close(maestro);
  close(detalle);
End;

Procedure imprimirMaestro(Var maestro:maestro);

Var 
  regM: alumno;
Begin
  reset(maestro);
  While (Not eof(maestro)) Do
    Begin
      read(maestro,regM);
      writeln('Codigo: ',regM.codigo);
      writeln('Apellido: ',regM.apellido);
      writeln('Nombre: ',regM.nombre);
      writeln('Cantidad de materias cursadas: ',regM.cantMateriasCursadas);
      writeln('Cantidad de materias con finales aprobados: ',regM.
              cantMateriasFinalesAprobados);
    End;
  close(maestro);
End;
Procedure generarTxt(Var archivo: Text; Var maestroFile: maestro);

Var 
  regM: alumno;
Begin
  reset(maestroFile);
  assign(archivo,'reporte.txt');
  rewrite(archivo);
  While (Not eof(maestroFile)) Do
    Begin
      read(maestroFile,regM);
      If (regM.cantMateriasFinalesAprobados > regM.cantMateriasCursadas) Then
        writeln(archivo,'Codigo: ',regM.codigo,' Apellido: ',regM.apellido,
                ' Nombre: ',regM.nombre,' Cantidad de materias cursadas: ',regM.
                cantMateriasCursadas,
                ' Cantidad de materias con finales aprobados: ',regM.
                cantMateriasFinalesAprobados);
    End;
End;

Var 
  maestrotxt: Text;
  detallee: Text;
  maestroFile: maestro;
  detalleeFile: detalleFile;
  informe: Text;
Begin
  assign(maestrotxt,'maestro.txt');
  assign(detallee,'detalle.txt');
  assign(maestroFile,'maestroFile.dat');
  assign(detalleeFile,'detalleFile.dat');
  rewrite(maestroFile);
  rewrite(detalleeFile);
  generarDetalle(detalleeFile,detallee);
  generarMaestro(maestroFile,maestrotxt);
  actualizarMaestro(maestroFile,detalleeFile);
  imprimirMaestro(maestroFile);
  generarTxt(informe,maestroFile);
End.
