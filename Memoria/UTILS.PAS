
(* ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»   *)
(* º                                                        ºÛ  *)
(* º     Borland Pascal Units.                              ºÛ  *)
(* º     Utils Interface Unit                               ºÛ  *)
(* º                                                        ºÛ  *)
(* ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶Û  *)
(* º                                                        ºÛ  *)
(* º     Copyright (C) 1995,1997 Diego Iastrubni            ºÛ  *)
(* º                                                        ºÛ  *)
(* ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼Û  *)
(*  ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß  *)

(* Thanks to :                                                  *)
(*                                                              *)
(*    Ariel Kesalman                                            *)
(*                                                              *)

(*  Ver 2.40                                                    *)
(*                                                              *)


Unit Utils;

{$G+,X+,I-,O+,D+,L+,S-}

Interface

{$IFNDEF VER70}
Const
  Seg0040: Word =  $0040;
  SegA000: Word =  $A000;
  SegB000: Word =  $B000;
  SegB800: Word =  $B800;
{$ENDIF}

{ ÄÄ Extended Scan codes ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Const
  kbEsc       = $011B;  kbAltSpace  = $0200;  kbCtrlIns   = $0400;
  kbShiftIns  = $0500;  kbCtrlDel   = $0600;  kbShiftDel  = $0700;
  kbBack      = $0E08;  kbCtrlBack  = $0E7F;  kbShiftTab  = $0F00;
  kbTab       = $0F09;  kbAltQ      = $1000;  kbAltW      = $1100;
  kbAltE      = $1200;  kbAltR      = $1300;  kbAltT      = $1400;
  kbAltY      = $1500;  kbAltU      = $1600;  kbAltI      = $1700;
  kbAltO      = $1800;  kbAltP      = $1900;  kbCtrlEnter = $1C0A;
  kbEnter     = $1C0D;  kbAltA      = $1E00;  kbAltS      = $1F00;
  kbAltD      = $2000;  kbAltF      = $2100;  kbAltG      = $2200;
  kbAltH      = $2300;  kbAltJ      = $2400;  kbAltK      = $2500;
  kbAltL      = $2600;  kbAltZ      = $2C00;  kbAltX      = $2D00;
  kbAltC      = $2E00;  kbAltV      = $2F00;  kbAltB      = $3000;
  kbAltN      = $3100;  kbAltM      = $3200;  kbF1        = $3B00;
  kbF2        = $3C00;  kbF3        = $3D00;  kbF4        = $3E00;
  kbF5        = $3F00;  kbF6        = $4000;  kbF7        = $4100;
  kbF8        = $4200;  kbF9        = $4300;  kbF10       = $4400;
  kbHome      = $4700;  kbUp        = $4800;  kbPgUp      = $4900;
  kbGrayMinus = $4A2D;  kbLeft      = $4B00;  kbRight     = $4D00;
  kbGrayPlus  = $4E2B;  kbEnd       = $4F00;  kbDown      = $5000;
  kbPgDn      = $5100;  kbIns       = $5200;  kbDel       = $5300;
  kbShiftF1   = $5400;  kbShiftF2   = $5500;  kbShiftF3   = $5600;
  kbShiftF4   = $5700;  kbShiftF5   = $5800;  kbShiftF6   = $5900;
  kbShiftF7   = $5A00;  kbShiftF8   = $5B00;  kbShiftF9   = $5C00;
  kbShiftF10  = $5D00;  kbCtrlF1    = $5E00;  kbCtrlF2    = $5F00;
  kbCtrlF3    = $6000;  kbCtrlF4    = $6100;  kbCtrlF5    = $6200;
  kbCtrlF6    = $6300;  kbCtrlF7    = $6400;  kbCtrlF8    = $6500;
  kbCtrlF9    = $6600;  kbCtrlF10   = $6700;  kbAltF1     = $6800;
  kbAltF2     = $6900;  kbAltF3     = $6A00;  kbAltF4     = $6B00;
  kbAltF5     = $6C00;  kbAltF6     = $6D00;  kbAltF7     = $6E00;
  kbAltF8     = $6F00;  kbAltF9     = $7000;  kbAltF10    = $7100;
  kbCtrlPrtSc = $7200;  kbCtrlLeft  = $7300;  kbCtrlRight = $7400;
  kbCtrlEnd   = $7500;  kbCtrlPgDn  = $7600;  kbCtrlHome  = $7700;
  kbAlt1      = $7800;  kbAlt2      = $7900;  kbAlt3      = $7A00;
  kbAlt4      = $7B00;  kbAlt5      = $7C00;  kbAlt6      = $7D00;
  kbAlt7      = $7E00;  kbAlt8      = $7F00;  kbAlt9      = $8000;
  kbAlt0      = $8100;  kbAltMinus  = $8200;  kbAltEqual  = $8300;
  kbCtrlPgUp  = $8400;  kbAltBack   = $0800;  kbNoKey     = $0000;

{ ÄÄ Mouse buttons ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
  mbLeftButton  = $01;
  mbRightButton = $02;
  mbMiddle      = $04;

{ ÄÄ Color constants ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Const
  Black         = 00;  Blue          = 01;  Green         = 02;
  Cyan          = 03;  Red           = 04;  Magenta       = 05;
  Brown         = 06;  LightGray     = 07;  DarkGray      = 08;
  LightBlue     = 09;  LightGreen    = 10;  LightCyan     = 11;
  LightRed      = 12;  LightMagenta  = 13;  Yellow        = 14;
  White         = 15;

  Blink         = 128;

{ ÄÄ Shift State ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
  kbLeftShift   = 1 shl 0;
  kbRightShift  = 1 shl 1;
  kbCtrl        = 1 shl 2;
  kbAlt         = 1 shl 3;
  kbScrollLock  = 1 shl 4;
  kbNumLock     = 1 shl 5;
  kbCapsLock    = 1 shl 6;
  kbInsState    = 1 shl 7;


{ ÄÄ My Boolean ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
   { Internal joke... }
Const
  Maybe = True xor False;

Type
  MyBoolean =  TRUE..MAYBE;

{ ÄÄ Types used ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Type
  PPalette    = ^TPalette;
  PCel        = ^TCelRec;

  VectorTable    = array[0..255] of Pointer;
  TLetter        = array[1..8] of Byte;
  TColor         = array[0..2] of byte;
  TPalette       = array[0..255] of TColor;
  TPutPixel      = Procedure( x,y: Integer; Color: Byte );
  TGetPixel      = Function( x,y: Integer ): Byte;
  Cursor_Type    = Record
    ScreenMask, CursorMask: Array[1..16] of word;
    x,y: Word
  End;

{ Used for typecasting }
  TCelRec = Record
    SizeY, SizeX: Word;
    Image       : array[0..320*200] of Byte;
  End;

  TKBCode = Record
    Case Word of
      1: (Ascii: Char;
          ScanCode: Byte );
      2: (KeyCode: Word);
  End;


Procedure Wait( MS : Word);
Procedure Change( Var x,y : Word );
Function  FileExist( FileName : String ) : Boolean;
Function  MemAlloc( Size: Word ): Pointer;

{ ÄÄ Bit Setting ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure SetBit( Var B; N: Byte; TurnOn: Boolean );
Function  GetBit( B: Word; N: Byte ): Boolean;

{ÄÄ Interrupts ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure GetIntVec(IntNo: Byte; var Vector: Pointer);
Procedure SetIntVec(IntNo: Byte; Vector: Pointer);

{ ÄÄ Keybord input ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure InitKeys;
Procedure DoneKeys;
Procedure ClearBuffer;
Function  KeyDown : Boolean;

{ ÄÄ Screen output ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure FillScreen( Chr : Char; Color : Byte );
Procedure GCLS( Color : Byte );

Procedure TextCursor( StartScan, StopScan: Byte );
Procedure CursorXY ( x,y: Byte );
Function  CursorX: Byte;
Function  CursorY: Byte;

Procedure WriteXY( x,y : Word; Txt : Char);
Procedure ColorXY( x,y,Color : Word);
Procedure CharXY( x,y : Word; Txt : Char; Color :Byte );

Function  BGetPixel(x,y:Integer): Byte;
Function  MGetPixel(x,y:Integer): Byte;
Procedure BPutPixel(x,y:Integer; c:byte);
Procedure MPutPixel(x,y:Integer; c:byte);


{ ÄÄ Graphics ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure WaitRetrace;
Procedure WaitVRetrace;

Procedure Pal(Col,R,G,B : Byte);
Procedure GetPal(Col : Byte; Var R,G,B : Byte);

Procedure GetAllPals( Var Palette );
Procedure SetAllPals( Var Palette );
Procedure FadeUpon( Var Pal: TPalette; c1,c2: Byte );
Procedure Fade( Var Pal: TPalette; c1,c2,delay: Byte );
Procedure Step_Fade( Var Pal: TPalette; c1,c2,Delay: Byte );
Procedure FillPal( Var Pall : TPalette; R,G,B : Word);
Procedure CyclePal( StartPal, EndPal: byte; GoUp: Boolean);

Procedure LoadPal( PalName : String );
Procedure SavePal( PalName : String );

Procedure Line( x1,y1,x2,y2 : Word; Color : Byte );
Procedure Circle( x1,y1,rad : Word; Color : Byte );
Procedure Box( x1,y1,x2,y2 : Word; Color : Byte );
Procedure Frame3d( x1,y1,x2,y2: Word; FrameUp: Boolean );
Procedure Box3D( x1,y1,x2,y2: Word; FrameUp: Boolean );

{ ÄÄ Images ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure LoadCel( CelName : String; Var Image : Pointer );
Procedure PutImage( x,y : Word; Image : Pointer );
Procedure GetImage( x1, y1, x2, y2: Integer; Var Image: Pointer );
Procedure FreeCel( Var Image : Pointer );

{ ÄÄ Mouse input ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Function InitMouse( Var ButtonCount: Byte ): Boolean;
Procedure MouseXY( x,y: Word );
Procedure MouseWindow( x1, y1, x2, y2: Word);
Procedure SetSpeed( x,y : Word );
Procedure SetCursor( Var Cursor );

Function  MouseX : Word;
Function  MouseY : Word;
Function  MouseButton( Which : Word ) : Boolean;

{ ÄÄ Inline declerations ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }

(*ÄÄ Text colors ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ *)
Procedure BlinkColor( On : Boolean );
InLine( $5B/                      { POP   BX                       }
        $B8/$03/$10/              { MOV   AX,1013                  }
        $CD/$10);                 { INT   10                       }

(*ÄÄ Keybord input ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ *)
Function Ascii : Char;
InLine( $B8/$00/$00/              { MOV   AX,$0000                 }
        $CD/$16 );                { INT   16                       }
Function ScanCode : Byte;
InLine( $B8/$00/$00/              { MOV   AX,$0000                 }
        $CD/$16/                  { INT   16                       }
        $86/$C4 );                { XCHG  AL,AH                    }
Function GetKBCode: Word;
InLine( $B8/$00/$00/              { MOV   AX,$0000                 }
        $CD/$16 );                { INT   16                       }

(*ÄÄ Screen modes ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ *)
Procedure SetMCGA;
InLine( $B8/$13/$00/              { MOV   AX,0013h                 }
        $CD/$10);                 { INT   10h                      }
Procedure SetText;
InLine( $B8/$03/$00/              { MOV   AX,0003h                 }
        $CD/$10);                 { INT   10h                      }
Procedure SetVGA;
InLine( $B8/$12/$00/              { MOV   AX,0012h                 }
        $CD/$10);                 { INT   10h                      }
Procedure SetMode( n:Byte );
InLine( $58/                      {  POP AX                        }
        $CD/$10);                 {  INT 10H                       }

(*ÄÄ Mouse ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ *)
Procedure ShowMouse;
Inline( $B8/$01/$00/              { MOV   AX,0001h                 }
        $CD/$33);                 { INT   33h                      }
Procedure HideMouse;
Inline( $B8/$02/$00/              { MOV   AX,0002h                 }
        $CD/$33);                 { INT   33h                      }
Function GetButton:Word;
InLine( $B8/$03/$00/              { MOV   AX,0003h                 }
        $CD/$33/                  { INT   33h                      }
        $89/$D8);                 { MOV   AX,BX     ; result in BX }
Function GetMouseX:Word;
InLine( $B8/$03/$00/              { MOV   AX,0003h                 }
        $CD/$33/                  { INT   33                       }
        $89/$C8);                 { MOV   AX,CX     ; result in CX }
Function GetMouseY:Word;
InLine( $B8/$03/$00/              { MOV   AX,0003h                 }
        $CD/$33/                  { INT   33                       }
        $89/$D0);                 { MOV   AX,DX     ; result in DX }

(*ÄÄ Misc ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ *)

Procedure STI; InLine( $FB );
Procedure CLI; InLine( $FA );

{$IFNDEF DPMI}
Procedure Boot;
Inline( $EA/$00/$00/$FF/$FF );    { JMP   FFFF:0000                }
{$ENDIF}

{ ÄÄ Unit variables ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Var
{$IFNDEF DPMI}
  IntVectors    : VectorTable absolute 0:0;
{$ENDIF}
  Key           : array [0..$80-1] of Boolean;
  BaseMemory    : Word    absolute $40:$13;
  ShiftState    : Byte    absolute $40:$17;
  ScreenMode    : Byte    absolute $40:$49;
  VideoPage     : Byte    absolute $40:$62;
  Timer         : LongInt absolute $40:$6C;
  OldInt09      : Procedure;


Const
  PutPixel: TPutPixel = BPutPixel;
  GetPixel: TGetPixel = BGetPixel;

  Light   : Byte = 27;
  Shadow  : Byte = 20;
  Internal: Byte = 23;

Implementation

Procedure NewInt09; Interrupt;
Begin
  (* Clear Ctrl-Break and Pause *)
  MemW[Seg0040:$17]:= 0;
  InLine($9C);                                  (*  PUSHF  *)
  OldInt09;
  Port[$20]:= $20;
  Key[Port[$60] mod $80]:= Port[$60]<$80;
  ClearBuffer;
End;


Procedure Wait(Ms : Word); Assembler;
Asm
  Mov Ax, 1000
  Mul Ms
  Mov Cx, Dx
  Mov Dx, Ax
  Mov Ah, 86h
  Int 15h
End;

Procedure Change( Var x,y : Word );
Var
  Temp: Word;
Begin
  Temp:= x;
  x:= y;
  y:= Temp;
End;

Function  FileExist( FileName : String ) : Boolean;
Var F:File;
Begin
  Assign( F, FileName);
  Reset( F );
  Close( F );
  FileExist := (IOResult=0);
End;

Function MemAlloc( Size: Word ): Pointer;
Var
  P: Pointer;
Begin
  If MaxAvail >= Size
    Then GetMem( P, Size )
    Else P:= nil;
  MemAlloc:= P;
End;

{ ÄÄ Bit Setting ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure SetBit( Var B; N: Byte; TurnOn: Boolean ); Assembler;
Asm
        LES     DI,     B
        MOV     AX,     1
        MOV     CL,     N
        SHL     AX,     CL
        CMP     TurnOn, TRUE
        JE      @SetOn
        JMP     @SetOff
@SetOn: OR      ES:[DI],AX
        JMP     @End
@SetOff:NOT     AX
        AND     ES:[DI],AX
        JMP     @End
@End:
End;

Function  GetBit( B: Word; N: Byte ): Boolean; assembler;
Asm
        MOV     AX,     B
        MOV     BX,     1
        MOV     CL,     N
        SHL     BX,     CL
        AND     AX,     BX
        JZ      @END
        MOV     AX,     TRUE
@END:
End;

Procedure GetIntVec(IntNo: Byte; var Vector: Pointer); Assembler;
Asm
   MOV	AL,IntNo
   MOV	AH,35H
   INT	21H
   MOV	AX,ES
   LES	DI,Vector
   CLD
   XCHG	AX,BX
   STOSW
   XCHG	AX,BX
   STOSW
End;

Procedure SetIntVec(IntNo: Byte; Vector: Pointer); Assembler;
Asm
   PUSH	DS
   LDS	DX,Vector
   MOV	AL,IntNo
   MOV	AH,25H
   INT	21H
   POP	DS
End;

{ ÄÄ Keybord input ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure InitKeys;
Begin
  FillChar( Key, SizeOf(Key), 0 );
  GetIntVec( 09, @OldInt09 );
  SetIntVec( 09, @NewInt09 );
End;

Procedure DoneKeys;
Begin
  SetIntVec( 09, @OldInt09 );
End;

Procedure ClearBuffer; Assembler;
Asm
  MOV ES     , Seg0040
  MOV DI     , $1C
  MOV AL     , ES:[DI]

  MOV DI     , $1A
  MOV ES:[DI], AL                    (*  Mem[$40:$1A]:=Mem[$40:$1C]; *)
End;

Function  KeyDown:Boolean;Assembler;
Asm
  MOV   AH,1
  INT	16H
  MOV	AL,0
  JZ    @IsNot

@IsTrue : MOV   AL,True
          JMP   @The_End
@IsNot  : MOV   AL,False
@The_End:
End;

{ ÄÄ Screen output ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Function CursorX: Byte; Assembler;
Asm
        MOV     AH,     3
        MOV     ES,     Seg0040
        MOV     BH,     ES:[VideoPage]
        INT     10H
        MOV     AL,     DL
End;

Function CursorY: Byte; Assembler;
Asm
        MOV     AH,     3
        MOV     ES,     Seg0040
        MOV     BH,     ES:[VideoPage]
        INT     10H
        MOV     AL,     DH
End;

Procedure TextCursor( StartScan, StopScan: Byte ); Assembler;
Asm
	MOV	CH,	StartScan
	MOV	CL,	StopScan
	MOV	AH,	1
	INT	10H
End;

Procedure CursorXY( x,y: Byte ); Assembler;
Asm
   MOV  AH,     2
   MOV  ES,     Seg0040
   MOV  BH,     ES:[VideoPage]
   MOV  DH,     Y
   MOV  DL,     X
   INT  10h
End;

Procedure WriteXY( x,y : Word; Txt : Char);Assembler;
Asm
  MOV ES,segB800
  MOV AX,y
  MOV bx,AX
  SHL AX,7         { y*2^7       = 126*y                   }
  SHL bx,5         { y*2^5       =  32*y                   }
  ADD AX,BX        { y*(2^7+2^5) = y*(126+32) = 160*y      }
  MOV DI,AX
  MOV AX,x
  SHL AX,1         { AX = 2*x                              }
  ADD DI,AX        { DI = 160*y + 2*x                      }
  MOV AL,Txt
  		   { mem[SegB800:160*y+2*x]:=Txt           }
  STOSB            { mem[ES:DI]:=AL                        }
End;

Procedure ColorXY( x,y,Color : Word);Assembler;
Asm
  MOV ES,segB800
  MOV AX,y
  MOV bx,AX
  SHL AX,7         { y*2^7       = 126*y                   }
  SHL bx,5         { y*2^5       =  32*y                   }
  ADD AX,bx        { y*(2^7+2^5) = y*(126+32) = 160*y      }
  MOV DI,AX
  MOV AX,x
  SHL AX,1         { AX = 2*x                              }
  ADD DI,AX        { DI = 160*y + 2*x                      }
  INC DI           { DI = 160*y + 2*x + 1                  }
  MOV AX,Color
  		   { mem[SegB800:160*y+2*x+1]:=Color       }
  STOSB            { mem[ES:DI]:=AL                        }
End;

Procedure CharXY( x,y : Word; Txt : Char; Color :Byte );Assembler;
Asm
  MOV ES,segB800
  MOV AX,y
  MOV bx,AX
  SHL AX,7         { y*2^7       = 126*y                   }
  SHL bx,5         { y*2^5       =  32*y                   }
  ADD AX,bx        { y*(2^7+2^5) = y*(126+32) = 160*y      }
  MOV DI,AX
  MOV AX,x
  SHL AX,1         { AX = 2*x                              }
  ADD DI,AX        { DI = 160*y + 2*x                      }
  MOV AL,Txt
  MOV ah,Color
  		   { mem[SegB800:160*y+2*x  ]:=Txt         }
		   { mem[SegB800:160*y+2*x+1]:=Color       }
  STOSW            { mem[ES:DI]  :=AL                      }
		   { mem[ES:DI+1]:=ah                      }
End;

Function BGetPixel(x,y:Integer): Byte; Assembler;
Asm
  MOV     AH,0Dh
  MOV     CX,x
  MOV     DX,y
  MOV     BX,1
  INT     10h
End;

Function MGetPixel(x,y:Integer): Byte; Assembler;
Asm
  MOV     ES,SegA000
  MOV     BX, X
  MOV     DX, Y
  MOV     DI, BX
  MOV     BX, DX      { BX = DX}
  SHL     DX, 8
  SHL     BX, 6
  ADD     DX, BX      { DX = DX + bx (ie y*320)}
  ADD     DI, DX      { finalise location}
  MOV     AL, ES:[DI]
End;

Procedure BPutPixel(x,y:Integer; c:byte); Assembler;
Asm
  MOV     AH,0Ch
  MOV     AL,c
  MOV     CX,x
  MOV     DX,y
  MOV     BX,1
  INT     10h
End;

Procedure MPutPixel(x,y:Integer; c:byte); Assembler;
Asm
  MOV     ES,SegA000

  MOV     DI,Y
  XOR     DL,DL
  MOV     DH,BYTE(Y)
  SHL     DI,6
  ADD     DI,DX
  ADD     DI,X
  MOV     AL, C
  MOV     ES:[DI], AL
End;

Procedure FillScreen( Chr : Char; Color : Byte );Assembler;
Asm
  MOV   ES,     SegB800
  XOR   DI,     DI
  MOV   AL,     Chr
  MOV   AH,     Color
  MOV   CX,     80*25*2
  REP   STOSW
End;

Procedure GCLS( Color : Byte );Assembler;
Asm
  MOV   AL,     Color
  MOV   AH,     AL
  XOR   DI,     DI
  MOV   ES,     SegA000
  MOV   CX,     320*200
  REP   STOSW
End;

{ ÄÄ Graphics ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }

Procedure WaitRetrace; assembler;
asm
     MOV  DX,3DAh
@L1: IN   AL,DX
     TEST AL,08h
     JNZ  @L1
@L2: IN   AL,DX
     TEST AL,08h
     JZ   @L2
end;

Procedure WaitVRetrace; assembler;
asm
     MOV  DX,3DAh
@L1: IN   AL,DX
     TEST AL,08h
     JNZ  @L1
end;

Procedure Pal(Col,R,G,B : Byte); assembler;
asm
  MOV    DX,3c8h
  MOV    AL,[col]
  OUT    DX,AL
  INC    DX
  MOV    AL,[r]
  OUT    DX,AL
  MOV    AL,[g]
  OUT    DX,AL
  MOV    AL,[b]
  OUT    DX,AL
end;

Procedure GetPal(Col : Byte; Var R,G,B : Byte); Assembler;
Asm
  MOV    DX     , $3C7
  MOV    AL     , Col
  OUT    DX     , AL
  ADD    DX     , 2
  IN     AL     , DX
  LES    BX     , R
  MOV    ES:[BX], AL
  IN     AL     , DX
  LES    BX     , G
  MOV    ES:[BX], AL
  IN     AL     , DX
  LES    BX     , B
  MOV    ES:[BX], AL
End;

Procedure GetAllPals( Var Palette ); Assembler;
Asm
  MOV AL, $FF
  MOV DX, $C6
  OUT DX, AL
  MOV DX, $3C7
  MOV AL, 0
  OUT DX, AL
  MOV DX, $3C9

  LES DI, Palette
  MOV CX, 768
@B2:
  IN   AL, DX
  MOV  [ES:DI], AL
  INC  DI
  Loop @B2
End;

Procedure SetAllPals ( Var Palette ); Assembler;
Asm
   PUSH   DS
   LDS    SI, Palette
   MOV    DX, $3C8
   MOV    AL, 0
   OUT    DX, AL
   INC    DX
   MOV    CX, 768
   REP    OUTSB
   POP    DS
End;

Procedure FadeUpon( Var Pal: TPalette; c1,c2: Byte );
Var
  Tmp1,Tmp2,Tmp3 : Byte;
  Cp             : TPalette;
Begin
  GetAllPals(Cp);
  For Tmp2:=c1 to c2 Do
    For Tmp3:= 0 to 2 do
      If CP[Tmp2,Tmp3] > Pal[Tmp2,Tmp3] Then Dec( CP[Tmp2,Tmp3] ) Else
      If CP[Tmp2,Tmp3] < Pal[Tmp2,Tmp3] Then Inc( CP[Tmp2,Tmp3] );
{  WaitVRetrace;}
  SetAllPals( cp );
end;

Procedure Fade( Var Pal: TPalette; c1,c2,delay: Byte );
Var
  Tmp1,Tmp2,Tmp3 : Byte;
  Cp             : TPalette;
Begin
  GetAllPals(Cp);
  For Tmp1:= 0 to 63 Do
    Begin
      GetAllPals( cp );
      For Tmp2:= c1 to c2 Do Begin
        For Tmp3:= 0 to 2 do
          If CP[Tmp2,Tmp3] > Pal[Tmp2,Tmp3] Then Dec( CP[Tmp2,Tmp3] ) Else
          If CP[Tmp2,Tmp3] < Pal[Tmp2,Tmp3] Then Inc( CP[Tmp2,Tmp3] )
      End;
      FadeUpon( Pal, c1, c2 );
      Wait( Delay );
      WaitRetrace;
      SetAllPals( cp );
    End;
End;

Procedure Step_Fade( Var Pal: TPalette; c1,c2,delay: Byte );
Var
  Tmp1,Tmp2,Tmp3,DC : Byte;
  Cp,Tbl            : TPalette;
Begin
  GetAllPals(Cp);
  DC:= C2-C1;

  For Tmp1:=0 To 255 Do
    For Tmp2:=0 To 2 Do
      If Pal[Tmp1,Tmp2]-Cp[Tmp1,Tmp2]<>0
        Then Tbl[Tmp1,Tmp2]:= Round( Abs((DC/(Pal[Tmp1,Tmp2]-Cp[Tmp1,Tmp2]))) )
        Else Tbl[Tmp1,Tmp2]:= 0;

  For Tmp1:=1 to 63 Do
    Begin
      For Tmp2:=c1 to c2 Do
        For Tmp3:= 0 to 2 do Begin
          If (Tbl[Tmp2,Tmp3]<>0) and  (Tbl[Tmp2,Tmp3] mod Tmp1<>0) Then
            If CP[Tmp2,Tmp3] > Pal[Tmp2,Tmp3] Then Dec( CP[Tmp2,Tmp3] ) Else
            If CP[Tmp2,Tmp3] < Pal[Tmp2,Tmp3] Then Inc( CP[Tmp2,Tmp3] )
        End;
      Wait( Delay );
      WaitVRetrace;
      SetAllPals( cp );
    End;

  Wait( Delay );
  WaitVRetrace;
  SetAllPals( Pal );
End;

Procedure FillPal( Var Pall : TPalette; R,G,B : Word);
Var
  Count : Byte;
Begin
  For Count:=0 To 255 Do
    Begin
      Pall[Count,0]:=R;
      Pall[Count,1]:=G;
      Pall[Count,2]:=B;
    End;
End;

Procedure CyclePal( StartPal, EndPal : byte; GoUp: Boolean );
Var
  Cp     : TPalette;
  OnePal : TColor;
  X,Y    : Word;
Begin
  GetAllPals(Cp);
  If GoUp
    Then Begin
           OnePal:= CP[StartPal];
{           WaitVRetrace;}
           For X:= StartPal To EndPal-1 Do
             Pal(X,Cp[X+1,0],Cp[X+1,1],CP[X+1,2]);
           Pal(EndPal,OnePal[0],OnePal[1],OnePal[2]);
         End
    Else Begin
           OnePal:= CP[EndPal];
{           WaitVRetrace;}
           For X:= StartPal+1 To EndPal Do
             Pal(X,Cp[X-1,0],Cp[X-1,1],CP[X-1,2]);
           Pal(StartPal,OnePal[0],OnePal[1],OnePal[2]);
         End;
End;

Procedure SavePal( PalName : String );
Var
  Temp: TPalette;
  PalFile: File;
Begin
  Assign( PalFile,PalName);
  ReWrite( PalFile,SizeOf(TPalette) );
  GetAllPals( Temp );
  BlockWrite( PalFile, Temp, 1 );
  Close( PalFile );
End;

Procedure LoadPal( PalName : String );
Var
  Temp: TPalette;
  F: File;
Begin
  Assign( F, PalName );
  Reset( F, SizeOf(TPalette) );
  BlockRead( F, Temp,1 );
  Close( F );
  SetAllPals( Temp );
End;

Procedure Line( x1,y1,x2,y2 : Word; Color : Byte);
var i, deltax, deltay, numpixels,
    d, dinc1, dinc2,
    x, xinc1, xinc2,
    y, yinc1, yinc2 : integer;
begin

  { Calculate deltax and deltay for initialisation }
  deltax := x2 - x1;
  deltay := abs(y2 - y1);

  deltax:= abs(deltax);

  { Initialize all vars based on which is the independent variable }
  if deltax >= deltay then
    begin

      { x is independent variable }
      numpixels := deltax + 1;
      d := (2 * deltay) - deltax;
      dinc1 := deltay Shl 1;
      dinc2 := (deltay - deltax) shl 1;
      xinc1 := 1;
      xinc2 := 1;
      yinc1 := 0;
      yinc2 := 1;
    end
  else
    begin

      { y is independent variable }
      numpixels := deltay + 1;
      d := (2 * deltax) - deltay;
      dinc1 := deltax Shl 1;
      dinc2 := (deltax - deltay) shl 1;
      xinc1 := 0;
      xinc2 := 1;
      yinc1 := 1;
      yinc2 := 1;
    end;

  { Make sure x and y move in the right directions }
  if x1 > x2 then
    begin
      xinc1 := - xinc1;
      xinc2 := - xinc2;
    end;
  if y1 > y2 then
    begin
      yinc1 := - yinc1;
      yinc2 := - yinc2;
    end;

  { Start drawing at <x1, y1> }
  x := x1;
  y := y1;

  { Draw the pixels }
  for i := 1 to numpixels do
    begin
      PutPixel(x, y, color);
      if d < 0 then
        begin
          d := d + dinc1;
          x := x + xinc1;
          y := y + yinc1;
        end
      else
        begin
          d := d + dinc2;
          x := x + xinc2;
          y := y + yinc2;
        end;
    end;
end;

Procedure Circle( x1,y1,rad : Word; Color : Byte );
Const deg = Pi/180;

Var I, x, y: Integer;
    degs: Real;

Begin
  degs:= 0.0;
  For I:= 1 to 90 Do Begin
    degs:= degs + deg;
    x:= Round(rad*Cos(degs));
    y:= Round(rad*Sin(degs));
    Putpixel(x1+x, y1+y, Color);
    Putpixel(x1-x, y1+y, Color);
    Putpixel(x1+x, y1-y, Color);
    Putpixel(x1-x, y1-y, Color);
  End;
End;

Procedure Box( x1,y1,x2,y2 : Word; Color : Byte );
Var
  x,y : Word;
Begin
  CLI;
  If x2<x1 Then Change( x2,x1 );
  If y2<y1 Then Change( y2,y1 );
  For y:= y1 to y2 do
    For x:=x1 to x2 do
      PutPixel( x,y,Color );
  STI;
End;

Procedure Frame3d( x1,y1,x2,y2: Word; FrameUp: Boolean );
Var n: Word;
Begin
  For n:=x1 to x2 do
   If FrameUp
     Then Begin
            PutPixel( n, y1, Shadow );
            PutPixel( n, y2, Light );
          End
     Else Begin
            PutPixel( n, y1, Light );
            PutPixel( n, y2, Shadow );
          End;
  For n:=y1 To y2 Do
    If FrameUp
       Then Begin
              PutPixel( x1, n, Shadow );
              PutPixel( x2, n, Light )
            End
       Else Begin
              PutPixel( x1, n, Light );
              PutPixel( x2, n, Shadow );
            End;
End;

Procedure Box3D( x1,y1,x2,y2: Word; FrameUp: Boolean );
Begin
  Box( x1+1, y1+1, x2-1, y2-1, Internal );
  Frame3D( x1, y1, x2, y2, FrameUp );
End;

{ ÄÄ Images ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Procedure LoadCel( CelName : String; Var Image : Pointer );
Var
  CelFile  : File;
  Size_X,
  Size_Y   : Word;
Begin
  If Image <> nil Then FreeCel( Image );

  Assign(CelFile, CelName);
  Reset(CelFile, 1);
  Seek(CelFile, 4);
  BlockRead(CelFile, Size_Y, 2 );
  Size_X:= (FileSize(CelFile)-800) div Size_Y;
  Seek(CelFile, 800);
  Image:= MemAlloc(Size_Y*Size_X+4);
  If Image=nil Then Exit;

  PCel(Image)^.SizeX:= Size_X;
  PCel(Image)^.SizeY:= Size_Y;
  BlockRead(CelFile, PCel(Image)^.Image, Size_X*Size_Y);
  Close(CelFile);
End;

Procedure PutImage( x,y : Word; Image : Pointer );
Var
  xx, yy: Word;
  n     : Word;
Begin
  CLI;
  n:= 0;
  With PCel(Image)^ do
    For yy:= 0 to SizeY-1 do
      For xx:= 0 to SizeX-1 do
        Begin
          PutPixel( xx+x, yy+y, Image[{SizeX*yy+xx}n] );
          Inc( n );
        End;
  STI;
End;

Procedure GetImage( x1, y1, x2, y2: Integer; Var Image: Pointer );
Var
  x, y      : Integer;
  DX, DY, n : Word;
  Cel       : PCel;
Begin
  If Image<>nil Then FreeCel( Image );

  DX         := (x2-x1);
  DY         := (y2-y1);
  Image      := MemAlloc( DX*DY+4 );
  If Image = nil Then Exit;
  Cel        := Image;
  Cel^.SizeX := DX;
  Cel^.SizeY := DY;

  n:= 0;
  For y:= 0 to DY-1 do
    For x:= 0 to DX-1 do
      Begin
        Cel^.Image[{y*Cel^.SizeX+x}n]:= GetPixel( x1+x, y1+y );
        Inc( n );
      End;
End;


Procedure FreeCel( Var Image : Pointer );
Var
  Size : Word;
Begin
  With PCel(Image)^ do
    Size:= SizeX * SizeY + 4;
  FreeMem(Image, Size);
End;

{ ÄÄ Mouse input ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ }
Function InitMouse( Var ButtonCount: Byte ): Boolean; Assembler;
Asm
        PUSH    ES
        XOR     AX,     AX
        INT     33H
        LES     DI,     ButtonCount
        MOV     ES:[DI],BX
        POP     ES
End;

Procedure MouseXY( x,y: Word ); Assembler;
Asm
   MOV AX,      4
   MOV DX,      Y
   MOV CX,      X
   INT 33h
END;

Procedure MouseWindow( x1, y1, x2, y2:word) ; assembler;
asm
   MOV  AX,     7
   MOV  CX,     x1
   MOV  DX,     x2
   INT  33h
   MOV  AX,     8
   MOV  CX,     y1
   MOV  DX,     y2
   INT  33h
end;

Procedure SetSpeed( x,y : Word ); Assembler;
Asm
   MOV  AX,     1Ah
   MOV  BX,     X
   MOV  CX,     Y
   XOR  DX,     DX
   INT  33h
End;

Procedure SetCursor( Var Cursor ); Assembler;
Asm
    LES DI,     Cursor
    MOV BX,     ES:[DI].Cursor_Type.X
    MOV CX,     ES:[DI].Cursor_Type.Y
    MOV DX,     DI
    MOV AX,     9
    INT 33h
End;

Function  MouseX : Word;
Begin
  MouseX := GetMouseX shr 3;
End;

Function  MouseY : Word;
Begin
  MouseY := GetMouseY shr 3;
End;

Function  MouseButton( Which : Word ) : Boolean;
Begin
  MouseButton:= GetButton and Which <> 0;
End;

End.
