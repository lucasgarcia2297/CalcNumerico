clc; clear all;
## TP2 - Métodos directos
##  Ejercicio 10: Considere un circuito eléctrico como el que se 
##    muestra en la Figura 1. 
##    Se pide aplicar las leyes de Kirchhoff para calcular las 
##    corrientes i1, i2, i3 e i4.

R1 = 50; R2 = 30; R3 = 15; R4 = 10; R5 = 5; R6 = 25; R7 = 20; R8 = 10; R9 = 15; R10 = 30;

#Ley de los voltajes de Kirchhoff
#sum(V) = 0;

#Malla 1:
#V2 - R2*i1 -R1*i1 + R2*i3 + R1*i2 = 120 - 80*i1 +30*i3 + 50*i2;

#Malla 2:
#R1*i1-R1*i2 -R3*i2 -R4*i2+R4*i3 -R6*i2+R6*i4;

#Malla 3:
#R2*i1-R2*i3 + R4i2-R4*i3 

#...


R = [ -(R1+R2)        R1            R2                 0;
          R1   -(R1+R3+R4+R6)       R4                R6;
          R2          R4      -(R2+R4+R5+R7)          R7;
          0           R6            R7       -(R6+R7+R8+R9+R10)
      ]
      
# Corrientes
# x = [i1 i2 i3 i4];

V = [-120 0 0 0]'

[i] = gauss_p (R, V)