clc; clear all; clf;
## TP5 - Ejercicio 4
##Ejercicio 4: Utilice el método de diferencias divididas 
## de Newton para resolver el siguiente problema
## de interpolación de Hermite. Buscamos el polinomio 
## que ajusta los siguientes valores: 
## p(1) = 2, p'(1) = 3, p(2) = 6, p'(2) = 7, p''(2) = 8.

x = [1 2];
y1 =[2 6];  %f(x)
y2 =[3 7];  %f'(x)
y3 =[8];   %f''(x) (la gráfica solo va a coincidir en el x2)

z = [x(1) x(1) x(2) x(2) x(2)]';


%Calculo por dif_divididas teniendo en cuenta las derivadas
  %[p(1) ]
c = [2   3  1 2 -1]';


[P,N] = ArmarPolinomioNewton (c,z);
%Expresiones del Polinomio obtenido y sus derivadas---
PH = polyout(P,'x')

dP = polyder(P);
dPH = polyout(dP,'x')

ddP = polyder(dP);
ddPH = polyout(ddP,'x')
%------------------------------------------------------

%Evalúo el polinomio con sus derivadas para luego graficarlos
zz = linspace(0.9,2.1,101);
PN = polyval(P,zz);
dPN = polyval(dP,zz);
ddPN = polyval(ddP,zz);

%Polinomio
plot(zz,PN,'r-');
hold on
grid on
plot(x,y1,'r*')

%Primer Derivada
plot(zz,dPN,'b-');
plot(x,y2,'b*')

%Segunda Derivada
plot(zz,ddPN,'g-');
plot(x,y3,'g*')