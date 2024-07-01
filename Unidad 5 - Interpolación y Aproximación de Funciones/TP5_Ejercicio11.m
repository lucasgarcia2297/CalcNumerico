clear all; clc;
##TP5 - Interpolación y aproximación de funciones
## Ejercicio 11: 

t = [4 8 12 16 20 24]';
c = [1590 1320 1000 900 650 560]';

%---------------Inciso a)--------------------------
%c(t) = b*e.^(-k*t)
%log(c) = log(b)+(-k*t)
%log(c) = log(b) + -k*t
p= polyfit(t,log(c),1);  %p = -k*x + log(b)
b = e.^p(2)
k = -p(1)

f = @(t) b*e.^(-k*t);

#Para graficar
xx = linspace(0,24,1000)';
plot(t,c,'r*',xx,f(xx),'b-')
hold on
grid on
plot(t,e.^(polyval(p,t)),'g-*')
hold off
%----------------------------------------------------

%---------------Inciso b)--------------------------
t0 = e.^(polyval(p,0))
%--------------------------------------------------
%---------------Inciso c)--------------------------
%log(c) = log(b) + -k*t
% t = -log(b)/(k) + log(c)/k
t200 = (log(200)-p(2))/p(1)
c200 = f(t200)
%--------------------------------------------------
polinomio = e.^(polyval(p,t));
[t c polinomio]


#Lo que me pidieron en el parcial 2 - 2022
Error_Cuad = norm(c-e.^(polyval(p,t)),2)
%Resultado : Error Cuadrático del Ajuste: 83.97513487712811---> 83.9751 (6 cifras sig)

Error_rel = abs(polinomio(end)-c(end))/abs(c(end))
%Resultado : Error Relativo para t=24: 0.01453376714957122---> 0.0145338(6 cifras sig) 