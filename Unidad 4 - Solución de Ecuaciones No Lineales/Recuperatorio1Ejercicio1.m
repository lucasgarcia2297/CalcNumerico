clc; clear all; clf;
#Recuperatorio 1
##TP4 - Ecuaciones No lineales
## Ejercicio 3
## a) Implementar funcion de NewtonRaphson.
## b) Implementar funcion de la Secante.
## c) Calcular las raices positivas de funcion
##      f(x) = sen(x)+cos(1+x^2)-1
##    que son menores que 5, con 10 digitos correctos.
##    Utilizar biseccion, secante y newton.
##    Mostrar numero de iteraciones de cada metodo.
    
f = @(x) sin(x)+cos(1+x.^2)-1;
df = @(x) cos(x)- 2*x.*sin(1+x.^2);

x = linspace(0,6,1000)';
plot(x,f(x),'r-');
hold on
grid on
plot(x,df(x),'b-');

maxit = 1000;
tol = 1e-10;
#Para r1
a = 0;
b = 2;
x0 = 2;
[p1B, rh1B, it1B, t1B] = biseccion(f, a, b, maxit, tol);
[p1N, rh1N, it1N, t1N] = NewtonRaphson(f, df,x0, maxit, tol);
[p1S, rh1S, it1S, t1S] = secante(f, a, b, maxit, tol);
disp('Biseccion')
p1B
t1B
it1B
disp('NewtonRaphson')
p1N
t1N
it1N
disp('Secante')
p1S
t1S
it1S

#Para r2
a = 2;
b = 3;
x0 =2.5;
[p2B, rh2B, it2B, t2B] = biseccion(f, a, b, maxit, tol);
[p2N, rh2N, it2N, t2N] = NewtonRaphson(f, df,x0, maxit, tol);
[p2S, rh2S, it2S, t2S] = secante(f, x0, b, maxit, tol);
disp('Biseccion')
p2B
t2B
it2B
disp('NewtonRaphson')
p2N
t2N
it2N
#Para la secante debo darle otro valor a 'a' por 
# que sino no converge.
disp('Secante')
p2S
t2S
it2S

disp(' ');
disp("Respuesta con 10 digitos correctos: 2 raices")
disp("raiz 1: x = 1.944608425")
disp("raiz 2: x = 2.532212552")


#Marcar las raices positivas menores que 5 en la gráfica
plot([0, 5],[0 0],'k-.-')
plot(p1N,f(p1N),'r*',p2N,f(p2N),'r*')
legend("funcion f(x)","derivada df(x)")
hold off
