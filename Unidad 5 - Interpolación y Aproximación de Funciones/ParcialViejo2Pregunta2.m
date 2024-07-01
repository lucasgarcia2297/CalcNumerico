clc; clear all;
#Ejercicio de parcial viejo 2
#Pregunta 2

#Aproximar la función mediante un trazador cubico natural
#para x=1, x=2, x=3.  
#Elegir la opcion correctas.

f = @(x) 5./x;

x = [1 2 3]';
y = f(x);
 
[a, b, c, d] = Spline_Cubico_Natural(x, y);
[S] = ArmarSpline (a,b,c,d,x);
#Mostrar los coeficientes y ver cuales representan la spline
#Tener en cuenta que:
#   Si(x) = a(i+1) + b(i+1)*(x-1) + c(i+1)*(x-1)^2 + d(i+1)*(x-1)^3
a
b
c
d