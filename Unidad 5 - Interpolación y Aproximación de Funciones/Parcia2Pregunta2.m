#Ejercicio Pregunta 2 Parcial 2022
clc; clear all;

T = [0 1 1.9 2.7]';
P = [20000 17530 15500 11534]';
[T P];

[a, b, c, d] = Spline_Cubico_Natural(T,P)
[S] = ArmarSpline (a,b,c,d,T);

t = linspace(0,2.7,2000)';
plot(t,S(t),'r',2.3,S(2.3),'g*')
S(2.3)