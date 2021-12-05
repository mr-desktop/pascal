
(* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออป   *)
(* บ                                                        บÛ  *)
(* บ     Borland Pascal Units.                              บÛ  *)
(* บ     MCGAMode Interface Unit.                           บÛ  *)
(* บ                                                        บÛ  *)
(* วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถÛ  *)
(* บ                                                        บÛ  *)
(* บ     Copyright (C) 1995,1996                            บÛ  *)
(* บ                                                        บÛ  *)
(* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออผÛ  *)
(*  ฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿  *)

Unit MCGAMode;
{$G+,X+,I-,O+,D+,L+,S-}

Interface

Procedure NewScreen( Var P: Pointer );
Procedure DoneScreen( Var P: Pointer );
Procedure WriteScreen( P: Pointer );

Procedure Flip( Var Source, Dest );
Function  GetScreen: Pointer;

Function  GetPixel( x,y: Integer ): Byte;
Procedure PutPixel( x,y: Integer; Color: Byte );
Procedure ClearScr( Color: Byte );
Procedure Bar( X, Y, DX, DY: Integer; Color: Byte );

Procedure PutImg( X,Y,SizeX, SizeY: Word; Var Image );

Implementation

Var
  CurScr: Word;

Procedure NewScreen( Var P: Pointer );
Begin
  GetMem( P, 320*200 );
End;

Procedure DoneScreen( Var P: Pointer );
Begin
  FreeMem( P, 320*200 );
End;

Procedure WriteScreen( P: Pointer );
Begin
  CurScr:= Seg( P^ );
End;

Procedure Flip( Var Source, Dest ); Assembler;
Asm
   PUSH DS
   LES  DI,     Dest
   LDS  SI,     Source
   MOV  CX,     320*200/4
   DB   $66
   REP  MOVSW
   POP  DS
End;

Function GetScreen: Pointer; Assembler;
Asm
  MOV   DX,     SegA000
  XOR   AX,     AX
End;

Procedure PutPixel( x,y: Integer; Color: Byte ); Assembler;
Asm
   MOV  DI,     Y
   SHL  DI,     6
   DB   $67,$8D,$3C,$BF          {LEA di,[edi+edi*4]}
   ADD  DI,     X
   MOV  ES,    CurScr
   MOV  AL,    Color
   MOV  ES:[DI],AL
End;

Function GetPixel( x,y: Integer): Byte; Assembler;
Asm
   MOV  DI,     Y
   SHL  DI,     6
   DB   $67,$8D,$3C,$BF          {LEA di,[edi+edi*4]}
   ADD  DI,     X
   MOV  ES,    CurScr
   MOV  AL,    ES:[DI]
End;

Procedure ClearScr( Color: Byte ); Assembler;
Asm
        MOV   AL,     Color
        MOV   AH,     AL
        MOV   DX,     AX
        DB    $66
        SHL   AX,     16
        MOV   AX,     DX

        XOR   DI,     DI
        MOV   ES,     CurScr
        MOV   CX,     320*200/4
        DB    $66
        REP   STOSW
End;

Procedure Bar( X, Y, DX, DY: Integer; Color: Byte ); Assembler;
Asm
   MOV   ES,     CurScr
   MOV   AL,     Color
   XOR   DI,     DI

   MOV   DI,     Y
   MOV   BX,     DI
   SHL   DI,     6
   SHL   BX,     8
   ADD   DI,     BX
   ADD   DI,     X

   MOV   DX,     &DX    { & Means the varibale no the register }
   MOV   BX,     &DY

@WriteIt:
   MOV   CX,     DX
   REP   STOSB
   ADD   DI,     320
   SUB   DI,     DX
   DEC   BX
   JNZ   @WriteIt
End;

Procedure PutImg( X, Y, SizeX, SizeY: Word; Var Image ); Assembler;
Asm
        PUSH    DS
        MOV     DX,     320
        MOV     BX,     16
        SUB     DX,     BX
        MOV     ES,     SegA000
        MOV     DI,     Y
        MOV     AX,     DI
        SHL     DI,     8
        SHL     AX,     6
        ADD     DI,     AX
        MOV     AX,     X
        ADD     DI,     AX
        LDS     SI,     Image
        MOV     AX,     SizeY
@LOOP:
	MOV     CX,     SizeX
        REP     MOVSB
        ADD     DI,     DX
        DEC	AX
        JE      @END
        JMP     @LOOP
@END:   POP DS
End;

Begin
  CurScr:= SegA000;
End.
