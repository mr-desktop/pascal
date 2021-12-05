{ -------------------------  Jes£s  ------------------------- }
{ -----------------------  #38 - 2doD  ---------------------- }
Program Procedi_Avanzado;
Uses Crt;
Var X,Y,X2,Y2,X3,Y3,X4,Y4:Byte;
Const  Tard = 1000;

Procedure S01;
Begin
X4:=X; Y2:=Y; X3:=X2; Y4:=Y3;

Textcolor(red);
Textbackground(blue);
Gotoxy(35,25); Write('Jes£s Rivas');

Textcolor(Lightcyan);
Textbackground(black);
Gotoxy(X,Y); Write(Chr(9));

Textcolor(Lightblue);
Gotoxy(X2,Y2); Write(Chr(9));

Textcolor(Lightgreen);
Gotoxy(X3,Y3); Write(Chr(9));

Textcolor(Lightred);
Gotoxy(X4,Y4); Write(Chr(9));
End;

Procedure S02;
Begin
End;

{ -------------------------  Cuadro #6  ------------------------- }
Procedure C6;
Begin
Repeat
S01;

Textcolor(Lightcyan);
If (X = 51) And (Y >= 10) Then Y:=Y+1;
If (X = 51) And (Y = 13) Then Gotoxy(51,13);
If (X = 51) And (Y = 13) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 30) And (Y2 >= 10) Then Y2:=Y2+1;
If (X2 = 30) And (Y2 = 13) Then Gotoxy(30,13);
If (X2 = 30) And (Y2 = 13) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 = 30) And (Y3 <= 40) Then Y3:=Y3-1;
If (X3 = 30) And (Y3 = 37) Then Gotoxy(30,37);
If (X3 = 30) And (Y3 = 37) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 51) And (Y4 <= 40) Then Y4:=Y4-1;
If (X4 = 51) And (Y4 = 37) Then Gotoxy(51,37);
If (X4 = 51) And (Y4 = 37) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X >= 51) And (Y = 13) Then X:=X+1;
If (X = 69) And (Y = 13) Then Gotoxy(69,13);
If (X = 69) And (Y = 13) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 <= 30) And (Y2 = 13) Then X2:=X2-1;
If (X2 = 12) And (Y2 = 13) Then Gotoxy(12,13);
If (X2 = 12) And (Y2 = 13) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 <= 30) And (Y3 = 37) Then X3:=X3-1;
If (X3 = 12) And (Y3 = 37) Then Gotoxy(12,37);
If (X3 = 12) And (Y3 = 37) Then Write(Chr(9));

Textcolor(lightred);
If (X4 >= 51) And (Y4 = 37) Then X4:=X4+1;
If (X4 = 69) And (Y4 = 37) Then Gotoxy(69,37);
If (X4 = 69) And (Y4 = 37) Then Write(Chr(9));

If ((X = 69) And (Y = 13)) Or ((X4 = 69) And (Y4 = 37)) Or ((X3 = 12) And (Y3 = 37)) Then S02;

Delay(Tard);
Until Keypressed;
End;
{ -------------------------  Cuadro #6  ------------------------- }

{ -------------------------  Cuadro #5  ------------------------- }
Procedure C5;
Begin
Repeat
S01;

Textcolor(Lightcyan);
If (X = 49) And (Y >= 8) Then Y:=Y+1;
If (X = 49) And (Y = 15) Then Gotoxy(49,15);
If (X = 49) And (Y = 15) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 32) And (Y2 >= 8) Then Y2:=Y2+1;
If (X2 = 32) And (Y2 = 15) Then Gotoxy(32,15);
If (X2 = 32) And (Y2 = 15) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 = 32) And (Y3 <= 42) Then Y3:=Y3-1;
If (X3 = 32) And (Y3 = 35) Then Gotoxy(32,35);
If (X3 = 32) And (Y3 = 35) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 49) And (Y4 <= 42) Then Y4:=Y4-1;
If (X4 = 49) And (Y4 = 35) Then Gotoxy(49,35);
If (X4 = 49) And (Y4 = 35) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X >= 49) And (Y = 15) Then X:=X+1;
If (X = 71) And (Y = 15) Then Gotoxy(71,15);
If (X = 71) And (Y = 15) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 <= 32) And (Y2 = 15) Then X2:=X2-1;
If (X2 = 10) And (Y2 = 15) Then Gotoxy(10,15);
If (X2 = 10) And (Y2 = 15) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 <= 32) And (Y3 = 35) Then X3:=X3-1;
If (X3 = 10) And (Y3 = 35) Then Gotoxy(10,35);
If (X3 = 10) And (Y3 = 35) Then Write(Chr(9));

Textcolor(lightred);
If (X4 >= 49) And (Y4 = 35) Then X4:=X4+1;
If (X4 = 71) And (Y4 = 35) Then Gotoxy(71,35);
If (X4 = 71) And (Y4 = 35) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X = 71) And (Y <= 15) Then Y:=Y-1;
If (X = 71) And (Y = 10) Then Gotoxy(71,10);
If (X = 71) And (Y = 10) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 10) And (Y2 <= 15) Then Y2:=Y2-1;
If (X2 = 10) And (Y2 = 10) Then Gotoxy(10,10);
If (X2 = 10) And (Y2 = 10) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 = 10) And (Y3 >= 35) Then Y3:=Y3+1;
If (X3 = 10) And (Y3 = 40) Then Gotoxy(10,40);
If (X3 = 10) And (Y3 = 40) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 71) And (Y4 >= 35) Then Y4:=Y4+1;
If (X4 = 71) And (Y4 = 40) Then Gotoxy(71,40);
If (X4 = 71) And (Y4 = 40) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X <= 71) And (Y = 10) And (X <> 49) Then X:=X-1;
If (X = 51) And (Y = 10) Then Gotoxy(51,10);
If (X = 51) And (Y = 10) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 >= 10) And (Y2 = 10) And (X2 <> 32) Then X2:=X2+1;
If (X2 = 30) And (Y2 = 10) Then Gotoxy(30,10);
If (X2 = 30) And (Y2 = 10) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 >= 10) And (Y3 = 40) And (X3 <> 32) Then X3:=X3+1;
If (X3 = 30) And (Y3 = 40) Then Gotoxy(10,40);
If (X3 = 30) And (Y3 = 40) Then Write(Chr(9));

Textcolor(lightred);
If (X4 <= 71) And (Y4 = 40) And (X4 <> 49) Then X4:=X4-1;
If (X4 = 51) And (Y4 = 40) Then Gotoxy(51,40);
If (X4 = 51) And (Y4 = 40) Then Write(Chr(9));

If (X = 51) And (Y = 10) Then C6;

Delay(Tard);
Until Keypressed;
End;
{ -------------------------  Cuadro #5  ------------------------- }

{ -------------------------  Cuadro #4  ------------------------- }
Procedure C4;
Begin
Repeat
S01;

Textcolor(Lightcyan);
If (X = 47) And (Y >= 6) Then Y:=Y+1;
If (X = 47) And (Y = 17) Then Gotoxy(47,17);
If (X = 47) And (Y = 17) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 34) And (Y2 >= 6) Then Y2:=Y2+1;
If (X2 = 34) And (Y2 = 17) Then Gotoxy(34,17);
If (X2 = 34) And (Y2 = 17) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 = 34) And (Y3 <= 44) Then Y3:=Y3-1;
If (X3 = 34) And (Y3 = 33) Then Gotoxy(34,33);
If (X3 = 34) And (Y3 = 33) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 47) And (Y4 <= 44) Then Y4:=Y4-1;
If (X4 = 47) And (Y4 = 33) Then Gotoxy(47,33);
If (X4 = 47) And (Y4 = 33) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X >= 47) And (Y = 17) Then X:=X+1;
If (X = 73) And (Y = 17) Then Gotoxy(73,17);
If (X = 73) And (Y = 17) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 <= 34) And (Y2 = 17) Then X2:=X2-1;
If (X2 = 8) And (Y2 = 17) Then Gotoxy(8,17);
If (X2 = 8) And (Y2 = 17) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 <= 34) And (Y3 = 33) Then X3:=X3-1;
If (X3 = 8) And (Y3 = 33) Then Gotoxy(8,33);
If (X3 = 8) And (Y3 = 33) Then Write(Chr(9));

Textcolor(lightred);
If (X4 >= 47) And (Y4 = 33) Then X4:=X4+1;
If (X4 = 73) And (Y4 = 33) Then Gotoxy(73,33);
If (X4 = 73) And (Y4 = 33) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X = 73) And (Y <= 17) Then Y:=Y-1;
If (X = 73) And (Y = 8) Then Gotoxy(73,8);
If (X = 73) And (Y = 8) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 8) And (Y2 <= 17) Then Y2:=Y2-1;
If (X2 = 8) And (Y2 = 8) Then Gotoxy(8,8);
If (X2 = 8) And (Y2 = 8) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 = 8) And (Y3 >= 33) Then Y3:=Y3+1;
If (X3 = 8) And (Y3 = 42) Then Gotoxy(8,42);
If (X3 = 8) And (Y3 = 42) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 73) And (Y4 >= 33) Then Y4:=Y4+1;
If (X4 = 73) And (Y4 = 42) Then Gotoxy(73,42);
If (X4 = 73) And (Y4 = 42) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X <= 73) And (Y = 8) And (X <> 47) Then X:=X-1;
If (X = 49) And (Y = 8) Then Gotoxy(49,8);
If (X = 49) And (Y = 8) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 >= 8) And (Y2 = 8) And (X2 <> 34) Then X2:=X2+1;
If (X2 = 32) And (Y2 = 8) Then Gotoxy(32,8);
If (X2 = 32) And (Y2 = 8) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 >= 8) And (Y3 = 42) And (X3 <> 34) Then X3:=X3+1;
If (X3 = 32) And (Y3 = 42) Then Gotoxy(32,42);
If (X3 = 32) And (Y3 = 42) Then Write(Chr(9));

Textcolor(lightred);
If (X4 <= 73) And (Y4 = 42) And (X4 <> 47) Then X4:=X4-1;
If (X4 = 49) And (Y4 = 42) Then Gotoxy(49,42);
If (X4 = 49) And (Y4 = 42) Then Write(Chr(9));

If (X = 49) And (Y = 8) Then C5;

Delay(Tard);
Until Keypressed;
End;
{ -------------------------  Cuadro #4  ------------------------- }

{ -------------------------  Cuadro #3  ------------------------- }
Procedure C3;
Begin
Repeat
S01;

Textcolor(Lightcyan);
If (X = 45) And (Y >= 4) Then Y:=Y+1;
If (X = 45) And (Y = 19) Then Gotoxy(45,19);
If (X = 45) And (Y = 19) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 36) And (Y2 >= 4) Then Y2:=Y2+1;
If (X2 = 36) And (Y2 = 19) Then Gotoxy(36,19);
If (X2 = 36) And (Y2 = 19) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 = 36) And (Y3 <= 46) Then Y3:=Y3-1;
If (X3 = 36) And (Y3 = 31) Then Gotoxy(36,31);
If (X3 = 36) And (Y3 = 31) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 45) And (Y4 <= 46) Then Y4:=Y4-1;
If (X4 = 45) And (Y4 = 31) Then Gotoxy(45,31);
If (X4 = 45) And (Y4 = 31) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X >= 45) And (Y = 19) Then X:=X+1;
If (X = 75) And (Y = 19) Then Gotoxy(75,19);
If (X = 75) And (Y = 19) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 <= 36) And (Y2 = 19) Then X2:=X2-1;
If (X2 = 6) And (Y2 = 19) Then Gotoxy(6,19);
If (X2 = 6) And (Y2 = 19) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 <= 36) And (Y3 = 31) Then X3:=X3-1;
If (X3 = 6) And (Y3 = 31) Then Gotoxy(6,31);
If (X3 = 6) And (Y3 = 31) Then Write(Chr(9));

Textcolor(lightred);
If (X4 >= 45) And (Y4 = 31) Then X4:=X4+1;
If (X4 = 75) And (Y4 = 31) Then Gotoxy(75,31);
If (X4 = 75) And (Y4 = 31) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X = 75) And (Y <= 19) Then Y:=Y-1;
If (X = 75) And (Y = 6) Then Gotoxy(75,6);
If (X = 75) And (Y = 6) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 6) And (Y2 <= 19) Then Y2:=Y2-1;
If (X2 = 6) And (Y2 = 6) Then Gotoxy(6,6);
If (X2 = 6) And (Y2 = 6) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 = 6) And (Y3 >= 31) Then Y3:=Y3+1;
If (X3 = 6) And (Y3 = 44) Then Gotoxy(6,44);
If (X3 = 6) And (Y3 = 44) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 75) And (Y4 >= 31) Then Y4:=Y4+1;
If (X4 = 75) And (Y4 = 44) Then Gotoxy(75,44);
If (X4 = 75) And (Y4 = 44) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X <= 75) And (Y = 6) And (X <> 45) Then X:=X-1;
If (X = 47) And (Y = 6) Then Gotoxy(47,6);
If (X = 47) And (Y = 6) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 >= 6) And (Y2 = 6) And (X2 <> 36) Then X2:=X2+1;
If (X2 = 34) And (Y2 = 6) Then Gotoxy(34,6);
If (X2 = 34) And (Y2 = 6) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 >= 6) And (Y3 = 44) And (X2 <> 36) Then X3:=X3+1;
If (X3 = 34) And (Y3 = 44) Then Gotoxy(34,44);
If (X3 = 34) And (Y3 = 44) Then Write(Chr(9));

Textcolor(lightred);
If (X4 <= 75) And (Y4 = 44) And (X <> 45) Then X4:=X4-1;
If (X4 = 47) And (Y4 = 44) Then Gotoxy(47,44);
If (X4 = 47) And (Y4 = 44) Then Write(Chr(9));

If (X = 47) And (Y = 6) Then C4;

Delay(Tard);
Until Keypressed;
End;
{ -------------------------  Cuadro #3  ------------------------- }

{ -------------------------  Cuadro #2  ------------------------- }
Procedure C2;
Begin
Repeat
S01;

Textcolor(Lightcyan);
If (X = 43) And (Y >= 2) Then Y:=Y+1;
If (X = 43) And (Y = 21) Then Gotoxy(43,21);
If (X = 43) And (Y = 21) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 38) And (Y2 >= 2) Then Y2:=Y2+1;
If (X2 = 38) And (Y2 = 21) Then Gotoxy(38,21);
If (X2 = 38) And (Y2 = 21) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 = 38) And (Y3 <= 48) Then Y3:=Y3-1;
If (X3 = 38) And (Y3 = 29) Then Gotoxy(38,29);
If (X3 = 38) And (Y3 = 29) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 43) And (Y4 <= 48) Then Y4:=Y4-1;
If (X4 = 43) And (Y4 = 29) Then Gotoxy(43,29);
If (X4 = 43) And (Y4 = 29) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X >= 43) And (Y = 21) Then X:=X+1;
If (X = 77) And (Y = 21) Then Gotoxy(77,21);
If (X = 77) And (Y = 21) Then Write(Chr(9));

Textcolor(LightBlue);
If (X2 <= 38) And (Y2 = 21) Then X2:=X2-1;
If (X2 = 4) And (Y2 = 21) Then Gotoxy(4,21);
If (X2 = 4) And (Y2 = 21) Then Write(Chr(9));

Textcolor(LightGreen);
If (X3 <= 38) And (Y3 = 29) Then X3:=X3-1;
If (X3 = 4) And (Y3 = 29) Then Gotoxy(4,29);
If (X3 = 4) And (Y3 = 29) Then Write(Chr(9));

Textcolor(LightRed);
If (X4 >= 43) And (Y4 = 29) Then X4:=X4+1;
If (X4 = 77) And (Y4 = 29) Then Gotoxy(77,29);
If (X4 = 77) And (Y4 = 29) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X = 77) And (Y <= 21) Then Y:=Y-1;
If (X = 77) And (Y = 4) Then Gotoxy(77,4);
If (X = 77) And (Y = 4) Then Write(Chr(9));

Textcolor(LightBlue);
If (X2 = 4) And (Y2 <= 21) Then Y2:=Y2-1;
If (X2 = 4) And (Y2 = 4) Then Gotoxy(4,4);
If (X2 = 4) And (Y2 = 4) Then Write(Chr(9));

Textcolor(LightGreen);
If (X3 = 4) And (Y3 >= 29) Then Y3:=Y3+1;
If (X3 = 4) And (Y3 = 46) Then Gotoxy(4,46);
If (X3 = 4) And (Y3 = 46) Then Write(Chr(9));

Textcolor(LightRed);
If (X4 = 77) And (Y4 >= 29) Then Y4:=Y4+1;
If (X4 = 77) And (Y4 = 46) Then Gotoxy(77,46);
If (X4 = 77) And (Y4 = 46) Then Write(Chr(9));

Textcolor(LightCyan);
If (X <= 77) And (Y = 4) And (X <> 43) Then X:=X-1;
If (X = 45) And (Y = 4) And (X <> 43) Then Gotoxy(45,4);
If (X = 45) And (Y = 4) And (X <> 43) Then Write(Chr(9));

Textcolor(LightBlue);
If (X2 >= 4) And (Y2 = 4) And (X2 <> 38) Then X2:=X2+1;
If (X2 = 36) And (Y2 = 4) And (X2 <> 38) Then Gotoxy(36,4);
If (X2 = 36) And (Y2 = 4) And (X2 <> 38) Then Write(Chr(9));

Textcolor(LightGreen);
If (X3 >= 4) And (Y3 = 46) And (X3 <> 38) Then X3:=X3+1;
If (X3 = 36) And (Y3 = 46) And (X3 <> 38) Then Gotoxy(36,46);
If (X3 = 36) And (Y3 = 46) And (X3 <> 38) Then Write(Chr(9));

Textcolor(LightRed);
If (X4 <= 77) And (Y4 = 46) And (X4 <> 43) Then X4:=X4-1;
If (X4 = 45) And (Y4 = 46) And (X4 <> 43) Then Gotoxy(45,46);
If (X4 = 45) And (Y4 = 46) And (X4 <> 43) Then Write(Chr(9));

If (X = 45) And (Y = 4) Then C3;

Delay(Tard);
Until Keypressed;
End;
{ -------------------------  Cuadro #2  ------------------------- }

{ -------------------------  Cuadro #1  ------------------------- }
Procedure C1;
Begin
TextMode(Lo(LastMode)+Font8x8);
TextBackground(0);
ClrScr;
X:=41; Y:=2; X2:=40; Y3:=48;
Repeat
S01;

Textcolor(Lightcyan);
If (X = 41) And (Y >= 2) Then Y:=Y+1;
If (X = 41) And (Y = 23) Then Gotoxy(41,23);
If (X = 41) And (Y = 23) Then Write(Chr(9));

Textcolor(Lightblue);
If (X2 = 40) And (Y2 >= 2) Then Y2:=Y2+1;
If (X2 = 40) And (Y2 = 23) Then Gotoxy(40,23);
If (X2 = 40) And (Y2 = 23) Then Write(Chr(9));

Textcolor(Lightgreen);
If (X3 = 40) And (Y3 <= 48) Then Y3:=Y3-1;
If (X3 = 40) And (Y3 = 27) Then Gotoxy(40,27);
If (X3 = 40) And (Y3 = 27) Then Write(Chr(9));

Textcolor(Lightred);
If (X4 = 41) And (Y4 <= 48) Then Y4:=Y4-1;
If (X4 = 41) And (Y4 = 27) Then Gotoxy(41,27);
If (X4 = 41) And (Y4 = 27) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X >= 41) And (Y = 23) Then X:=X+1;
If (X = 79) And (Y = 23) Then Gotoxy(79,23);
If (X = 79) And (Y = 23) Then Write(Chr(9));

Textcolor(Lightblue);
If (X2 <= 40) And (Y2 = 23) Then X2:=X2-1;
If (X2 = 2) And (Y2 = 23) Then Gotoxy(2,23);
If (X2 = 2) And (Y2 = 23) Then Write(Chr(9));

Textcolor(Lightgreen);
If (X3 <= 40) And (Y3 = 27) Then X3:=X3-1;
If (X3 = 2) And (Y3 = 27) Then Gotoxy(2,27);
If (X3 = 2) And (Y3 = 27) Then Write(Chr(9));

Textcolor(Lightred);
If (X4 >= 41) And (Y4 = 27) Then X4:=X4+1;
If (X4 = 79) And (Y4 = 27) Then Gotoxy(79,27);
If (X4 = 79) And (Y4 = 27) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X = 79) And (Y <= 23) Then Y:=Y-1;
If (X = 79) And (Y = 2) Then Gotoxy(79,2);
If (X = 79) And (Y = 2) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 = 2) And (Y2 <= 23) Then Y2:=Y2-1;
If (X2 = 2) And (Y2 = 2) Then Gotoxy(2,2);
If (X2 = 2) And (Y2 = 2) Then Write(Chr(9));

Textcolor(lightgreen);
If (X3 = 2) And (Y3 >= 27) Then Y3:=Y3+1;
If (X3 = 2) And (Y3 = 48) Then Gotoxy(2,48);
If (X3 = 2) And (Y3 = 48) Then Write(Chr(9));

Textcolor(lightred);
If (X4 = 79) And (Y4 >= 27) Then Y4:=Y4+1;
If (X4 = 79) And (Y4 = 48) Then Gotoxy(79,48);
If (X4 = 79) And (Y4 = 48) Then Write(Chr(9));

Textcolor(Lightcyan);
If (X <= 79) And (Y = 2) Then X:=X-1;
If (X = 43) And (Y = 2) Then Gotoxy(43,2);
If (X = 43) And (Y = 2) Then Write(Chr(9));

Textcolor(lightblue);
If (X2 >= 2) And (Y2 = 2) Then X2:=X2+1;
If (X2 = 38) And (Y2 = 2) Then Gotoxy(38,2);
If (X2 = 38) And (Y2 = 2) Then Write(Chr(9));

Textcolor(lightGreen);
If (X3 >= 2) And (Y3 = 48) Then X3:=X3+1;
If (X3 = 38) And (Y3 = 48) Then Gotoxy(38,48);
If (X3 = 38) And (Y3 = 48) Then Write(Chr(9));

Textcolor(lightred);
If (X4 <= 79) And (Y4 = 48) Then X4:=X4-1;
If (X4 = 43) And (Y4 = 48) Then Gotoxy(43,48);
If (X4 = 43) And (Y4 = 48) Then Write(Chr(9));

If (X = 43) And (Y = 2) Then C2;

Delay(Tard);
Until Keypressed;
End;
{ -------------------------  Cuadro #1  ------------------------- }

{* -------------------- *}     BEGIN     {* -------------------- *}
C1;
{* -------------------- *}      END.    {* --------------------- *}
{ -------------------------  Rivas  ------------------------- }