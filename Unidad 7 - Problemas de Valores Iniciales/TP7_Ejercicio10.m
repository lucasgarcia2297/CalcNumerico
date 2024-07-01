clear all; clc; clf;
#TP7 - Ejercicio 10
#{q''(t) + sen(q(t)) = 0   q representa el angulo tetha
l = 9.81;  %longitud del pendulo
g = 9.81;  %aceleracion de la gravedad
f = @(t,q)  [q(2);
            -(g/l).*sin(q(1))];


a= 0; b = 20;
inter = [a,b];
L = 10000; %subintervalos para calcular con RungeKutta4

%          [q(0); q'(0)];
##q0(:,1) = [0.1; 0];   %caso a) %el pendulo se mueve con un angulo entre (0.1/pi) y (-0.1/pi) radianes. 
##q0(:,2) = [0.7; 0];   %caso b) %el pendulo se mueve con un angulo entre (0.7/pi) y (-0.7/pi) radianes. 
q0(:,3) = [3.0; 0];   %caso c) %el pendulo se mueve con un angulo entre (3/pi) y (-3/pi) radianes.  
##q0(:,4) = [3.5; 0];   %caso d) %sobrepasa a pi, por lo que comienza a moverse contando 1.11*pi más, aprox
##q0(:,5) = [0; 1];     %caso e)
##q0(:,6) = [0; 1.99];  %caso f)
##q0(:,7) = [0; 2];     %caso g) %el pendulo queda justo en la parte de arriba
##q0(:,8) = [0; 2.01];    %caso h) %el pendulo sobrepasa pi, y empieza dar muchas vueltas
for i = 1:length(q0)
[t,q] = RungeKutta4(f,inter,q0(:,i),L);
plot(t,q(:,1),'r-')  %posicion
plot(t,q(:,2),'b-')  %velocidad
%
%plot(q(:,1),q(:,2),'k-')
hold on
pause(1.5)

endfor