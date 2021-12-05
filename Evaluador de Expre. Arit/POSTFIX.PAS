         program pol(input,output);
         uses Crt, Graph; {$R-}
         type
           reg1 =
             Record
               tok: char;
               sub: integer;
             End;
           reg2 =
             Record
               ide: string;
               vlr: real;
             End;
           charset = set of char;
         var letra, dig, oper: charset;
             tds: array[1..80] of reg2;
            exp1: array[1..80] of reg1;
            exp2: array[1..80] of reg1;
           stack: array[1..80] of reg1;
                    polish,infix: string[80];
                next, temp, last: reg1;
                     right_paren: boolean;
             ip,lo,p,r,long,prox: integer;
             err,m,a,b,i,j,top,e: integer;
                           valor: real;
                             pri: text;
                   SavedExitproc: pointer;
         label 1,2,3;
         function f(s:char): integer;
           begin
            Textbackground(Blue);
             case s of
               '+','-': f:=1;
               '*','/': f:=3;
                   '^': f:=6;
               '%','ª': f:=8;
                   '(': f:=11;
                   ')': f:=0
               else     f:=9
             end
           end;
         function g(s:char): integer;
           begin
             case s of
               '+','-': g:=2;
               '*','/': g:=4;
                   '^': g:=5;
               '%','ª': g:=7;
                   '(': g:=0;
                else    g:=10
             end
           end;
         function h(s,t:char): integer;
           begin
             case s of
               '+','-': case t of
                          '+','-': h:=0;
                          '*','/': h:=0;
                              '^': h:=0;
                          '%','ª': h:=1;
                              '(': h:=1;
                              ')': h:=0;
                           else    h:=1
                         end;
                '*','/': case t of
                          '+','-': h:=0;
                          '*','/': h:=0;
                              '^': h:=0;
                          '%','ª': h:=1;
                              '(': h:=1;
                              ')': h:=0
                           else    h:=1
                         end;
                    '^': case t of
                          '+','-': h:=0;
                          '*','/': h:=0;
                              '^': h:=0;
                          '%','ª': h:=1;
                              '(': h:=1;
                              ')': h:=0
                           else    h:=1
                          end;
                '%','ª': case t of
                          '+','-': h:=0;
                          '*','/': h:=0;
                              '^': h:=0;
                          '%','ª': h:=1;
                              '(': h:=1;
                              ')': h:=0
                           else    h:=1
                          end;
                    '(': case t of
                          '+','-': h:=0;
                          '*','/': h:=0;
                              '^': h:=0;
                          '%','ª': h:=1;
                              '(': h:=1;
                              ')': h:=0
                           else    h:=1
                          end;
                    ')': case t of
                          '+','-': h:=1;
                          '*','/': h:=1;
                              '^': h:=1;
                          '%','ª': h:=0;
                              '(': h:=0;
                              ')': h:=1
                           else    h:=0
                          end;
                   else case t of
                          '+','-': h:=1;
                          '*','/': h:=1;
                              '^': h:=1;
                          '%','ª': h:=0;
                              '(': h:=0;
                              ')': h:=1
                           else    h:=0
                          end;
             end
         end;
         {F+} procedure CustomExit; {F-}
         begin
            exitproc:=SavedExitProc;
            e:=-1;
            err:=exitCode;
            errorAddr:=NIL;
            exitCode:=0
         end;
         function nextchar:char;
           begin
             i:=i+1;
             nextchar:=exp1[i].tok;
             prox:=exp1[i].sub
           end;
         function leer(x,y,z,w: integer): string;
            var         tira: string;
                           c: char;
                           s: set of char;
                        cont: integer;
            label 1,2;
            begin
                if w=0 then s:=dig + ['.','-','+']
                else  if w=1 then s:=letra
                else if w=2 then s:= letra + dig + oper + ['.'] + ['$']
                else s:=dig;
           1:   tira:=''; cont:=0;
                gotoXY(x,y);
           2:   if keypressed then c:=readkey else goto 2;
                if c<>char(13) then
                   begin
                     if ((whereX-x=z) and (c<>char(08))) then
                             begin
                                sound(400);
                                delay(1000);
                                nosound;
                                goto 2
                             end;
                     if (c=char(08)) then
                             if (whereX>x) then
                                    begin
                                      cont:=cont-1;
                                      gotoXY(whereX-1,y);
                                      write(' ');
                                      tira:=copy(tira,1,length(tira)-1);
                                      gotoXY(whereX-1,y);
                                      goto 2;
                                    end
                              else  begin
                                      sound(400);
                                      delay(1000);
                                      nosound;
                                      goto 2
                                    end;
                     cont:=cont+1;
                     if not(c in s) then
                                   begin
                                     cont:=cont-1;
                                     sound(440);
                                     delay(1000);
                                     nosound;
                                     goto 2
                                   end;
                     write(c:1);
                     tira:=tira+c;
                     goto 2
                   end;
                 leer:=tira
            end;
         procedure pause(a:integer);
           var w: string;
           begin
             writeln(' ');
             if a<>2 then
                  begin
                  Textcolor(Yellow);
                    writeln('            Pulse "1" para reiniciar   '); Writeln;
                    Textcolor(White);
                    write('                Pulse "2" para terminar  '); Writeln;
                    if (a=0) then
                        begin
                        Textcolor(Yellow);
                          writeln('');
                          write('                   Enter para evaluar   ');
                        end;
                    w:=leer(whereX,whereY,1,3);
                    writeln('');
                    if (w='') and (a=0) then
                                 begin
                                    j:=0;
                                    m:=0
                                 end
                    else val(w,j,m);
                  end
             else j:=3;
           end;
         procedure lexical;
          var i,j,k,l: integer;
               nombre: string[80];
            point,num: real;
          label 1;
            procedure iden;
              var nombre: string;
                  cont,l: integer;
              const  lid=20;
              label 1;
              begin
                nombre:=''; cont:=0;
                exp1[k].tok:='i';
                1:  if cont=lid then i:=i+1
                    else begin
                            nombre:=nombre+infix[i];
                            i:=i+1; cont:=cont+1
                         end;
                    if ((infix[i] in letra) or (infix[i] in dig)) then goto 1;
                    l:=1;
                    while l<j do
                       begin
                         if nombre=tds[l].ide then
                            begin
                               if nombre[1]='$' then exp1[k].tok:='%';
                               exp1[k].sub:=l;
                               k:=k+1;
                               exit
                            end
                         else l:=l+1;
                       end;
                    if nombre[1]='$' then
                               begin
                                  writeln('');
                                  writeln('          Funci¢n Inv lida  ');
                                  writeln('');
                                  pause(2);
                               end;
                    tds[j].ide:=nombre;
                    exp1[k].sub:=j;
                    j:=j+1;
                    k:=k+1
              end;
              procedure numc;
              var      num: string;
                  cont,u,l: integer;
              const   lnum=14;
              label 1;
              begin
                num:=''; point:=0; cont:=0;
                1:  if cont=lnum then i:=i+1
                    else  begin
                             num:=num+infix[i];
                             i:=i+1
                          end;
                    if (infix[i]='.') and (point=0) then
                               begin
                                   point:=1;
                                   goto 1
                               end;
                    if (infix[i] in dig) then goto 1;
                    val(num,tds[j].vlr,u);
                    exp1[k].tok:='c';
                    exp1[k].sub:=j;
                    k:=k+1;
                    j:=j+1
              end;
          begin
            i:=1;
            j:=11;
            k:=1;
            l:=1;
            e:=2;
            while infix[i]<>'#' do
              begin
                1:  if infix[i]=' ' then begin i:=i+1; goto 1 end;
                    if (infix[i] in letra) or (infix[i]='$') then iden
                    else if (infix[i] in dig) then numc
                    else if (infix[i] in oper) then
                                                begin
                                                  exp1[k].tok:=infix[i];
                                                  i:=i+1;
                                                  k:=k+1
                                                end
                    else begin e:=3; exit end;

              end;
            long:=k-1;
            a:=k-2; b:=j
          end;
         function eval(a,b: integer): real;
         var pila: array[1..80] of real;
          y,i,j,k: integer;
                v: string;
         begin
            for i:=11 to b do
              begin
                 v:='';
                 k:=1;
                 y:=WhereY;
                 if tds[i].ide<>'' then
                    while (v='') or (k<>0) do
                          begin
                             gotoXY(1,y);
                             write(' ':75);
                             gotoXY(1,y);
                             write('          Dame    ',tds[i].ide:30,'   ');
                             v:=leer(whereX,whereY,14,0);
                             writeln('');
                             val(v,tds[i].vlr,k);
                             if (v='') or (k<>0) then y:= WhereY-1;
                          end;
              end;
            i:=0; j:=1;
            while i<=a do
                  begin
                     i:=i+1;
                     if (exp2[i].tok='i') or (exp2[i].tok='c') then
                                begin
                                   pila[j]:=tds[exp2[i].sub].vlr;
                                   j:=j+1;
                                end
                     else
                        case exp2[i].tok of
                             '+': begin
                                    pila[j-2]:=pila[j-2]+pila[j-1];
                                    j:=j-1
                                  end;
                             '-': begin
                                    pila[j-2]:=pila[j-2]-pila[j-1];
                                    j:=j-1
                                  end;
                             '*': begin
                                    pila[j-2]:=pila[j-2]*pila[j-1];
                                    j:=j-1
                                  end;
                             '/': begin
                                    if pila[j-1]=0 then e:=-1
                                    else  pila[j-2]:=pila[j-2]/pila[j-1];
                                    j:=j-1
                                  end;
                             '^': begin
                                    if (pila[j-2]<0) then e:=-1
                                    else if pila[j-1]=0 then pila[j-2]:=1
                                    else pila[j-2]:=exp(pila[j-1]*ln(pila[j-2]));
                                    j:=j-1
                                  end;
                             '%': case exp2[i].sub of
                                    1: pila[j-1]:=abs(pila[j-1]);
                                    2: pila[j-1]:=arctan(pila[j-1]);
                                    3: pila[j-1]:=cos(pila[j-1]);
                                    4: pila[j-1]:=exp(pila[j-1]);
                                    5: pila[j-1]:=frac(pila[j-1]);
                                    6: pila[j-1]:=int(pila[j-1]);
                                    7: If pila[j-1]>=0 then pila[j-1]:=ln(pila[j-1])
                                       else e:=-1;
                                    8: pila[j-1]:=sin(pila[j-1]);
                                    9: pila[j-1]:=sqr(pila[j-1]);
                                   10: If pila[j-1]>=0 then pila[j-1]:=sqrt(pila[j-1])
                                       else e:=-1;
                                       else i:=i;
                                  end;
                             'ª': pila[j-1]:=-pila[j-1];
                             else i:=i;
                        end;
                  end;
            eval:=pila[1]
         end;
         begin
         Assign(pri,'PRN');
         ReWrite(pri);
         Textbackground(blue);
         tds[1].ide:='$abs';
         tds[2].ide:='$arctan';
         tds[4].ide:='$exp';
         tds[5].ide:='$frac';
         tds[6].ide:='$int';
         tds[7].ide:='$ln';
         tds[8].ide:='$sin';
         tds[9].ide:='$sqr';
         tds[10].ide:='$sqrt';
         letra:=['a'..'z','A'..'Z','¤','¥'];
         dig:=['0'..'9'];
         oper:=['+','-','*','/','^','%','ª','(',')'];
   1:    for i:=1 to 80 do
             begin
                 exp1[i].tok:=' ';
                 exp1[i].sub:=0;
                 exp2[i].tok:=' ';
                 exp2[i].sub:=0;
             end;
          for i:=11 to 80 do
              begin
                 tds[i].ide:='';
                 tds[i].vlr:=0.0
             end;
            clrScr;
            i:=0;
            top:=1;
            p:=1;
            writeln(' ');
            Textcolor(White);
            writeln('          Introduzca Una Expresion Aritm‚tica ');
            writeln(' ');
            writeln(' ');
            write('          ');
            infix:=leer(whereX,whereY,65,2);
            writeln('');
            infix:=infix+')#';
            lexical;
            if e=3 then
                  begin
                    writeln('');
                    writeln('           Error Explorador ');
                    writeln('')
                  end;
            pause(e);
            if j=2 then exit;
            if j=1 then goto 1;
            next.tok:='(';
            stack[top].tok:='(';
            polish:='';
            while (i<long) do
              begin
                if top=0 then begin
                                writeln('          Expresi¢n Invalida 1');
                                e:=1;
                                goto 2
                              end;
                last:= next;
                next.tok:= nextchar;
                next.sub:=prox;
                if h(last.tok,next.tok)=0  then
                      begin
                         writeln('          Par Inv lido: ', last.tok, next.tok);
                         e:=1;
                         goto 2
                      end;
                right_paren:= false;
                while (f(next.tok)<=g(stack[top].tok)) and (not right_paren) do
                  begin
                    temp:=stack[top];
                    top:=top-1;
                    Writeln(pri,'  '); Write(pri,'         ');
                    For ip:=1 to top do
                            Write(pri,stack[ip].tok);
                    if f(next.tok)<g(temp.tok) then
                                             begin
                                               polish[p]:= temp.tok;
                                               exp2[p]:=temp;
                                               polish[0]:=chr(p);
                                               p:=p+1
                                             end
                    else right_paren:=true;
                  end;
                if not right_paren then begin
                                          top:=top+1;
                                          stack[top]:=next;
                                          Writeln(pri,'  '); Write(pri,'         ');
                                          For ip:=1 to top do
                                            Write(pri,stack[ip].tok);
                                        end
              end;
              if top=0 then begin
                               writeln(' ');
                               write('          Expresi¢n Polaca:   ');
                               write(polish);
                               writeln(' ');
                               writeln(' ');
                               e:=0;
                               goto 2
                            end;
              writeln('          Expresi¢n Invalida 2: ', top, '  ',polish);
              e:=1;
              goto 2;

        2:    pause(e);
              while (j=0) and (m=0) do
              begin
                clrscr;
                writeln('');
                writeln('          Expresi¢n Aritm‚tica:  ');
                writeln('');
                writeln(''); write('          ');
                for i:=1 to length(infix)-2 do
                write(infix[i]:1);
                writeln(''); writeln('');
                SavedExitProc:=exitproc;
                exitproc:=@CustomExit;
                err:=0;
                valor:=eval(a,b);
                exitproc:=SavedExitProc;
                if e=-1 then
                         begin
                            clrScr;
                            writeln('');
                            writeln('            Error de C lculo     C¢digo  ',err:3);
                            writeln(''); writeln('');
                            e:=1;
                            pause(e);
                            goto 3
                         end;
                writeln('  ');
                writeln('          Evaluaci¢n: ',  valor:10:2);
                pause(0);
              end;
           3:   if j=1 then goto 1;
                TextColor(white);
                write('Okey');
                Close(pri);
                exit
         end.
