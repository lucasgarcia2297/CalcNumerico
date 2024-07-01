##TP2 - Ejercicio 6:
clc; clear all;

A = [1 -2 3 0; 3 -6 9 3; 2 1 4 1; 1 -2 2 -2];
b = [1 2 3]';

[P,L,U] = doolittle_p(A)