Program MEMOTEST;

Uses Utils, Font8x8, Mouses, MCGAMode;


Const
  PicX          = 16;
  PicY          = 16;
  MaxPic        = 35;
  MaxNameLen    = 20;
  MaxPlayers    =  5;

  SpaceBetweenX = 4;
  SpaceBetweenY = 2;
  MulX          = PicX+SpaceBetweenX;
  MulY          = PicY+SpaceBetweenY;

  Back_Picture_Number  = 32;
  Clear_Picture_Number = 33;
  Font_Pic_Number      = 34;

  TableX    = 30;
  TableY    = 30;
  PlayerX   = 30;
  PlayerY   = 10;

  StsX      = 230; { Player statistics }
  StsY      = 030;

  BackColor  = 23;
  TextColor  = 10;
  WaitTime   = 3000;
  WinnerTime = 5000;
  DefaultWinnerTime = 100;


  FontFile     = 'BIOSFONT.FNT';
  PicturesFile = 'MEMOTEST.PIC';

Type
  Sounds  = (WinSound, LooseSound, TurnCardSound);
  Picture = array[0..PicY-1, 0..PicX-1] of Byte;

  TPlayer = Record
    Name  : String[MaxNameLen]; { The name of the player   }
    Count : Byte;               { How musch did he turned? }
    Turned: Set of Byte;        { Which ones               }
  End;

  TPlayers = array[0..MaxPlayers-1] of TPlayer;

Var
  Map    : Array[0..7,0..7] of Byte;
  Pics   : Array[0..MaxPic-1] of Picture;
  DefFont: TFont;

{$S-}
Procedure StartSound( f: LongInt );
Begin
  If f = 0 Then Exit;
  Port[$43]:= 182;
  Port[$42]:= Lo( 1193180 div f );
  Port[$42]:= Hi( 1193180 div f );
  Port[$61]:= Port[$61] or 3; { setbit... }
End;

Procedure StopSound;
Begin
  Port[$61]:= Port[$61] and 252 { setbit... }
End;

Procedure WaitForKey( Time: Word );
Var
  i: Word;
Begin
  If Time<>0 Then
  For i:= 0 to Time-1 do
    If (Port[$60]<$80) or (GetButton<>0)
      Then Break
      Else Wait( 1 );
End;

Procedure BublesSort(var Players: TPlayers );
Var
  b: integer;
  i: integer;
  Sorted: Boolean;
  tmp : TPlayer;
begin
  b:= MaxPlayers - 1;
  Repeat
    Sorted:= True;
    For i:= 0 to b-1 do
      If Players[i].Count < Players[i+1].count Then
        Begin
          Sorted:= False;
          tmp:= Players[i];
          Players[i]  := Players[i+1];
          Players[i+1]:= tmp;
        End;
     Dec( b );
  Until Sorted;
end;

Procedure MakeSound( hz, msec: word );
Begin
  StartSound( hz );
  Wait( msec );
  StopSound;
End;

Procedure Play_Sound( Wich: Sounds );
Var
  i: Word;
Begin
  Case Wich of
    WinSound: For i:= 0 to 300 do MakeSound( i*10+i, 2 );
    LooseSound: Begin
                  For i:= 1 to 25 do
                    Begin MakeSound(   i*i, 3 ); MakeSound( $FFFF div  i, 5 ); End;
                  For i:= 1 to 10 do
                    Begin MakeSound( 27*27, 3 ); MakeSound( $FFFF div 27, 5 ); End;
                  For i:= 20 DownTo 1 do
                    Begin MakeSound(   i*i, 6 ); MakeSound( $FFFF div  i, 8 ); End;
                End;
    TurnCardSound: For i:= 0 to 10 do MakeSound( 10*i*i + i*2 + 10 , 3 );
  End;
End;
{$S+}

Procedure ExitProgram( Str: String );
Begin
  WriteLn( #9, 'Error in program. Must quit.' );
  WriteLn;
  WriteLn( #9, Str );
  WriteLn;
  Halt( 1 );
End;

Procedure LoadFiles;
Var
  f: File;
Begin
  LoadFont( FontFile, DefFont );
  If IOResult<>0 Then ExitProgram( 'Font file not found' );

{$I-}
  Assign( F, PicturesFile );
  Reset( f, 1 );
  If IOResult<>0 Then ExitProgram( 'Pictures file not found' );
  BlockRead( F, Pics, 2 );
  BlockRead( F, Pics, SizeOf(Pics) );
  Close( F );
End;


Procedure InitScreen;
Var
  x ,y : Byte;
Begin
  ClearScr( BackColor );

  For y:= 0 to 7 do
    For x:= 0 to 7 do
      FontMap[y,x]:= Pics[Font_Pic_Number][y,x];
  WriteStr2( 235, 180, 'MEMOTEST' );
  SetCursor( NormalCursor );

  Frame3D( TableX-1, TableY-1,
	   TableX+MulX*8-SpaceBetweenX, TableY+MulY*8-SpaceBetweenY, True );

  Frame3D( TableX-2, TableY-2,
	   TableX+MulX*8-SpaceBetweenX+1, TableY+MulY*8-SpaceBetweenY+1, True );
End;

Procedure Init;
Var
  Button: Byte;
Begin
  InitMouse( Button );
  Randomize;

  Utils.PutPixel:= MCGAMode.PutPixel;
  Utils.GetPixel:= MCGAMode.GetPixel;

  Font:= @DefFont;
  SetMCGA;
End;

{$S-}
Procedure FindAviable( Var ax, ay: Byte );
Begin
  Repeat
    ax:= (Random(8)*2) shr 1;
    ay:= (Random(8)*2) shr 1;
  Until Map[ay,ax]=$FF;
End;
{$S+}

Procedure MixThem;
Var
  n, x, y: Byte;
Begin
  FillChar( Map, SizeOf(Map), $FF );
  For n:= 0 to 31 do
    Begin
      FindAviable( x, y );
      Map[y,x]:= n;
      FindAviable( x, y );
      Map[y,x]:= n;
    End;
End;

Procedure DrawMap;
Var
  x, y: Byte;
Begin
  HideMouse;
  For y:= 0 to 7 do
    For x:= 0 to 7 do
      If Map[y,x]<>Clear_Picture_Number
	Then PutImg( TableX+x*MulX, TableY+y*MulY,
		   PicX, PicY, Pics[ Map[y,x]] )
	Else Bar  ( TableX+x*MulX, TableY+y*MulY,
		   PicX, PicY, BackColor);
  ShowMouse;
End;

Procedure DrawBack;
Var
  x, y: Byte;
Begin
  HideMouse;
  For y:= 0 to 7 do
    For x:= 0 to 7 do
      If Map[y,x]<>Clear_Picture_Number
	Then PutImg( TableX+x*MulX, TableY+y*MulY,
		   PicX, PicY, Pics[Back_Picture_Number] )
	Else Bar  ( TableX+x*MulX, TableY+y*MulY,
		   PicX, PicY, BackColor);
  ShowMouse;
End;

Procedure Done;
Begin
  HideMouse;
  WaitRetrace;
  ClearScr( 0 );
  SetText;
End;

Procedure ReadPlayerNumber( Var ANumber: Byte; Var ThePlayers: TPlayers );
Var
  C: Char;
  i: Integer;
  n: Byte;
Begin
  Back := BackColor;
  Color:= TextColor;

  ClearScr( BackColor );
  WriteStr( 50, 50, 'How many players? (1-'+Char($30+MaxPlayers)+')' );
  Repeat C:= Ascii; Until c in ['1'..Char($30+MaxPlayers)];
  n:= Byte(C) - Byte('0');

  ANumber:= n;
  FillChar( ThePlayers, SizeOf(ThePlayers), 0 );
  ClearScr( BackColor );
  For i:= 0 to ANumber-1 do
    Begin
      WriteStr( 50, 10+i*10, 'Player '+Char($31+i) );
      ReadStr( 130, 10+i*10, ThePlayers[i].Name, MaxNameLen );
    End;

  ClearScr( BackColor );
End;

Function Read2Cards( Var APlayer: TPlayer ): Boolean;
Var
  mx, my    : Word;
  Button    : Byte;
  CardMarked: Boolean;
  cx1, cy1, cx2, cy2  : Byte;
  Card1, Card2        : Byte;
Begin
  SetCursor( MarkCursor );

  Read2Cards:= False;
  Repeat
    mx:= GetMouseX shr 1;
    my:= GetMouseY;
    cx1:= (mx - TableX) div MulX;
    cy1:= (my - TableY) div MulY;
    If (GetButton=mbLeftButton) and
       (mx>TableX) and (mx<TableX+MulX*8) and
       (my>TableY) and (my<TableY+MulY*8) and
       (Map[cy1,cx1]<>Clear_Picture_Number)
       Then CardMarked:= True
       Else CardMarked:= False;
  Until CardMarked or (Key[1]);

  If (Key[1]) Then Exit;
  HideMouse;
  PutImg( TableX+cx1*MulX, TableY+cy1*MulY,
	  PicX, PicY, Pics[ Map[cy1,cx1] ]);
  ShowMouse;
  Play_Sound( TurnCardSound );

  While GetButton<>0 do;
  Repeat
    mx:= GetMouseX shr 1;
    my:= GetMouseY;
    cx2:= (mx - TableX) div MulX;
    cy2:= (my - TableY) div MulY;
    If (GetButton=mbLeftButton) and
       (mx>TableX) and (mx<TableX+MulX*8) and
       (my>TableY) and (my<TableY+MulY*8) and
       ((cx2<>cx1) or (cy2<>cy1)) and
       (Map[cy2,cx2]<>Clear_Picture_Number)
       Then CardMarked:= True
       Else CardMarked:= False;
  Until CardMarked or (Key[1]);
  HideMouse;
  PutImg( TableX+cx2*MulX, TableY+cy2*MulY,
	  PicX, PicY, Pics[ Map[cy2,cx2] ]);
  SetCursor( NormalCursor );
  ShowMouse;

  If Map[cy1,cx1] = Map[cy2,cx2]
    Then Begin
           Play_Sound( WinSound );
           Map[cy1,cx1]:= Clear_Picture_Number;
           Map[cy2,cx2]:= Clear_Picture_Number;
           Inc( APlayer.Count );
           Read2Cards:= True;
         End
    Else If Random(10) = Random(12)
             Then Play_Sound( LooseSound )
             Else Play_Sound( TurnCardSound );
End;

Procedure PrintStatics( Var APlayer: TPlayer; HowMuchTurns: Byte );
Var
  R : Real;
  S : String[3];
  S1: String[10];
Begin
  Box( PlayerX, PlayerY, PlayerX+8*MaxNameLen, PlayerY+8, BackColor );
  WriteStr2( PlayerX, PlayerY, APlayer.Name );

  Str( HowMuchTurns :3, S );
  Str( APlayer.Count:3, S1 );
  WriteStr( StsX    , StsY, S1 );
  WriteStr( StsX+8*3, StsY, S  );

  If HowMuchTurns<>1
    Then R:= APlayer.Count/(HowMuchTurns)
    Else R:= 1;

  Str( R*100:6:2, S1 );
  WriteStr( StsX, StsY+10, S1+'%' );
End;

Procedure ShowWinner( Var ThePlayers: TPlayers; PlayerNum: Byte );
var
  Pal1,Pal2 : TPalette;
  Count,I   : Byte;
  Temp,Inc  : Real;
Begin
  For Count:= 0 to 7 do
    For i:= 0 to 7 do
      FontMap[Count,i]:= Pics[Font_Pic_Number][Count,i];
  HideMouse;
  GetAllPals(Pal1);
  Pal2:= Pal1;

  For Count := 100 to 163 Do Begin
    Pal2[count,2]:= 0;
    Pal2[count,1]:= 0;
    Pal2[count,0]:= count-100;
  End;
  For Count := 164 to 164+64 Do Begin
    Pal2[count,2]:= 0;
    Pal2[count,1]:= 0;
    Pal2[count,0]:= 163-Count;
  End;

  ClearScr( 0 );
  SetAllPals(Pal2);

  Inc:= 63/200;
  Temp:= 100;
  For Count := 0 to 199 do Begin
    Bar(0,199-Count,320,1,Round(Temp));
    Temp:= Temp+Inc;
  End;

  BublesSort( ThePlayers );

  WriteStr2( 50, 100, 'Winner is ' );
  WriteStr2( 150,100, ThePlayers[0].Name );

  SetCursor( NormalCursor );
  ShowMouse;
  Play_Sound( LooseSound );

  Repeat
    CyclePal( 100, 164+63, False );
    WaitRetrace;
  Until (GetButton<>0) or KeyDown;

  HideMouse;
  ClearScr( 0 );
  SetAllPals(Pal1);
  ShowMouse;
End;


Var
  Match        : Boolean;
  PlayerNum    : Byte;
  CurrentPlayer: Byte;
  Players      : TPlayers;
  Turns        : Byte;


Function GameOver: Boolean;
Var
  Total: Byte;
  i    : Byte;
Begin
  Total:= 0;
  For i:= 0 to PlayerNum-1 do
    Total:= Total + Players[i].Count;
  GameOver:= Total=32
End;

Begin
  LoadFiles;
  Init;
  ReadPlayerNumber( PlayerNum, Players );
  MixThem;
  CurrentPlayer:= 0;
  Turns        := 0;

  InitScreen;
  ShowMouse;
  InitKeys;
  PrintStatics( Players[CurrentPlayer], (Turns div 2)+1 );
  Repeat
    DrawBack;
    If not Read2Cards( Players[CurrentPlayer] ) Then
      Begin
	SetCursor( WaitCursor );
	Inc( CurrentPlayer );
	If CurrentPlayer=PlayerNum Then CurrentPlayer:= 0;
      End;

    While GetButton<>0 do;
    WaitForKey( WaitTime );
    Inc( Turns );
    PrintStatics( Players[CurrentPlayer], (Turns div 2)+1 );
  Until (Key[1]) or GameOver;
  DoneKeys;

{  If GameOver Then}
    ShowWinner( Players, PlayerNum );

  Done;
End.
