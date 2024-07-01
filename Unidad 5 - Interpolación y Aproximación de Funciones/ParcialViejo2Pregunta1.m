clc; clear all;
#Parcial 2 Viejo.
## Ejercicio 10:

x = [ -1    0    1    2 ]';
y = [-1.1 -0.4 -0.9 -2.7]';
plot(x,y,'k*')

%f = @(x) -e^(a*x.^2+b*x+c);
%ln(-y) = a*x.^2+b*x+c;
p2 = polyfit(x,log(-y),2);
expresionp2 = polyout(p2,'x')

f = @(x) -e.^(polyval(p2,x));

xx = linspace(-1.5,2.5,101)';
%pf = polyval(p2,xx);

hold on

plot(xx,f(xx),'g-')
grid on
fx = @(x) -e.^(p2(1)*x.^2 + p2(2)*x + p2(3))

ErrorCuad = norm((y-f(x)),2)      %Error cuadrático del ajuste.
ErrorRel_x1 = (y(3)-f(x(3)))/(y(3))  %Error Relativo en x=1.