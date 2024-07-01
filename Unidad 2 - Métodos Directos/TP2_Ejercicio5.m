##TP2 - Ejercicio 5:
clc; clear all;


A1 = [8 4 1; 2 6 2; 2 4 8];
A2 = [5.00e-02 5.57e+02 -4.00e-02; 1.98 1.94e02 -3.00e-03; 2.74e02 3.11 7.50e-02];
A3 = [1 2 -1; 2 4 0; 0 1 -1];
b = [1 2 3]';

[x1,Ab1,L1,U1,P1] = Doolittle(A1,b);
[x2,Ab2,L2,U2,P2] = Doolittle(A2,b);
[x3,Ab3,L3,U3,P3] = Doolittle(A3,b);

%residuos
r1 = b - A1*x1;  
r2 = b - A2*x2;
r3 = b - A3*x3;
%los errores en r1 y r3 son menores a 1e-16 por lo tanto se consideran exactos: [0 0 0]'
%para r2 se tiene un error de 
%r2 = [ 
 %      2.220446049250313e-16
 %                          0
 %      -8.881784197001252e-16 ]