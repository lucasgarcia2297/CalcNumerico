clear all; clc;
##TP6 - Diferenciación e Integración Numérica
## Ejercicio 5:


nT = 2; %Regra de los Trapecios
nS = 3; %Regra de Simpson

##--------------Funcion 1 - sen(pi*x)-----------------
f1 = @(x) sin(pi*x);
a1 = 0; b1 = 5;
%f1 = @(x) (x.^3)./((e.^x)-1);
%a1 = 1; b1 = 10;
%f1 = @(x) (exp(-(x).^2));
%a1 = -5; b1 = 5;
Integral_f1 = integral(f1,a1,b1); %Valor Real: 2/pi
Real1 = 2/pi;
Cuadratura1_f1 = quad(f1,a1,b1);
Cuadratura2_f1 = quadgk(f1,a1,b1);
h1 = 1;
for i = 1:12
  h1(i+1) = h1(i)/2;
  L1(i) = (b1-a1)/h1(i+1);
  
  Q1L2(i) = intNCcompuesta(f1,a1,b1,L1(i),nT);
  ETrapL1(i) = abs(Integral_f1 - Q1L2(i));
  
  Q1L3(i) = intNCcompuesta(f1,a1,b1,L1(i),nS);
  ESimpL1(i) = abs(Integral_f1 - Q1L3(i));
endfor
h1 = h1(2:13)';
ETrapRel1 = abs(ETrapL1(1:11)./ETrapL1(2:12)); %División entre valor actual y el anterior. 
ESimpRel1 = abs(ESimpL1(1:11)./ESimpL1(2:12)); % (me dice con que "velocidad" disminuye el error)
##----------------------------------------------------
##--------------Funcion 2: 1/(1+x^2)-----------------
f2 = @(x) 1./(1+x.^2);
a2 = -5; b2 = 5;
Integral_f2 = integral(f2,a2,b2); %Valor Real: 2*arctan(5)
Real2 = 2*atan(5);
Cuadratura1_f2 = quad(f2,a2,b2);
Cuadratura2_f2 = quadgk(f2,a2,b2);
h2 = 1;
for i = 1:12
  h2(i+1) = h2(i)/2;
  L2(i) = (b2-a2)/h2(i+1);
  
  Q2L2(i) = intNCcompuesta(f2,a2,b2,L2(i),nT);
  ETrapL2(i) = abs(Integral_f2 - Q2L2(i));
  
  Q2L3(i) = intNCcompuesta(f2,a2,b2,L2(i),nS);
  ESimpL2(i) = abs(Integral_f2 - Q2L3(i));
endfor
h2 = h2(2:13)';
ETrapRel2 = abs(ETrapL2(1:11)./ETrapL2(2:12));% División entre valor actual y el anterior. 
ESimpRel2 = abs(ESimpL2(1:11)./ESimpL2(2:12));% (me dice con que "velocidad" disminuye el error)
##----------------------------------------------------
##--------------Funcion 3: |x|^3/2-----------------
f3 = @(x) abs(x).^(3/2);
a3 = 0; b3 = 5;
Integral_f3 = integral(f3,a3,b3); %Valor Real: 10*sqrt(5)
Real3 = 10*sqrt(5);
Cuadratura1_f3 = quad(f3,a3,b3);
Cuadratura2_f3 = quadgk(f3,a3,b3);
h3 = 1;
for i = 1:12
  h3(i+1) = h3(i)/2;
  L3(i) = (b3-a3)/h3(i+1);
  
  Q3L2(i) = intNCcompuesta(f3,a3,b3,L3(i),nT);
  ETrapL3(i) = abs(Integral_f3- Q3L2(i));
  
  Q3L3(i) = intNCcompuesta(f3,a3,b3,L3(i),nS);
  ESimpL3(i) = abs(Integral_f3 - Q3L3(i));
endfor
h3 = h3(2:13)';
ETrapRel3 = abs(ETrapL3(1:11)./ETrapL3(2:12)); %División entre valor actual y el anterior. 
ESimpRel3 = abs(ESimpL3(1:11)./ESimpL3(2:12)); % (me dice con que "velocidad" disminuye el error) 
##----------------------------------------------------
f1
Tabla1 = [Q1L2', ETrapL1',[0,ETrapRel1]',Q1L3', ESimpL1',[0,ESimpRel1]']
f2
Tabla2 = [Q2L2', ETrapL2',[0,ETrapRel2]',Q2L3', ESimpL2',[0,ESimpRel2]']
f3
Tabla3 = [Q3L2', ETrapL3',[0,ETrapRel3]',Q3L3', ESimpL3',[0,ESimpRel3]']
