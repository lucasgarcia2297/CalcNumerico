clc; clear all;
##TP4 - Ecuaciones no lineales
##  Ejercicio 6:
##  f(x) = x*(ln(x+3)-17)-1 unico cero en (0,inf).

##   En Octave log(x) = ln(x)
f = @(x) x.*(log(x+3)-17) - 1;
df = @(x) (x./(x+3))+log(x+3)-17;
a = 0;
b = 1;
while( f(a)*f(b) > 0)
  b = 2*b;
endwhile

tol1 = 1e-2; %Error absoluto en biseccion
tol2 = 1e-12; %Error relativo en NewtonRaphson 
maxit = 10000;
[p0, rh, it, t] = biseccion(f, a, b, maxit, tol1)
[p, rh, it, t] = NewtonRaphson(f, df, p0, maxit, tol2)
p
x = linspace(b/2,b,10000)';
plot(x,f(x))
hold on
grid on
line([b/2,b],[0,0]);
  
  