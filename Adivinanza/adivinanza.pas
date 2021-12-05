 program juego;
 uses crt;
 var
 numero, conjetura, contador: integer;
 begin
 Randomize;
 clrscr;
 begin
 textbackground(17);
 writeln('');
 clrscr;
 textbackground(17);
 textcolor(white+blink);
 writeln(' -------------------------------------------------------------------------- ');
 writeln('|      Bienvenido al juego de adivinanzas. Escoger‚ un n£mero              |');
 writeln('|         entre 1 y 100; usted intentar  adivinar cu l es                  |');
 writeln('|                    Tiene siete oportunidades                             |');
 writeln(' -------------------------------------------------------------------------- ');
 end;
 textbackground(white+blink);
 textcolor(red);
 repeat
 numero:=abs(random(100))+1;
 contador:=0;
 repeat
 writeln('');
 write('¨Cu l es el n£mero? : ');
 readln(conjetura);
 if (conjetura = numero) then
    write('*ADIVINASTE*')
 else
    if conjetura < numero then
       write('*Muy peque¤o*')
    else write('*Demasiado grande*');
 contador:=contador+1;
 until (conjetura=numero) or (contador=7);
 if conjetura <> numero then
    writeln('Dejalo ahi y Dedicate a cantar*');
 writeln(' ');
 writeln(' ');
 writeln('*El Numero era:', numero,'*');
 writeln(' ');
 write('Desea Jugar Otra Vez  ?   S/N  :  ');
 until upcase(readkey)='N'
 end.

