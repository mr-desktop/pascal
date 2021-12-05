{Jes£s Rivas Primer Procedimiento}
Program Color;
uses crt;
Var Colo:Integer;
Begin
Repeat
Randomize;
Colo:=abs(Random(11))+1;
Textbackground(Colo);
clrscr;
Textcolor(Colo+1);
gotoxy(1,24);
Writeln('                                        ');
Delay(500);
Until Keypressed;
End.