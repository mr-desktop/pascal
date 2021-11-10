PROGRAM ATM;
USES CRT;

PROCEDURE keypress;
begin
  TextColor(YELLOW);
  writeln('Press any key to continue...');
  repeat until KeyPressed;
end;

VAR money, i, current:integer;
    cash:array[1..11] of integer = (2000, 1000, 500, 200, 100, 50, 25, 20, 10, 5, 1);

BEGIN
  ClrScr;
  TextColor(YELLOW);
  write('Input amount: ');
  TextColor(WHITE);
  readln(money);
  TextColor(BLUE);
  
  for i:= 1 to 11 do
  begin
    current:= cash[i];
    writeln(money div current, ' bill of ', current);
    money:= money mod current;
  end;
  
  keypress;
END.