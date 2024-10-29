
Program ejercicio6;

Type 
  prenda = Record
    cod: integer;
    desc: string[50];
    colores: string[50];
    tipo: string[20];
    stock: integer;
    precio: real;
  End;
  arch_prendas = file Of prenda;
Procedure leerPrenda(Var arch:Text ; Var P: prenda);
Begin
  readln(arch, P.cod);
  readln(arch, P.desc);
  readln(arch, P.colores);
  readln(arch, P.tipo);
  readln(arch, P.stock, P.precio);
  writeln('Codigo: ', P.cod);
  writeln('Descripcion: ', P.desc);
  writeln('Colores: ', P.colores);
  writeln('Tipo: ', P.tipo);
  writeln('Stock: ', P.stock);
  writeln('Precio Unitario: ', P.precio:0:2);
  writeln();
End;
Procedure convertirArchivo(Var txt: Text; Var arch: arch_prendas);

Var 
  P: prenda;
Begin
  Reset(txt);
  Assign(arch,'maestro.dat');
  Rewrite(arch);
  P.cod := 0;
  P.desc := '';
  P.colores := '';
  P.tipo := '';
  P.stock := 0;
  P.precio := 0;
  Write(arch,P);
  While Not Eof(txt) Do
    Begin
      leerPrenda(txt,P);
      Write(arch,P);
    End;
  Close(txt);
End;
Procedure imprimirArchivo(Var arch: arch_prendas);

Var 
  P: prenda;
Begin
  Reset(arch);
  While Not Eof(arch) Do
    Begin
      Read(arch,P);
      writeln('Codigo: ', P.cod);
      writeln('Descripcion: ', P.desc);
      writeln('Colores: ', P.colores);
      writeln('Tipo: ', P.tipo);
      writeln('Stock: ', P.stock);
      writeln('Precio Unitario: ', P.precio:0:2);
      writeln('--------------');
    End;
  Close(arch);
End;
Procedure eliminarPrenda(Var arch: arch_prendas; cod: integer);

Var 
  P: prenda;
  cumple: boolean;
Begin
  reset(arch);
  cumple := false;
  While (Not eof(arch) And (Not cumple)) Do
    Begin
      read(arch, P);
      If (P.cod = cod) Then
        Begin
          cumple := true;
          P.stock := -p.stock;
          seek(arch, filepos(arch) - 1);
          write(arch, P);
        End;
    End;
  Close(arch);
  If (Not cumple) Then
    writeln('No se encontro la prenda con el codigo ', cod);
End;
Procedure eliminarObsoletas(Var arch: arch_prendas);

Var 
  cod: integer;
  delet: Text;
Begin
  Assign(delet,'detalle.txt');
  Reset(delet);
  While (Not eof(delet)) Do
    Begin
      read(delet, cod);
      eliminarPrenda(arch, cod);
    End;
  Close(delet);
End;
Procedure nuevoStock(Var arch: arch_prendas; Var newStock: arch_prendas);

Var 
  P: prenda;
Begin
  reset(arch);
  assign(newStock, 'Temporal');
  rewrite(newStock);
  While Not eof(arch) Do
    Begin
      read(arch, P);
      If (P.stock > 0) Then
        Begin
          write(newStock, P);
        End;
    End;
  Close(arch);
  Close(newStock);
  erase(arch);
  rename(newStock, 'maestro.dat');
End;


Var 
  txtMaestro: Text;
  datMaestro,compactMaestro: arch_prendas;
Begin
  Assign(txtMaestro,'maestro.txt');
  convertirArchivo(txtMaestro,datMaestro);
  WriteLn('---- ARCHIVO ORIGINAL ----');
  imprimirArchivo(datMaestro);
  eliminarObsoletas(datMaestro);
  WriteLn('---- ARCHIVO CON BAJAS LOGICAS ----');
  imprimirArchivo(datMaestro);
  nuevoStock(datMaestro,compactMaestro);
  WriteLn('---- ARCHIVO CON BAJAS FISICAS ----');
  imprimirArchivo(compactMaestro);
End.
