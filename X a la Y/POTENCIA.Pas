program potencia;
uses crt;
var
   X, pot: real;
   Y, i: integer;
begin
Textbackground(Blue);
Textcolor(Yellow);
clrscr;
   writeln('** Calculo de la potencia X a la Y');
   writeln;

   write('Introduce Un Valor a X (real): '); readln(X);
   write('Introduce Un valor a Y (entero positivo): '); readln(Y);

   pot := 1;
   for i := 1 to Y do pot := pot * X;

   writeln;
   writeln(X, ' a la ', Y:1, ' es ', pot);
Repeat until Keypressed;
end.
