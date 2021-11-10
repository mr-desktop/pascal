PROGRAM Fibonacci;
USES CRT;

PROCEDURE keypress;
begin
  TextColor(YELLOW);
  writeln('Press any key to continue...');
  repeat until KeyPressed;
end;

VAR limit, i, prev, curr:Longint;

BEGIN
  ClrScr;
  TextColor(YELLOW);
  write('Input length of fibonacci sequence: ');
  TextColor(WHITE);
  readln(limit);
  TextColor(BLUE);
  curr:= 0;
  prev:= 1;
  writeln('pos(1) => ', curr);
  
  for i:= 1 to limit-1 do
  begin
    curr:= curr + prev;
    prev:= curr - prev;
    writeln('pos(', i + 1, ') => ', curr);
  end;
  
  keypress;
END.