clc; clear all;
#Parcial 2 Viejo:}
#Relacionado con Ejercicio 10 del TP6

#Area de superficie de revolución:
# integral(2pi*f(x)*sqrt(1+[f'(x)]^2), a , b)

f = @(x) 2+cos(pi*x);
#Calculo la derivada
df = @(x) -sin(pi*x)*pi;

a = 0; b = 2;
L = 4000;
n = 3;

#Formo el integrando
g = @(x) 2*pi*f(x).*sqrt(1+(df(x)).^2);

#Cuadratura de gauss
QGauss = cuad_gauss_c (g,a,b,L,n) %57.9282708 (9 cifras exactas)
#Q = quad(g,a,b)

