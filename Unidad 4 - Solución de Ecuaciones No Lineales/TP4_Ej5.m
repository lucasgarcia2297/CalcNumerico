#TP4 - Ejercicio 5
#La ecuación de estado de un gas (la cual relaciona la presión p, 
# el volumen V y la temperatura T) está dada por:
#                 [p + a(N/V)2](V ?Nb) = kNT
# donde a y b son dos coeficientes que dependen del gas en particular
# que hayamos considerado, N es el número de moléculas que se encuentran
# en el volumen V y k es la constante de Boltzmann. Asumiendo que el gas es
# dióxido de carbono (CO2), los coeficientes a y b toman los siguiente valores:
#   a = 0.401[Pa·m6] y b = 42.7e?6[m3]. Encuentre el volumen que ocupan 1000 
# moléculas de dicho gas a una temperatura T = 300K y presión p = 3.5e+7[Pa]
# mediante el método de bisección y el método de Newton, con una tolerancia 
# de 1e?12 (la constante de Boltzmann vale k = 1.3806503e?23 [J/K])
#
clear all; clc;
a = 0.401;
b = 42.7e-6;
p = 3.5e+7;
T = 300;
k = 1.3806503e-23;
N = 1000; %Numero de moléculas.

% [p + a(N/V)^2](V - Nb) = kNT
% f = [p + a(N/V)^2](V - Nb) - kNT;
% f = [pV - pNb + (a(N/V)^2)V - (a(N/V)^2)Nb] - kNT
% f = pV^3 - (pNb+kNT)V^2 + a(N^2)V - a(N^3)b
% f(V) = 0;
f = @(V) p*V.^3 - (p*N*b +k*N*T)*V.^2 + a*(N^2)*V - a*(N^3)*b;
df = @(V) 3*p*V.^2 - 2*(p*N*b +k*N*T)*V + a*(N^2);

V = linspace(-1,1,1000)';
plot(V,f(V),'r-');
grid on
grid minor
legend("Función de acuerdo al Volumen")

tol = 1e-12;
kmax = 100;
x0=1;
a = -1;
b = 1;
[Volum1000_B, rh, it, t] = biseccion(f, a, b, kmax, tol);
[Volum1000_N,rh,it,t] = NewtonRaphson(f,df,x0,kmax,tol);
Volum1000_B %Volumen que ocupan 1000 moleculas calculado con biseccion.
Volum1000_N %Volumen que ocupan 1000 moleculas calculado con Newton-Raphson.