clc; clear all;
#TP3 - Métodos Iterativos
#Ejercicio 4:

# a) función Sor

#Sistema:  
#{  10x1 +  5x2             = 6
#{   5x1 + 10x2 - 4x3       = 25
#{       -  4x2 + 8x3 -  x4 = -11
#{              -  x3 + 5x4 = -11

A = [10  5  0  0;
      5 10 -4  0;
      0 -4  8 -1;
      0  0 -1  5];
% A es tridiagonal y definida positiva.
b = [6 25 -11 -11]';


x0 = zeros(length(b),1);
maxit = 1000;
tol = 1e-15;

#forma de calcular el w optimo sin la formula.
for i = 1:100
  w(i) = 0.02*(i);
  [x,it,r] = Sor(A,b,x0,maxit,tol,w(i));
  iterac(i) = it;
endfor
pos = find(iterac == min(iterac));
wOptimo = 0.02*pos

# Si la matriz A es definida positiva y tridiagonal entonces 
#       rho(Tgs) = [rho(Tj)]^2 < 1 
# y el valor optimo de w se puede calcular con la formula 
#      w = 2 / (1+sqrt(1-(rhoTJ)^2));
# y rho(Tsor) = w-1;

[T,c] = Tc_Jacobi(A,b);
rhoTJ = max(abs(eig(T)));
wOp = 2 / (1+sqrt(1-(rhoTJ)^2));
[xOp,itOp,rOp] = Sor(A,b,x0,maxit,tol,wOp);
