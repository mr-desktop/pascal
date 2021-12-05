Program Enter_the_MATRIX;
uses crt;
var opcion:char;color:byte;repetir:boolean;

{****************************************************************************}{

Bueno, mapita

           PPal-->Columnas----> *Llenar
                          \---> *Tirar_1--> *Rndcar
                           \--> *Aleat <----/

                                                                             
  }
{***************************************************************************ÿ
}function aleat:char; {Esta funci¢n devuelve un caracter de la tabla 
ASCII}
Begin                {entre los valores 131 y 159 o entre 224 y 253}
   if random(2)+1=2 then
             aleat:=char(random(28)+132)
      else   aleat:=char(random(29)+225);
end;

{****************************************************************************}

Procedure rndcar;{Este procedimiento escribe un caracter aleatorio 
usando 
la}
var x,y:byte;  {funci¢n aleat, y lo pone en un lugar aleatorio de la 
pantalla}
Begin
  repeat
  x:=random(80)+1;{Este repeat no deja que se escriba un caracter en la 
}
  y:=random(50)+1;{posici¢n (80,50), porque en ese caso, escribe la 
letra y}
  gotoxy(x,y);    {baja un rengl¢n (xq lleg¢ al final de la pantalla)}
  until (x<>80) or (y<>50);
  write(aleat);
end;

{****************************************************************************}

Procedure tirar1(color:byte);
var x,y,i:byte;{Usando el porcedimiento rndcar, genera 10 caracteres 
aleatorios}
Begin      {cada vez que se lo llama, y los pone en color brillante}
textcolor(color+8);       {Ver programita "colores.pas"}
rndcar;
textcolor(color);
for i:=1 to 40 do begin
              repeat    {Este repeat es igual q el de arriba, pero me 
dio}
                        {pancha transformarlo en una funci¢n}
              x:=random(80)+1;y:=random(50)+1;
              gotoxy(x,y);  {ac  tira espacios en blanco, 10 por cada 
vuelta}
              until (x<>80) or (y<>50);
              write(' ');
              end;

end;

{****************************************************************************}

Procedure llenar(color:byte);
var i:word; {Este procedimiento es parecido a tirar1, pero en lugar de 
10}
Begin         {caracteres brillantes, tira 100 en color oscuro}
   textcolor(color);
   for i:=1 to 20 do rndcar
   end;

{****************************************************************************}

Procedure columnas(color:byte);
var
pos,pos2,pos3,pos4,i,i2,i3,i4,adit2,adit3,adit4:byte;car,car2,car3,car4:char;
Begin                {Este choclazo de procedimiento, genera las 
columnas}
   Randomize;         {q caen desde arriba. Tambi‚n, cada vez que las }
   Repeat             {columnas bajan un espacio, llama a los
procedimientos}
    pos:=Random(79)+1;{llenar y tirar1}
    pos2:=Random(79)+1;
    pos3:=Random(79)+1;{pos es la ubicaci¢n en X (horiz) de cada 
columna}
    pos4:=Random(79)+1;{como la pantalla est  en "mode 80", q es la 
predet.
de}
    adit2:=random(7);  {DOS, hay 80 posiciones para las columnas. Pero
llega}
    adit3:=random(10); {hasta 79 porque si tira una columna por la 
posici¢n}
    adit4:=random(5);  {x=80, cuando llega a (50,80) baja un rengl¢n}
    for i:=1 to 50 do
    Begin              {esto se repite 50 veces, xq es la cantidad de }
      llenar(color);   {renglones q tardan en llegar hasta a abajo. 
Por}
      tirar1(color);   {cada rengl¢n q baja, llama a llenar y a tirar1}
      car:=aleat;
      car2:=aleat;     {asigno a los car el valor de la funci¢n aleat, 
q
est }
      car3:=aleat;     {arriba, y q es obvio q genera un caracter 
aleatorio}
      car4:=aleat;
      i2:=i-adit2;
      i3:=i-adit3;     {i indica la altura de la columna ppal, la 2, la 
3, 
y}
      i4:=i-adit4;     {la 4 tienen una altura algo menor (por eso la 
resta}
      textcolor(white);
      gotoxy(pos,i);       {ac  se escribe un caracter en color BLANCO 
al }
      write(car);          {principio de cada columna}
      gotoxy(pos2,i2);
      write(car2);
      gotoxy(pos3,i3);
      write(car3);
      gotoxy(pos4,i4);
      write(car4);
      delay(50);
      textcolor(color+8);  {ahora, despu‚s de 50 milisegundos (el 
delay)}
      gotoxy(pos,i);       {vuelve a cada principio de columna y 
escribe}
      write(car);          {EL MISMO caracter pero en el color que se
eligi¢}
      gotoxy(pos2,i2);     {(en modo "brillante", color+8) }
      write(car2);         {si no queda claro lo de color "brillante" 
ver 
el}
      gotoxy(pos3,i3);     {programa "colores.pas". La dif entre un 
color}
      write(car3);         {y su versi¢n oscura es de 8}
      gotoxy(pos4,i4);
      write(car4);
      delay(20)
    end;
  Until keypressed;    {keypressed es una funci¢n q viene con pascal. 
Es
                        booleana, y toma valor TRUE cuando se aprieta }
  end;                  {cualquier tecla}

{****************************************************************************}

Begin                                    {Principal}
  clrscr;
  TextMode(Lo(LastMode)+Font8x8);{Esta l¡nea la rob‚ de un ejemplo de 
pascal}
                                    {Pone el modo de pantalla 80x50}
  textcolor(lightgray);{color normal de DOS}
  writeln('Bienvenido al Simulador Matrix, por Santiago "Big Lamp" Alvarez');
  writeln('Para que se vea bien, ten‚s que tener puesto el modo pantalla completa');
  writeln('(Alt+Enter)');
  writeln(' ');                      {bueno, el resto es ch chara y es 
obvia}
  writeln(' ');
  textcolor(white);
  REPEAT
  writeln('De qu‚ color quer‚s la matrix?');
  writeln('1.Azul');
  writeln('2.Clasic (verde)');
  writeln('3.Celeste');
  writeln('4.Rojo');
  writeln('5.Violeta');
  writeln('6.Gris');
  write('Elej¡ un n£mero (1...6). Para parar la Matrix, presion  Esc y esper  dos segundos: ');
  readln(color);
  if color=6 then color:=7;
  if (color>7) or (color=6) then
     begin
      writeln(' ');
      writeln('DALE, ac  no hay mensajitos divertidos si pon‚s cualquier cosa');
      repetir:=true
     end
      else begin
            clrscr;
            columnas(color);
            clrscr;
            write('¨Quer‚s otra Matrix?(S/N): ');
            readln(opcion);
            if (opcion='s')or(opcion='S') then repetir:=true else 
repetir:=false
           end;
  writeln(' ');writeln(' ');
  until not repetir
end.