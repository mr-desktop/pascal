{ ********************************************************* }
  Program Spy;
  Uses Crt,Dos;
  Var Spaay :Text;
      WWWW, WWWW2 :longint;
      Haa, Maa ,Saa ,Caa :Word;
      Zaa :String;
      Aaao, Maas, Daaa, Daas :Word;
{ ********************************************************* }

  Procedure DiaS;
  Begin
  If Daas = 0 then Zaa:='" Domingo "';
  If Daas = 1 then Zaa:='" Lunes "';
  If Daas = 2 then Zaa:='" Martes "';
  If Daas = 3 then Zaa:='" Miercoles "';
  If Daas = 4 then Zaa:='" Jueves "';
  If Daas = 5 then Zaa:='" Viernes "';
  If Daas = 6 then Zaa:='" Sabado "';
  End;

  BEGIN
  clrscr;
  Gettime(Haa,Maa,Saa,Caa);
  GetDate(Aaao,Maas,Daaa,Daas);
  WWWW:=DiskFree(0);
  WWWW2:=DiskSize(0);
  DiaS;
  Assign(Spaay, 'Spy.TXT');
  Rewrite(Spaay);
  Append(Spaay);
  WriteLn(Spaay, 'Su Computadora Ya Esta Anlizada');
  WriteLn(Spaay, '');
  WriteLn(Spaay, 'Hora del Sistema: ',Haa,':',Maa);
  WriteLn(Spaay, 'Dia de Ejecutado: ',Zaa);
  Writeln(Spaay, 'Fecha del Sistema: ',Daaa,'\',Maas,'\',Aaao);
  WriteLn(Spaay, '');
  Writeln(Spaay, 'Espacio En el Disco Actual:');
  Writeln(Spaay, WWWW2,' Bytes');
  Writeln(Spaay, trunc(WWWW2/1000),' KiloBytes');
  Writeln(Spaay, trunc((WWWW2/1000)/1000),' MegaBytes');
  Writeln(Spaay, trunc(((WWWW2/1000)/1000)/1000),' GigaBytes');
  WriteLn(Spaay, '');
  Writeln(Spaay, 'Espacio Libre en el Disco Actual:');
  Writeln(Spaay, WWWW,' Bytes');
  Writeln(Spaay, trunc(WWWW/1000),' KiloBytes');
  Writeln(Spaay, trunc((WWWW/1000)/1000),' MegaBytes');
  Writeln(Spaay, trunc(((WWWW/1000)/1000)/1000),' GigaBytes');
  Close (Spaay);
  sound(100); Delay(50000); Delay(50000); Nosound;
  Delay(50000); sound(1000); Delay(5000); Nosound;
  Delay(5000);
  End.