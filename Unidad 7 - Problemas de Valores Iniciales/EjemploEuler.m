clc; clear all;
##Ejemplo Euler:
f = @(x,y) 2*x;
a = 0; b = 6;
n = 20;
y0 = 1;
[x,y] = Euler(f,a,b,y0,n);
xx = linspace(0,6,200)';
plot(x,y,'g-*',xx,xx.^2+1,'r-');
grid on