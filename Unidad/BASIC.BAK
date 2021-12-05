{ ********************************** }
{ * Nombre:Jesฃs Miguel Rivas      * }
{ * Titulo:Unidad Latina(Basic)    * }
{ * Fecha:05-06                    * }
{ ********************************** }

  Unit Basic;
  Interface
  Const

{ ษอออออออออออออออออออออออออออออออออออป }
{ บ      Colores de Texto/Fondo       บ }
{ ฬออออออออออหอออออออออหออออออออออออออน }
{ บ  Basic   บ Cขdigo  บ     Crt      บ }
{ ฬออออออออออฮอออออออออฮออออออออออออออน }
{ บ Negro    บ    0    บ Black        บ }
{ บ Azul     บ    1    บ Blue         บ }
{ บ Verde    บ    2    บ Green        บ }
{ บ Cyan     บ    3    บ Cyan         บ }
{ บ Rojo     บ    4    บ Red          บ }
{ บ Morado   บ    5    บ Magenta      บ }
{ บ Marron   บ    6    บ Brown        บ }
{ บ Griscl   บ    7    บ LightGray    บ }
{ บ Gris     บ    8    บ DarkGray     บ }
{ บ Azulcl   บ    9    บ LighhtBlue   บ }
{ บ Verdecl  บ    10   บ LightGreen   บ }
{ บ Cyancl   บ    11   บ LightCyan    บ }
{ บ Rojocl   บ    12   บ Lightred     บ }
{ บ Moradocl บ    13   บ LightMagenta บ }
{ บ Amarillo บ    14   บ Yellow       บ }
{ บ Blanco   บ    15   บ White        บ }
{ บ Parp     บ    128  บ Blink        บ }
{ ศออออออออออสอออออออออสออออออออออออออผ }

  Negro=0;    Azul=1;       Verde=2;      Cyan=3;
  Rojo=4;     Morado=5;     Marron=6;     Griscl=7;
  Gris=8;     Azulcl=9;     Verdecl=10;   Cyancl=11;
  Rojocl=12;  Moradocl=13;  Amarillo=14;  Blanco=15;

  { Hace que Parpade un color de texto Ej: }
  { ClTexto(Rojo+parp);                    }
  Parp=128;

  Type
       Corto=Byte;
       { [0..255] }

       Medio=Integer;
       { [-32768..32767] }

       Largo=Longint;
       { [-2147483648..2147483647] }

       Codigo=Char;
       { [Cขdigo] }

       Texto=String;
       { [Textos] }

       Decimal=Double;
       { [(5.0)^(-324)..(1.7)^(308)] }

  { ***** Crt ***** }
  Procedure Tecleo;
  Procedure Limpia;
  Procedure ClTexto(Texto:Corto);
  Procedure ClFondo(Fondo:Corto);
  { ***** Crt ***** }

  Procedure Tardanza(Tiempo:Medio);
  Procedure Bordes(X:Corto);
  Procedure Fecha(X:Corto);
  Procedure Tiempo(X:Corto);
  Function Elevar(X,Y:Medio):Medio;
  Procedure Ir(X,Y:Medio);

  Implementation
  Uses Crt,Dos;

{ ***************************** Crt *********************** }
  Procedure Tecleo;
  { Espera a que se presione una Tecla }
  Begin
  Readkey;
  End;

  Procedure Limpia;
  { Limpia la Pantalla }
  Begin
  Clrscr;
  End;

  Procedure ClTexto(Texto:Corto);
  { Cambia el Color de texto }
  Begin
  TextColor(Texto);
  End;

  Procedure ClFondo(Fondo:Corto);
  { Cambia el Color de Fondo }
  Begin
  TextBackground(Fondo);
  End;

{ ********************************************************* }
  { Mueve el Cursor a un lugar del plano cartesiano }
  Procedure Ir(X,Y:Medio);
  Begin
  Gotoxy(X,Y);
  End;

{ ********************************************************* }
  { Crea una Tardanza que se mide en Segundos }
  Procedure Tardanza(Tiempo:Medio);
  Tiempo:=Tiempo*1000;
  Delay(Tiempo);
  End;

{ ********************************************************* }
  { Escribe: <un Numero> elevado a <otro numero> }
  Function Elevar(X,Y:Medio):Medio;
  var A, B: integer;
  begin
  A:=1;
  for B:=1 to Y do A:=A*X;
  X:=A;
  Write(X);
  End;

{ ********************************************************* }
  { Dibuja un Borde del color que se elige }
  Procedure  Bordes(X:Corto);
  Var Y:Byte;
  Begin
  Textcolor(X);
  Y:= 2;
  Gotoxy(1,1);  Write('ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
  Gotoxy(1,49); Write('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
  Repeat
  Gotoxy(1,Y); Write('บ');
  Gotoxy(80,Y); Write('บ');
  Y:=Y+1;
  if Y=49 then Y:=0;
  Until (Y=0);
  GotoXy(2,2);
  End;

{ ********************************************************* }
  { Escribe la fecha del sistema }
  Procedure Fecha(X:Corto);
  Var Ao,Ms,Da,Ds:Word;
      A1,A2,A3,A4,Z,Fechas:String;
  Begin
  TextColor(X);
  Getdate(Ao,Ms,Da,Ds);
  str(Ao,A1); str(Ms,A2);
  str(Da,A3);
  If Ds = 0 then Z:='Domingo';
  If Ds = 1 then Z:='Lunes';
  If Ds = 2 then Z:='Martes';
  If Ds = 3 then Z:='Miercoles';
  If Ds = 4 then Z:='Jueves';
  If Ds = 5 then Z:='Viernes';
  If Ds = 6 then Z:='Sabado';
  Fechas:=Concat(A3,'\',A2,'\',A1,'  ',Z);
  Write(Fechas);
  End;

{ ********************************************************* }
  { Escribe el tiempo del Sistema }
  Procedure Tiempo(X:Corto);
  Var H,M,S,C:Word;
      B1,B2,B3:String;
  Begin
  TextColor(X);
  Gettime(H,M,S,C);
  str(H,B1); str(M,B2);
  str(S,B3);
  Writeln;
  Write(B1,':',B2,':',B3);
  End;

{ *******************Fin de La Unidad********************** }
  End.

  Creado por Jesฃs Rivas
  ญSe Habla Espaคol!  :-)