#Ejercicio 2: Enuncie el teorema de Taylor y utilice el término de error de dicho polinomio
#   para estimar el error involucrado en aproximar sin(x) ? x para aproximar sin(1?). Ayuda: primero
#   convierta los grados a radianes, construya el polinomio de Taylor correspondiente y finalmente
#   utilice la cota |cos(?)| ? 1.
#
clear all; clc;

f = @(x) sin(x);

#polinomios de taylor polinomio de grado n -->pn
p1 = @(x) x;
p3 = @(x) x-x.^3/factorial(3);
p5 = @(x) x-x.^3/factorial(3)+x.^5/(factorial(5));
p7 = @(x) x-x.^3/factorial(3)+x.^5/(factorial(5))-x.^7/(factorial(7));
p9 = @(x) x-x.^3/factorial(3)+x.^5/(factorial(5))-x.^7/(factorial(7))+x.^9/(factorial(9));


figure(1)
x = linspace(-pi,pi,51);
#Funcion Real: sin(x)
plot(x,f(x),'k-')
hold on
#Comparación con aproximaciones con polinomios de diferentes grados
plot(x,p1(x),'r-')
plot(x,p3(x),'w-')
plot(x,p5(x),'y-')
plot(x,p7(x),'g-')
plot(x,p9(x),'b-')
grid on
grid minor
hold off

#Conversion de grado a radian
x0grad = 1;
x0 = x0grad*pi/180;

#Valor real en sen(1°) (pasado ahora a radianes)
sinx = sin(x0)

#Valor aproximado con polinomio de grado 9
p9x = p9(x0)


#Calculos con el Residuo (tomandolo como una cota)
R9 = @(x) x.^10/factorial(10);

fTpos = @(x) p9(x)+R9(x);
fTneg = @(x) p9(x)-R9(x);

figure(3)
plot(x,f(x),'k-')
hold on
grid on
grid minor
plot(x,p9(x),'r')
#Cota inferior y superior
plot(x,fTneg(x),'b-',x,fTpos(x),'g-')
hold off

#Cálculo del error absoluto y relativo en x = 1° 
ErrorAbs = abs(sinx-p9x)

ErrorRel = ErrorAbs/sinx

