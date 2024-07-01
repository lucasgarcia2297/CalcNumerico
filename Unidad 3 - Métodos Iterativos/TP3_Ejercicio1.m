clc; clear all;
#TP3 - Métodos Iterativos
#Ejercicio 1:

%Def: Si el Radio espectral (rho) de la matriz (A) es menor a 1 la matriz 
%   se llama convergente y eso equivale a: 
%     lim(k->inf) (A(i,j))^k = 0
%   para cada elemento A(i,j) de la matriz.

A = [3/4 1/6; 1/4  1/4]

radioEspectral = RadEspec(A) %rho = max(abs(eig(A)))
Autovalores = eig(A)

disp('Como el radio espectral es menor a Uno (rho(A)<1) la matriz es convergente.');

