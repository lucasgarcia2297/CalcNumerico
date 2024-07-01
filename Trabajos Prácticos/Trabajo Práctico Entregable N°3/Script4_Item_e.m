clear all; clc;
#Script 4 para el item (e):
f = @(t,x) [-t*x(2);
             t*(x(1)-x(2))];
x0 = [-1;1];
h = 0.01;
a = 0;
b = 20;
L = (b-a)/h

[t_RK4, x_RK4] = RungeKutta4(f,[a b],x0,L);

dist_origen = norm(x_RK4,'rows')  %Equivale a: sqrt(x_RK4(:,1).^2+x_RK4(:,2).^2)

pos = find(dist_origen<=0.01); %Encuentra el indice (pos) en el que la distancia al origen es menor o igual a 0.01 
t_RK4(pos(1))
figure(2)
plot(x_RK4(:,1),x_RK4(:,2),'r-', "linewidth",1);  %Gráfica de la trayectoria (x1(t),x2(t))
hold on;
plot(x_RK4(pos(1)-1,1),x_RK4(pos(1)-1,2),'xg',"linewidth",1); %marca con una X un instante antes
                                                               % de llegar a la distancia de 0.01
plot(x_RK4(pos(1),1),x_RK4(pos(1),2),'xb',"linewidth",1); %marca un instante despues para el cuál la
                                                          % distancia es menor a 0.01
title('Trayectoria de la partícula')
xlabel('x1(t)')
ylabel('x2(t)')

R = 0.01;
tita = (0:0.01:2.01*pi);
x_c = R*cos(tita);
y_c = R*sin(tita);
plot(x_c,y_c,'-k')      %Grafica un circulo encerrando la distancia que se pide (0.01) respecto al origen.
grid on
grid minor
pos(1)     %Primera posición en la que dist_origen<=0.01
t_RK4(pos(1)-1) %Valor antes de llegar a una distancia de 0.01 del origen
t_RK4(pos(1))  %Valor buscado. t aproximadamante 4.54 seg
