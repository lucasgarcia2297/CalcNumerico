%TP3 Entregable 2022
%Script 1 para item (a)
clear all; clc; clf;

f = @(t,x) [-t*x(2);
            t*(x(1)-x(2))];
            
x0 = [-1;1]; %Punto Inicial

a = 0;        %t inicial
b = 20;       %t "final"
h = 0.01;     %paso
L = (b-a)/h;  %subintervalos

[t_RK4, x_RK4] = RungeKutta4(f,[a b],x0,L); %Obtengo las soluciones

#---------------------Grafico----------------------------------------
figure(1)

%Curva
plot(x_RK4(:,1),x_RK4(:,2),'r') 

%Detalles de la gráfica
title('Trayectoria de la partícula durante los primeros 20 segundos')
xlabel('x1(t)')
ylabel('x2(t)')
grid on
grid minor
