##Guia 02 - Métodos directos.
##Ejercicio 3: 
##  Determine si la siguiente matriz es e.d.d y s.d.p. 
##  Justifique su respuesta.
##    A = [2 -1 0; -1 4 2; 0 2 2]

#Si A es estrictamente diagonal dominante entonces los Aii son mayores que Aij para j distinto de i
clc; clear all;
A = [2 -1 0; -1 4 2; 0 2 2];
DiagDominant(A);

