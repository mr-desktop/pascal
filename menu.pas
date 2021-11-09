PROGRAM Menu;
USES CRT;

VAR k:char;
    options:array[1..4] of String = ('Copy', 'Paste', 'Cut', 'Erase');
    numberOptions, i, curr, key:integer;

PROCEDURE draw(height:integer);
begin
  gotoxy(1, 2);
  for i:= 1 to height do
  begin
    writeln('║                       ║');
  end;

  TextColor(WHITE);
  for i:= 1 to height do
  begin
    gotoxy(2, i + 1);
    writeln(options[i]);
  end;
end;

PROCEDURE highlight(color, option:integer);
begin
  TextBackground(color);
  gotoxy(2, option + 1);
  write(options[option]);
end;

BEGIN
  numberOptions:= length(options);
  ClrScr;
  TextColor(YELLOW);
  gotoxy(1, numberOptions + 3);
  writeln('Press <ESC> in order to close the menu.');
  TextColor(BLUE);
  gotoxy(1, 1);
  writeln('╔═══════════════════════╗');
  gotoxy(1, numberOptions + 2);
  writeln('╚═══════════════════════╝');
  
  draw(numberOptions);
  curr:= 1;
  highlight(CYAN, curr);
  while (k <> chr(27)) do
  begin
    k:= readkey;
    key:= ord(k);
    highlight(BLACK, curr);

    case (key) of
      72: curr:= curr - 1;
      80: curr:= curr + 1;
    end;

    if (curr < 1) then curr:= numberOptions;
    if (curr > numberOptions) then curr:= 1;

    highlight(CYAN, curr);
  end;

  gotoxy(1, numberOptions + 6);
END.