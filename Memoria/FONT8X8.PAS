
(* ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»   *)
(* º                                                        ºÛ  *)
(* º     Borland Pascal Units.                              ºÛ  *)
(* º     Font8x8 Interface Unit                             ºÛ  *)
(* º                                                        ºÛ  *)
(* ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶Û  *)
(* º                                                        ºÛ  *)
(* º     Copyright (C) 1995,1996 Diego Iastrubni            ºÛ  *)
(* º                                                        ºÛ  *)
(* ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼Û  *)
(*  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß  *)

Unit Font8x8;

Interface

{$G+,X+,O+,D+,L+,S-}

Type
  Characters  = Char;
  PFont       = ^TFont;
  TLetter     = array[1..8] of Byte;
  TFont       = array[Characters] of TLetter;

{ ÄÄ Graphics Output ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure WriteLetter( x,y: Word; c: Char );
Procedure WriteStr( x,y: Word; Text: String );
Procedure ReadStr( x,y: Word; Var Str; L: Byte );

Procedure WriteLetter2( x,y: Word; c: Char );
Procedure WriteStr2( x,y: Word; Text: String );

Procedure SetBiosFont( Var Font: TFont );
Procedure LoadFont( Name: String; Var Temp: TFont );

Var
  FontMap: array[0..7,0..7] of Byte;

Const
  Font : PFont = nil;
  Color: Byte = 7;
  Back : Byte = 0;

Implementation

Uses Utils;


{ ÄÄ Graphics Output ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure WriteLetter( x,y: Word; c: Char );
Var
  xx,yy: Byte;
Begin
  For yy:=0 to 7 do
    For xx:=0 to 7 do
      If GetBit(Font^[c,yy+1],xx)
        Then PutPixel( x+(7-xx) , y+yy, Color )
        Else PutPixel( x+(7-xx) , y+yy, Back )
End;
{
Var
  d,n: Byte;
Begin
  For d:=1 to 8 do
    For n:=0 to 7 do
      If GetBit(Font^[c,d],n)
        Then PutPixel( x+(8-n) , y+d, Color)
        Else PutPixel( x+(8-n) , y+d, Back )
End;
 }
Procedure WriteStr( x,y: Word; Text: String );
Var
  n,d: Byte;
  c: Char;
Begin
  d:=0;
  For n:= 1 to Length( Text ) do
    Begin
      c:= Text[n];
      WriteLetter( x+d, y, c );
      Inc(d,8)
    End;
End;

Procedure ReadStr( x,y: Word; Var Str; L: Byte );
Var
  Count: Byte;
  Temp: Char;
  S: String;
  ShouldWrite: Boolean;
  UserStr: String absolute Str;
Begin
  Count:=1;
  ShouldWrite:=True;
  S:=UserStr;
  If Length(s)>L Then s[0]:=Chr(l);
  WriteStr( x,y, S );
  Line( (Length(S))*8+x+4, y+2, (Length(s))*8+x+4, y+7 , Color);
  Repeat
    Temp:= Ascii;
    Case Temp of
      #32..#127: If S[0]<>Char(L)
             Then S:=S+Temp
             Else ShouldWrite:=False;
      #08: Begin
             Line( (Length(s))*8+x+4, y+2, (Length(s))*8+x+4, y+7 , Back);
             If S[0]<>#0 Then
               Begin
                 Dec( S[0] );
                 WriteLetter( (Length(s))*8+x, y,' ');
               End;
             ShouldWrite:=False;
           end;
      Else ShouldWrite:=False;
    End;
    If ShouldWrite Then WriteLetter( (Length(s)-1)*8+x, y, Temp);
    ShouldWrite:=True;
    If S[0]<>Char(L) Then
      Line( (Length(s))*8+x+4, y+2, (Length(s))*8+x+4, y+7 , Color );
  Until Temp in [#27, #13];
  If Temp<>#27 Then UserStr:=s;
  WriteLetter( (Length(s))*8+x, y, ' ');
End;

Procedure WriteLetter2( x,y: Word; c: Char );
Var
  xx,yy: Byte;
Begin
  For yy:=0 to 7 do
    For xx:=0 to 7 do
      If GetBit(Font^[c,yy+1],xx)
        Then PutPixel( x+(7-xx) , y+yy, FontMap[yy,xx] )
{        Else PutPixel( x+(7-xx) , y+yy, Back )}
End;

Procedure WriteStr2( x,y: Word; Text: String );
Var
  n,d: Byte;
  c: Char;
Begin
  d:=0;
  For n:= 1 to Length(Text) do
    Begin
      WriteLetter2( x+d, y, Text[n] );
      Inc(d,8)
    End;
End;


Procedure SetBiosFont( Var Font: TFont );
Var
  P: Pointer;
Begin
  GetIntVec( $43, P );
  Move( P^, Font ,SizeOf(TFont) );
End;

Procedure LoadFont( Name: String; Var Temp: TFont );
Var
  F: File;
Begin
{$I-}
  Assign( F,Name );
  Reset( F, SizeOf(TFont) );
  BlockRead( F, Temp, 1 );
  Close( F );
End;

End.
