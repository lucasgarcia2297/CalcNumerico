clear all; clc;
##TP6 - Diferenciación e Integración Numérica
## Ejercicio 4:

f1 = @(x) sin(pi*x);
a1 = 0; b1 = 5;

f2 = @(x) 1./(1+x.^2);
a2 = -5; b2 = 5;

L = 1;
##=======================Inciso a)===========================
%Tomamos como valor real de la integral a la funcion quad
QReal1 = quad(f1,a1,b1);
QReal2 = quad(f2,a2,b2);
for n = 2:13
  Q1(n-1,1) = intNCcompuesta(f1,a1,b1,L,n);
  Q2(n-1,1) = intNCcompuesta(f2,a2,b2,L,n);
  errorAbs1(n-1,1) = abs(QReal1-Q1(n-1,1));
  errorAbs2(n-1,1) = abs(QReal2-Q2(n-1,1));
endfor 
format long
disp('Funcion 1 : f(x) = sen(x)') 
disp('n       -       Error Absoluto') 
[ errorAbs1]
disp('Funcion 2 : f(x) = 1/(1+x^2)') 
disp('n       -       Error Absoluto') 
[ errorAbs2]
##===========================================================
##=======================Inciso b)===========================
x1 = linspace(a1,b1,100)';
x2 = linspace(a2,b2,500)';
figure(1)
for n = 2:13
  plot(x1,f1(x1),'r-');
  hold on 
  grid on
  P1 = polyfit(x1,f1(x1),n);
  xx = linspace(a1,b1,n)';
  plot(x1,polyval(P1,x1),'b-',xx,zeros(n,1),'g*')
  n
  pause(1);
  hold off;
endfor
figure(2)
for n = 2:13
  plot(x2,f2(x2),'r-');
  hold on 
  grid on
  P2 = polyfit(x2,f2(x2),n);
  xx = linspace(a2,b2,n)';
  plot(x2,polyval(P2,x2),'b-',xx,zeros(n,1),'g*')
  n
  pause(1);
  hold off;
endfor
