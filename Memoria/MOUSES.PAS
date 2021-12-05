unit mouses;

interface

type
  Cursor_Type = record
    ScreenMask, CursorMask: array[1..16] of word;
    x,y: Word
  end;

const
   NormalCursor: Cursor_Type = (
     ScreenMask: ($7FFF,$3FFF,$1FFF,$0FFF,$07FF,$03FF,$01FF,$07FF,
		$07FF,$63FF,$F3FF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF);
     CursorMask: ($0000,$0000,$4000,$6000,$7000,$7800,$7800,$7000,
		$1000,$0800,$0000,$0000,$0000,$0000,$0000,$0000);
     X: 0;
     Y: 0
  );

   BigNormal: Cursor_Type = (
     ScreenMask: ($FFFF,$BFFF,$9FFF,$8FFF,$87FF,$83FF,$81FF,$80FF,
		$807F,$803F,$81FF,$B9FF,$F9FF,$F8FF,$FCFF,$FFFF);
     CursorMask: ($C000,$E000,$F000,$F800,$FC00,$FE00,$FF00,$FF80,
		$FFC0,$FFE0,$FFF0,$FF00,$EF00,$8380,$0780,$0380);
     X: 0;
     Y: 0
  );

   TestCursor: Cursor_Type = (
     ScreenMask: ($3FFF,$1FFF,$0FFF,$07FF,$03FF,$01FF,$00FF,$007F,
		$003F,$001F,$000F,$07FF,$0248,$76DD,$F6ED,$F64D);
     CursorMask: ($0000,$4000,$6000,$7000,$7800,$7C00,$7E00,$7F00,
		$7F80,$7FC0,$7000,$4000,$1DB7,$0922,$0912,$09B2);
     X: 0;
     Y: 0
  );

   WaitCursor: Cursor_Type = (
     ScreenMask: ($01FF,$01FF,$39FF,$01FF,$83FF,$83FF,$C7FF,$93FF,
		$93FF,$29FF,$01FF,$01FF,$01FF,$FFFF,$FFFF,$FFFF);
     CursorMask: ($0000,$7C00,$4400,$4400,$2800,$2800,$1000,$2800,
		$2800,$4400,$4400,$7C00,$0000,$0000,$0000,$0000);
     X: 4;
     Y: 4
  );

   MarkCursor: Cursor_Type = (
     ScreenMask: ($EFFF,$EFFF,$EFFF,$11FF,$EFFF,$EFFF,$EFFF,$FFFF,
		$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF);
     CursorMask: ($1000,$1000,$0000,$C600,$0000,$1000,$1000,$0000,
		$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000);
     X: 4;
     Y: 4
  );

procedure SetCursor( var Cursor ); 

implementation

procedure SetCursor( var Cursor ); assembler;
asm
   LES DI,     Cursor
   MOV AX,     9
   MOV BX,     ES:[DI].Cursor_Type.X
   MOV CX,     ES:[DI].Cursor_Type.Y
   MOV DX,     DI
   INT 33H
end;

end.

