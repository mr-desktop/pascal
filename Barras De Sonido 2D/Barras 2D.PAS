{Este programa traza una serie barras de manera similar como un gr fico
 estad¡stico del mismo nombre, para ello recurre al uso de un vector de
 20 posiciones, las cuales se llenan con valores aleatorios entre 0 y 20
 despues se hace un ciclo desde 1 hasta el valor de la posici¢n y se
 traza el n£mero de barras correspondientes a dicha cifra.}

program Uso_de_Barras;
uses crt,graph;
const
   tamano=20;
var
  vector        : array[1..tamano] of integer;
  i,j,tempo,Z,x,y : Integer;
  Gd, Gm        : Integer;
begin
   GD := Detect;  {Se autodetecta el tipo de tarjeta o controlador gr fico  }
                  {para el monitor en el que se este ejecutando el programa }
   InitGraph(GD, GM, 'c:\tp\bgi'); {Inicializa el modo gr fico                       }
   if GraphResult <> grOk then Halt(1); {Evalua, si la inicializaci¢n no    }
                                        {fue correcta entonces termina      }
    repeat
      randomize;
      Z:=abs(Random(10))+1;
      x:=10; {Valor inicial de las columnas en el plano cartesiano           }
      y:=getmaxy-10; {Valor inicial de las filas en el plano cartesiano      }
      cleardevice; {Se limpia la pantalla                                    }
      setcolor(Z);
      settextstyle(4,0,3);
      outtextxy(0,0,'Barras De Sonido');
      setcolor(Z+1);
      outtextxy(40,20,'En 2D');

   {En el siguiente ciclo se llenan con valores aleatorios entre 0 y 10 }
   {las posiciones del vector                                           }
   for i:=1 to tamano do vector[i]:=random(tamano);
   for i:=1 to tamano do
   {Se hace un recorrido desde 1 hasta el tama¤o del vector             }
   begin {Inicio del ciclo for i                                        }
   tempo:=vector[i];{El valor de la posici¢n es almacendado en la       }
                            {la variable tempo                          }
   setcolor(i);     {Se fija un color para cada columna de valores      }
   setfillstyle(1,i);{Se fija el estilo y relleno del vector            }
   for j:=1 to tempo do{se hace un ciclo desde 1 hasta el valor         }
                              {almacenado en la variable tempo          }
   begin {Inicio del ciclo for j                                        }
   bar(x,y-j*10,x+15,y-((j*10)+4));{Dibuja una barra en las             }
   {posiciones x1,y1, x2, y2                                            }
   delay(5);{Se hace una espera de 5 milisegundos                       }
   end; {Final del ciclo for j                                          }
   x:=x+20;{Se incrementa el valor de las columnas                      }
   end;{Final del ciclo for i                                           }

   Delay(5000);
   until keypressed;
   CloseGraph;
end.

