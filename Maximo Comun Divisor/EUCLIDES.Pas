program euclides;
uses Crt;
var a, b, r: integer;
begin
Textbackground(Blue);
Textcolor(White);
clrscr;
   writeln('Introduce Un Valor'); readln(a);
   writeln('Introduce Otro Valor'); readln(b); writeln;

   if (a < 0) then a := -a;
   if (b < 0) then b := -b;

   while (b <> 0) do begin r := a mod b; a := b; b := r end;

   writeln('El maximo comun divisor es: ', a:2);

repeat until keypressed;
end.
