{ Este programa pinta sectores de torta en diferente posici¢n de la pantalla,
  con un radio generado aleatoriamente entre 0 y 100 pixels,  ngulo inicial
  entre 0 y 360 grados,  ngulo final entre 0 y 360 grados, y de estilo y
  color de relleno tambien generado al azar.}

Program Ejemplo_de_Tortitas;
uses Crt, Graph;
var
Gd, Gm, Color : Integer;
begin
   GD := Detect;
   InitGraph(GD, GM, 'c:\tp\bgi');
   if GraphResult <> grOk then Halt(1);

   cleardevice;
   setcolor(WHITE);
   Randomize;{Se activa el generador de n£meros aleatorios                 }
   {En este ciclo se pintan trozos de torta(parece mas bien una pasteler¡a)}
   {en posiciones, tama¤os y colores aleatorios                            }
   repeat{Inicio del ciclo Repeat-Until, que funciona hasta que el usuario }
         {presione una tecla                                               }
      color:=random(getmaxcolor);{Se color se genera aleatoriamente entre  }
                     {0 y el n£mero m ximo soportado por la tarjeta gr fica}
      setcolor(color);{Se fija el color                                    }
      setfillstyle(random(12),color);{Se fija el estilo de relleno a solido con el  }
                            {color especificado                            }
      {A continuaci¢n se pintan los trozos de torta en las posiciones,     }
      { ngulos inicial y final, y el tama¤o de manera aleatoria            }
      PieSlice(random(getmaxX),Random(getmaxY),random(360),random(360), Random(100));
      Delay(10);{Hace una espera de 10 milisegundos                        }
   until KeyPressed;{Final del ciclo Repeat - Until                        }
   CloseGraph;{Cierra el modo gr fico                                      }
end. {Final del programa principal                                         }
Este programa fue creado por
Ing. Hector Conde :ú)
heg_conde@yahoo.com

