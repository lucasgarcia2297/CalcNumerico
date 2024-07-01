clc; clear all; clf;
## TP5 - Interpolacion
## Ejercicio 2-b)
f = @(x) sin(x);
inter = [0 1];
n = 10;
x = linspace(0,1,10)';
y = f(x);
[L,P] = Lagrange (x,y);
yP = polyval(P,x);
PL = polyout(P,'x');
plot(x,f(x),'r-',x,yP,'b.-*')
grid on
hold off
[y yP]
error_Abs = abs(y-yP)
error_relativo = error_Abs(1:n)./abs(y(1:n))
figure(2)
plot(x,y,'r-');
hold on
grid on
plot(x,yP+error_Abs,'b-')
plot(x,yP-error_Abs,'m-')
