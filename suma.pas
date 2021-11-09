PROGRAM Suma;
USES CRT;

PROCEDURE keypress;
begin
  TextColor(YELLOW);
  writeln('Press any key to continue...');
  repeat until KeyPressed;
end;

VAR limit, i, acc:Longint;

BEGIN
  ClrScr;
  TextColor(YELLOW);
  write('Input length of sequence: ');
  TextColor(WHITE);
  readln(limit);
  TextColor(BLUE);
  
  for i:= 1 to limit do
  begin
    acc:= acc + i;
    writeln('pos(', i, ') => ', acc);
  end;
  
  keypress;
END.