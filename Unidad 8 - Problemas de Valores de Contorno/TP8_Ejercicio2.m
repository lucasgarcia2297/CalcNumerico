clear all;
clc;
#TP8 - Ejercicio 2 [PVC]
# Disparo Lineal
# {?y'' + p(x)y' + q(x)y + r(x) = 0,  a ? x ? b
# { y(a) = ?, 
# { y(b) = ?

#f(x) = [ p(x)    q(x)   r(x)] Columnas
f = @(x) [(-2/x) 2./(x.^2) sin(log(x))/(x.^2)];

a = 1; b=2; inter = [a b];   %1<=x<=2
yc = [1 2];    %condiciones de contorno: y(a)=1 y(b)=2
h = 0.01; %probar con 0.1 y 0.01; 
L = (b-a)/h;

%Solucion con disparo lineal
[xd, yd] = disparo_lineal(f,inter,yc, L);

#Solución exacta
c2 = (1/70)*(8 - 12*sin(log(2)) - 4*cos(log(2)));
c1 = (11/10)-c2;
y_exacta = @(x) c1.*x + (c2./x.^2) - (3/10)*sin(log(x)) - (1/10)*cos(log(x));

%Gráfica
figure(1)
xx = linspace(inter(1), inter(2), L+1)';
plot(xx,y_exacta(xx),'r-');
hold on
grid on
plot(xd,yd,'b-*')
hold off

#Calculo del error y gráfica
Error_abs = abs(y_exacta(xx) - yd)
figure(2)
semilogy(xx,Error_abs)
grid on
grid minor

ErrorCuadratico = norm(y_exacta(xx)-yd) %