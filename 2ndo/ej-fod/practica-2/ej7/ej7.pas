
Program ejercicio7;

Const 
  dimF = 3;
  valorAlto = 999;

Type 
  rango = 1..dimF;

  maestro = Record
    id: integer;
    nombre: string[15];
    cepa: integer;
    nombreCepa: string[10];
    activos: integer;
    nuevos: integer;
    recup: integer;
    fallec: integer;
  End;
  detalle = Record
    id: integer;
    cepa: integer;
    activos: integer;
    nuevos: integer;
    recup: integer;
    fallec: integer;
  End;

  archivoDetalle = file Of detalle;
  archivoMaestro = file Of maestro;

  vectDetalle = array [rango] Of  archivoDetalle;
  vectRegistro = array [rango] Of  detalle;
  vectStrings = array [rango] Of  string;

Procedure leerMaestroTxt (Var txt: Text ; Var M: maestro);
Begin
  readln(txt,M.id);
  readln(txt,M.nombre);
  readln(txt,M.cepa);
  readln(txt,M.nombreCepa);
  readln(txt,M.activos,M.nuevos,M.recup,M.fallec);
End;
Procedure generarMaestro ( Var txt: Text ; Var arch: archivoMaestro);

Var 
  M: maestro;
Begin
  reset(txt);
  While Not eof(txt) Do
    Begin
      leerMaestroTxt(txt, M);
      write(arch,M);
    End;
  close(txt);
  close(arch);
End;
Procedure leerDetalleTxt(Var txt: Text ; Var D: detalle);
Begin
  readln(txt,D.id,D.cepa);
  readln(txt,D.activos,D.nuevos,D.recup,D.fallec);
  writeln('ID:',D.id);
  writeln('CEPA:',D.cepa);
  writeln('ACTIVOS:',D.activos);
  writeln('NUEVOS:',D.nuevos);
  writeln('RECUPERADOS:',D.recup);
  writeln('FALLECIDOS:',D.fallec);
  writeln();
End;
Procedure cargarDetalle (Var arch: archivoDetalle ; nombre : String );

Var 
  D: detalle;
  txt: Text;
Begin
  assign(txt,nombre+'.txt');
  reset(txt);
  assign(arch,nombre+'.dat');
  rewrite(arch);
  While Not eof(txt) Do
    Begin
      leerDetalleTxt(txt,D);
      writeln('-----');
      writeln();
      write(arch,D)
    End;
  writeln('***************');
  close(arch);
  close(txt);
End;
Procedure generarDetalles ( Var V: vectDetalle);

Var 
  i: integer;
  vNombres: vectStrings;
Begin
  vNombres[1] := 'detalleUno';
  vNombres[2] := 'detalleDos';
  vNombres[3] := 'detalleTres';
  For i:=1 To dimF Do
    cargarDetalle(V[i],vNombres[i]);
End;
Procedure leerDetalle(Var arch: archivoDetalle; Var D: detalle);
Begin
  If (Not eof(arch)) Then
    read(arch,D)
  Else
    D.id := valorAlto;
End;
Procedure minimo(Var V: vectDetalle; Var min: detalle;Var vecReg: vectRegistro);

Var 
  i, posMin: integer;
Begin
  min.id := valorAlto;
  For i:= 1 To dimF Do
    Begin
      If (vecReg[i].id < min.id) Or ((min.id = vecReg[i].id) And (vecReg[i].cepa
         <
         min.cepa)) Then
        Begin
          min := vecReg[i];
          posMin := i;
        End;
      If (min.id <> valorAlto) Then
        leerDetalle(V[posMin],vecReg[posMin]);
    End
End;
Procedure actualizarMaestro(Var M: archivoMaestro; D: vectDetalle);

Var 
  i, activos,loc50: integer;
  maes: maestro;
  regs: vectRegistro;
  min: detalle;
Begin
  loc50 := 0;
  For i:= 1 To dimF Do
    Begin
      reset(D[i]);
      leerDetalle(D[i],regs[i]);
    End;
  minimo(D,min,regs);
  reset(M);
  While (min.id <> valorAlto) Do
    Begin
      read(M,maes);
      activos := 0;
      While ((min.id = maes.id) And (min.cepa = maes.cepa) And (min.id <>
            valorAlto)) 
        Do
        Begin
          activos := activos + min.activos;
          maes.fallec := maes.fallec + min.fallec;
          maes.recup := maes.recup + min.recup;
          maes.nuevos := min.nuevos;
          maes.activos := min.activos;
          minimo(D,min,regs);
        End;
      seek(M,filePos(M)-1);
      write(M,maes);
      If (activos > 50) Then
        loc50 := loc50 + 1;
    End;
  For i:= 1 To dimF Do
    close(D[i]);
  close(M);
End;
Procedure imprimirMaestro( Var arch : archivoMaestro);

Var 
  M: maestro;
Begin
  reset(arch);
  While Not eof(arch) Do
    Begin
      read(arch,M);
      writeln('Ciudad: ',M.nombre);
      writeln('- id: ',M.id);
      writeln('- cepa: ',M.cepa);
      writeln('- nombre cepa: ',M.nombreCepa);
      writeln('- cantidad activos: ',M.activos);
      writeln('- cantidad nuevos: ',M.nuevos);
      writeln('- cantidad recuperados: ',M.recup);
      writeln('- cantidad fallecidos: ',M.fallec);
      writeln();
    End;
  close(arch);
End;

Var 
  maestroTxt: Text;
  maestroDat: archivoMaestro;
  V: vectDetalle;
Begin
  assign(maestroTxt,'maestro.txt');
  assign(maestroDat,'maestro.dat');
  rewrite(maestroDat);
  generarMaestro(maestroTxt, maestroDat);
  writeln('----- Archivo Maestro -----');
  writeln();
  imprimirMaestro(maestroDat);
  writeln('---------------------------');
  writeln();
  generarDetalles(V);
  actualizarMaestro(maestroDat, V);
  writeln('----- Archivo Maestro Actualizado -----');
  writeln();
  imprimirMaestro(maestroDat);
  writeln('---------------------------------------');
  writeln();
End.
