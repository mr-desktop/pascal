PROGRAM RandomNumber;
USES CRT;

PROCEDURE keypress;
begin
  TextColor(YELLOW);
  writeln('Press any key to continue...');
  repeat until KeyPressed;
end;

VAR guess, rnd:integer;

BEGIN
  rnd:= random(100);
  ClrScr;
  TextColor(YELLOW);
  write('Guess the number: ');
  TextColor(WHITE);
  readln(guess);
  
  while (guess<>rnd) do
  begin
    TextColor(BLUE);
    if (guess > rnd) then
      writeln('your guess is bigger');
    if (guess < rnd) then
      writeln('your guess is smaller');
      
    TextColor(YELLOW);
    write('try again: ');
    TextColor(WHITE);
    readln(guess);
  end;
  
  TextColor(BLUE + BLINK);
  writeln('Congrats! the number is: ', rnd);
  
  keypress;
END.