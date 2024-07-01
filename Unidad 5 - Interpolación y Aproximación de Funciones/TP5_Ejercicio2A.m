clc; clear all;clf;
##Guia TP5 - Interpolacion y aproximación de funciones
##  Ejercicio 2
##   Encontrar el polinomio de interpolación en la forma de lagrange PL(x)
##   Newton PN(x) y el método de coeficientes indeterminados PCI(x)
##  P(x) = dx^3 + cx^2 + bx + a

x = [3   5   7   9]';
y = [1.2 1.7 2.0 2.1]';
%x = [3   5   7   9 10 14 15 16]';
%y = [1.2 1.7 2.0 2.1 2.3 5.6 9 10]';
puntos = [x y]

##--------------------Diferencias Divididas de Newton---------------------------
tic()
[c3] = difdivVec(x,y);
tt1 = toc();
tic()
[c,dv] = dif_div(x,y);
tt2 = toc();


coef_de_Polinomio = c;
dif_divididas = dv;

%PN = @(z) 1.2 + 0.25*(z-3)- 0.025*(z-3).*(z-5)+0*(z-3).*(z-5).*(z-7);
%PN = @(z) c(1) + c(2)*(z-3) + c(3)*(z-3).*(z-5)+ c(4)*(z-3).*(z-5).*(z-7);

z = linspace(0,10,101)';
[coefN,N2] = ArmarPolinomioNewton (c,x);
Polinomio_Resultante_Newton = polyout(coefN,'x') 
PN = polyval(coefN,z);
figure(1)
plot(x,y,'r*');
hold on;
grid on;

plot(z,PN,'b-');
%hold off
##------------------------------------------------------------------------------

##-------------------------Polinomios de Lagrange-------------------------------
[L,coefL] = Lagrange(x,y);
Polinomio_Resultante_Lagrange = polyout(coefL,'x')
PL = polyval(coefL,z);
plot(z,PL,'y-.')

##------------------------------------------------------------------------------