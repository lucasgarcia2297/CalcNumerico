clc; clear all;
##TP2 - Métodos directos
##Ejercicio 4 (Aula):
##  (a) Escriba funciones de Octave que implementen los algoritmos para resolver
##   un sistema triangular superior por sustituci´on hacia atr´as y un sistema 
##   triangular inferior por sustituci´on hacia adelante en forma vectorizada 
##   (eliminando lazos anidados).

##  (b) Póngalas a prueba sobre los siguientes sistemas:
##    Sustitución hacia atras:
##        A = [1 -1 2 -1; 0 2 -1 1; 0 0 -1 -1; 0 0 0 2];
##        b = [-8 6 -4 4]' 
##    Sustitución hacia adelante:
##      Utilice la transpuesta de la matriz del sistema anterior y el mismo 
##      vector de términos independientes.  A1=A' b2=b;
## (c) Realice el conteo analítico de operaciones involucradas tanto en la 
##      sustitución hacia adelante como en la sustitución hacia atrás y responda 
##      cuál es la complejidad de los algoritmos.

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