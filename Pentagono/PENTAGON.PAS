program Pentagonos;
{ ==========================================================================
  Breve: Dibujo de pent gonos
  Se dibujan sucesivamente pent gonos cambiando el tama¤o, posici¢n, color
  e inclinaci¢n
  ==========================================================================}

uses Crt, Graph;

procedure IniciarGraficos;
var
  Driver, Modo, CodigoError: Integer;
begin
  Driver := Detect;
  InitGraph(Driver, Modo, 'BGI');
  CodigoError := GraphResult;
  if CodigoError <> grOk then
    Writeln('Error gr fico: ', GraphErrorMsg(CodigoError));
end;

procedure TrazarPentagono(X, Y, R, A: Integer);
var
  PX, PY: array[0..5] of Integer;
  I, J: Word;
begin
  for I := 0 to 5 do
    begin
      PX[I] := Round(X + R * Cos(2*Pi/5*I + A/180*Pi));
      PY[I] := Round(Y + R * Sin(2*Pi/5*I + A/180*Pi));
    end;
  for I := 1 to 5 do
    Line(PX[I-1], PY[I-1], PX[I], PY[I]);
  for I := 1 to 4 do
    for J := I+1 to 5 do
    Line(PX[I], PY[I], PX[J], PY[J]);
end;

procedure HacerPentagonos;
var
  X, Y, R, A : Integer;
begin
  X := GetMaxX div 2;
  Y := GetMaxY div 2;
  R := 50;
  A := 0;
  repeat
    SetColor(Random(16));
    TrazarPentagono(X, Y, R, A);
    Delay(150);
    SetColor(Black);
    TrazarPentagono(X, Y, R, A);
    Inc(A, -10);
    X := X + Random(11) - 5;
    R := R + Random(11) - 5;
    Y := Y + Random(10) - 5;
  until KeyPressed;
end;

procedure ControladorEGAVGA; external;
{$L EGAVGA.OBJ}

begin
  RegisterBGIdriver(@ControladorEGAVGA);
  IniciarGraficos;
  HacerPentagonos;
  CloseGraph;
end.
