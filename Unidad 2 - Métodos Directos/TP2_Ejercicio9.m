clc; clear all;
##TP2 - Métodos directos
##  Ejercicio 9 (Aula):
##    Realice la factorización LU de la siguiente matriz 
##    siguiendo el orden de Doolittle, con y sin pivoteo 
##    parcial (con lo cual, si P es distinta de la identidad,
##    en realidad se tiene PA = LU). Luego, calcule las 
##    matrices residuales A?LU y PA?LU y justifique las 
##    diferencias que ocurren.
##
##      A = [1 1+0.5e-15   3
##           2      2      20
##           3      6      4  ]

A = [1 1+0.5e-15 3; 2 2 20; 3 6 4];

#Doolittle Sin poviteo
[L1,U1] = doolittleSinPiv (A);
MatrizResidual1 = A-L1*U1

#Doolittle Con pivoteo
[P,A2,L2,U2] = doolittle_p (A);
MatrizResidual2 = P*A-L2*U2

#El error que se obtiene sin el pivoteo es mucho mas grande