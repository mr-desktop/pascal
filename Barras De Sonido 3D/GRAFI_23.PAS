program Uso_de_Barras_en_3D;
uses crt,graph;
const
   tamano=20;
var
    vector        : array[1..tamano] of integer;
    i,j,tempo,Z,x,y : integer;
    Gd,Gm         : Integer;
begin
   GD := Detect;
   InitGraph(GD, GM, 'c:\tp\bgi');
   if GraphResult <> grOk then Halt(1);
   repeat
      Z:=abs(Random(10))+1;
      randomize;
      cleardevice;
      setcolor(Z);
      settextstyle(4,0,3);
      outtextxy(0,0,'Barras De Sonido');
      setcolor(Z+1);
      outtextxy(50,20,'En 3D');
      x:=10;{Valor inicial de las columnas en el plano cartesiano          }
      y:=getmaxy-10;{Valor inicial de las filas en el plano cartesiano     }
      {En el siguiente ciclo se llenan con valores aleatorios entre 0 y 10 }
      {las posiciones del vector                                           }
      for i:=1 to tamano do vector[i]:=random(tamano);
      for i:=1 to tamano do
         {Se hace un recorrido desde 1 hasta el tama¤o del vector          }
         begin {Inicio del ciclo for i                                     }
            tempo:=vector[i];{El valor de la posici¢n es almacendado en la }
                             {variable tempo                               }
            setcolor(i);{Se fija un color para cada columna de valores     }
            setfillstyle(1,i);{Se fija el estilo y relleno del vector      }
            for j:=1 to tempo do{se hace un ciclo desde 1 hasta el valor   }
                                {almacenado en la variable tempo           }
               begin {Inicio del ciclo for j                               }
                 bar3d(x,y-j*10,x+15,y-((j*10)+4),10,TopOn);
                 {Pintamos la barra en las  posiciones x1, y1, x2, y2, con }
                 {10 pixels de profundidad, y la opci¢n de tapa superior   }
                 {habilitada. Para que notes los cambios puedes variar del }
                 {valor de la profundidad y el de la tapa de TopOn a TopOff}
                 delay(5);{Se hace una espera de 5 milisegundos            }
               end; {Final del ciclo for j                                 }
            x:=x+20;{Se incrementa el valor de las columnas                }
      end;
      Delay(5000);
   until keypressed;
   CloseGraph;
   End.