clc; clear all; clf;
##TP5 - Ejercicio 3-a)

x = [0 1 3/2 2]';
y = [3 3 13/4 5/3]'; %f(x)

[P, c, N] = PolIntNewton(x, y);
xx = linspace(0,2,101);
PN = polyval(P,xx);
plot(x,y,'b*',xx,PN,'r-')
grid on

%Polinomio de interpolación
PN = polyout(P,'x')
