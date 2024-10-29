
{A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle.
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle
pueden venir 0, 1 ó más registros por cada provincia.}




Program ej4;

Const 
  valorAlto = 'ZZZ';

Type 
  maestro = Record
    nombreProvincia: String;
    cantPersonasAlfabetizadas: Integer;
    totalEncuestados: Integer;
  End;
  detalle = Record
    nombreProvincia: String;
    codLocalidad: Integer;
    cantAlfabetizados: Integer;
    cantEncuestados: Integer;
  End;
  fmaestro = file Of maestro;
  fdetalle = file Of detalle;
Procedure cargarDetalle(Var detalle: fdetalle;Var txtdetalle: Text);

Var 
  reg: detalle;
Begin
  reset(txtdetalle);
  reset(detalle);
  While (Not eof(txtdetalle)) Do
    Begin
      readln(txtdetalle, reg.nombreProvincia);
      readln(txtdetalle, reg.codLocalidad, reg.cantAlfabetizados, reg.
             cantEncuestados);
      write(detalle, reg);
    End;
  close(txtdetalle);
  close(detalle);
End;
Procedure cargarMaestro(Var maestro: fmaestro;Var txtmaestro: Text);

Var 
  reg: maestro;
Begin
  reset(txtmaestro);
  reset(maestro);
  While (Not eof(txtmaestro)) Do
    Begin
      readln(txtmaestro, reg.nombreProvincia);
      readln(txtmaestro, reg.cantPersonasAlfabetizadas, reg.totalEncuestados);
      write(maestro, reg);
    End;
  close(txtmaestro);
  close(maestro);
End;
Procedure leerDet(Var det: fdetalle; Var reg: detalle);
Begin
  If (Not eof(det)) Then
    read(det, reg)
  Else
    reg.nombreProvincia := valorAlto;
End;
Procedure minimo(Var det1, det2: fdetalle; Var reg1, reg2: detalle; Var min:
                 detalle);
Begin
  If (reg1.nombreProvincia < reg2.nombreProvincia) Then
    Begin
      min := reg1;
      leerDet(det1, reg1);
    End
  Else
    Begin
      min := reg2;
      leerDet(det2, reg2);
    End;
End;
Procedure actualizarMaestro(Var mae: fmaestro; Var det1, det2: fdetalle);

Var 
  regm: maestro;
  regd1, regd2, min: detalle;
Begin
  reset(mae);
  reset(det1);
  reset(det2);
  leerDet(det1, regd1);
  leerDet(det2, regd2);
  minimo(det1, det2, regd1, regd2, min);
  While (min.nombreProvincia <> valorAlto) Do
    Begin
      read(mae, regm);
      While (regm.nombreProvincia <> min.nombreProvincia) Do
        read(mae, regm);
      While (regm.nombreProvincia = min.nombreProvincia) Do
        Begin
          regm.cantPersonasAlfabetizadas := regm.cantPersonasAlfabetizadas + min
                                            .
                                            cantAlfabetizados;
          regm.totalEncuestados := regm.totalEncuestados + min.cantEncuestados;
          minimo(det1, det2, regd1, regd2, min);
        End;
      seek(mae, filepos(mae) - 1);
      write(mae, regm);
    End;
  close(mae);
  close(det1);
  close(det2);
End;
Procedure imprimirMaestro(Var mae: fmaestro);

Var 
  regm: maestro;
Begin
  reset(mae);
  While (Not eof(mae)) Do
    Begin
      read(mae, regm);
      writeln('Nombre de provincia: ', regm.nombreProvincia);
      writeln('Cantidad de personas alfabetizadas: ', regm.
              cantPersonasAlfabetizadas);
      writeln('Total de encuestados: ', regm.totalEncuestados);
    End;
  close(mae);
End;

Var 
  maetxt, dettxt1, dettxt2: Text;
  mae: fmaestro;
  det1,det2: fdetalle;
Begin
  assign(maetxt, 'maestro.txt');
  assign(mae, 'maestro.dat');
  rewrite(mae);
  assign(det1, 'detalleUno.dat');
  assign(det2, 'detalleDos.dat');
  rewrite(det1);
  rewrite(det2);
  assign(dettxt1, 'detalleUno.txt');
  assign(dettxt2, 'detalleDos.txt');
  cargarDetalle(det1, dettxt1);
  cargarDetalle(det2, dettxt2);
  cargarMaestro(mae, maetxt);
  actualizarMaestro(mae, det1, det2);
  imprimirMaestro(mae);
End.
