clc; clear all;
##TP2 - M�todos directos
##Ejercicio 4 (Aula):
##  (a) Escriba funciones de Octave que implementen los algoritmos para resolver
##   un sistema triangular superior por sustituci�on hacia atr�as y un sistema 
##   triangular inferior por sustituci�on hacia adelante en forma vectorizada 
##   (eliminando lazos anidados).

##  (b) P�ngalas a prueba sobre los siguientes sistemas:
##    Sustituci�n hacia atras:
##        A = [1 -1 2 -1; 0 2 -1 1; 0 0 -1 -1; 0 0 0 2];
##        b = [-8 6 -4 4]' 
##    Sustituci�n hacia adelante:
##      Utilice la transpuesta de la matriz del sistema anterior y el mismo 
##      vector de t�rminos independientes.  A1=A' b2=b;
## (c) Realice el conteo anal�tico de operaciones involucradas tanto en la 
##      sustituci�n hacia adelante como en la sustituci�n hacia atr�s y responda 
##      cu�l es la complejidad de los algoritmos.

#Inciso(a)------------ 
 
#----------------------------
#inciso (b):-------------
A1 = [1 -1 2 -1; 0 2 -1 1; 0 0 -1 -1; 0 0 0 2]
b1 = [-8 6 -4 4]'
x1 = Sustitucion_Atras([A1 b1]);
A2 = A1'
b2 = b1
x2 = Sustitucion_Adelante([A2 b2]);
#----------------------------