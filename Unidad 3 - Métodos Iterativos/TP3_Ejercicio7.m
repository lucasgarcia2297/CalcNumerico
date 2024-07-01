clc; clear all;
##TP3 - Métodos iterativos
##  Ejercicio 7:
##    Resolver el sistema con el método de GaussSeidel y analizar.
##    Luego intentar resolver con Eliminación de Gauss. ¿Es necesario
##    aplicar alguna estrategia de pivoteo?.
       
##{ 3x +  y +  z = 5
##{  x + 3y -  z = 3
##{ 3x +  y - 5z = -1

##{ 3x +  y +  z = 5
##{ 3x +  y - 5z = -1
##{  x + 3y -  z = 3

A1 = [ 3  1  1
      1  3 -1
      3  1 -5];
b1 = [5 3 -1]';

A2 = [ 3  1  1
       3  1 -5
       1  3 -1];
b2 = [5 -1 3]';

tol = 1e-9;
maxit = 1000;
x0=zeros(length(b1),1);

[x1,it1,r1] = GaussSeidel(A1,b1,x0,maxit,tol); %Converge
[x2,it2,r2] = GaussSeidel(A2,b2,x0,maxit,tol); %No converge, RadEspec(Tgs>>1)

[xG1] = Eliminacion_Gauss (A1,b1); %Converge
[xG2] = Eliminacion_Gauss (A2,b2); %No converge, es necesario el pivoteo;

[xG1P] = Gauss_P(A1,b1); %Converge
[xG2P] = Gauss_P(A2,b2); %Converge 
