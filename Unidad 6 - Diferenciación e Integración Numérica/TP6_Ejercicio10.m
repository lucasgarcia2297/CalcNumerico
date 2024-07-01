clc; clear all;
#TP6 - Diferenciación e Integración Numérica
#Ejercicio 10:

#Area de superficie de revolución:
# integral(2pi*f(x)*sqrt(1+[f'(x)]^2), a , b)

f = @(x) 20*x - (x.^3)/5;
a = 0; b = 2;
L = 5;

n = 3;

#Cuadratura de gauss
QGauss = cuad_gauss_c (f,a,b,L,n)

#Simpson
n = 3; % para Simpson
QSimpson = intNCcompuesta(f,a,b,L,n) 