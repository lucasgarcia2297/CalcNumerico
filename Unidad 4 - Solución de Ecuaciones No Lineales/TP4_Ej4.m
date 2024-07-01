#TP4 - Ejercicio 4:
#Use el método de Newton para aproximar, con una exactitud de 10?4, el valor de x 
% que en la gr´afica de y = x2 produce el punto m´as cercano a (1, 0). 
% Ayuda: Reduzca al mínimo [d(x)]2 donde d es la función distancia de la gráfica al punto.
clc; clear all;

% dx: distancia de x a f(x)=x^2
% 
% dx = sqrt((x-1)^2+(x^2)^2)
% fx = [dx]^2 = x^4 + x^2 - 2x + 1
% fx' = dxf' = 4x^3 + 2x - 2
% fx''= dfx''= 12x+2 

f = @(x) x.^4 + x.^2 - 2*x + 1;
df = @(x) 4*x.^3 + 2*x - 2;
ddf = @(x) 12*x + 2;

tol = 10^-4; %1e-4
kmax = 100;
x0 = 1;
#0.5898;

[x,rh,it,t] = NewtonRaphson(df,ddf,x0,kmax,tol);

disp('El punto más cercano es:');
x
%Punto(0.5898,0)

##Gráfica
g = @(x) x.^2;
xx = linspace(-3,3,1000)';
plot(xx,g(xx),'r-',x,g(x),'gx')
hold on
grid on
plot([x 1],[g(x) 0],'k-.-')
