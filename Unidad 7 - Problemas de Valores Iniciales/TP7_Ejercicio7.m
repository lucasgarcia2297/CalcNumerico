clear all; clc;
##TP7 - 
##Ejercicio 7
% { x1'(t) = -t*x2
% { x2'(t) = t*x1 - t*x2

#La f debo definirla como:
% x debo definirlo como un vector, en este caso de 2 componentes
a = 0; b = 20;
h = 0.05;
L = (b-a)/h; %Calcularlo L = 400 para este caso
f = @(t,x) [-t*x(2)        ; 
             t*x(1) - t*x(2)];

y0 = [1 -1];

[t,x] = EulerSistemaEDO(f,a,b,y0,L);
plot(x(:,1),x(:,2),'b-')
hold on
grid on
plot(x(1,1),x(1,2),'r*')
