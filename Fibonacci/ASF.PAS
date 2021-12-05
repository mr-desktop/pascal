{Jesus Rivas}

program fibonacci;
uses crt;
var A,B,C,D,E:longint;
begin
textbackground(blue);
clrscr;
Textcolor(White);
writeln('Introduzca un Numero: ');
Writeln;
readln(E);
Textcolor(yellow);
writeln;
if E <= 1 then writeln('1');
if E <= 2 then writeln('1');
if E = 1 then
if E = 2 then
begin
end;
B:=1; D:=1;
for C:= 1 to (E-2) do
begin
A:= B + D;
B:= D;
D:= A;
writeln(A);
end;
repeat until keypressed;
end.