clc; clear all; clf;
#Ejercicio Parcial 1 
#En referencia al ejercicio 3 del TP4
# calcular el valor de x mas cercano a 8 cuando f(x) alcanza un maximo
  
f = @(x) sin(x) + cos(1+x.^2) - 1;
df = @(x) cos(x) - 2*x.*sin(1+x.^2);
##ddf = @(x) -sin(x) -  
a = 7.8; 
b = 7.95;
x = linspace(a,b,1000)';
plot(x,f(x),'r-');
hold on
grid on
plot(x,df(x),'b-');
plot([a b],[0 0],'k-.');
legend("funcion", "derivada")

maxit = 1000;
tol = 1e-10;
x0 = 7.85;
[p1B, rh1B, it1B, t1B] = biseccion(df, a, b, maxit, tol);
##[p1N, rh1N, it1N, t1N] = NewtonRaphson(df, ddf,x0, maxit, tol);
[p1S, rh1S, it1S, t1S] = secante(df, a, b, maxit, tol);
disp('Biseccion')
p1B     
##t1B
##it1B
f(p1B)

##disp('NewtonRaphson')
##p1N
##t1N
##it1N
disp('Secante')
p1S
##t1S
##it1S
f(p1S)

#Respuesta:
disp("xmax con 10 digitos correctos:");
disp(" xmax = 7.863285666");
disp("f(xmax) con 7 cifras decimales:");
disp(" f(xmax) = 0.9999565");