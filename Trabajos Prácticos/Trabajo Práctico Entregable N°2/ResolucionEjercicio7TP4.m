clear all; clc; clf;
#Funcion de Energia termica E(t):
E = @(t) ((t+1/3).^3+1/3).*e.^(-t);
#Primera derivada E'(t):
dE = @(t) e.^(-t).*(3*(t+1/3).^2-((t+1/3).^3+1/3));
#Segunda derivada E''(t):
ddE = @(t) e.^(-t).*(6*(t+1/3) - 6*(t+1/3).^2 + ((t+1/3).^3)+ 1/3);

#Intervalo de tiempo
t = linspace(0,14,100);

#Gráfica de E(t) y sus derivadas respecto al tiempo:
figure(1)
plot(t,E(t),'g');
grid on
hold on
plot(t,dE(t),'b');
plot(t,ddE(t),'r');
line([0,14],[0,0]);
xlabel('Tiempo t');
ylabel('Energía térmica');
hold off
Metodos = {'Función E(t)','1era Derivada de E(t)','2da Derivada de E(t)'};
legend(Metodos);
#--------------------------------------------------------
#==================================INCISO A=====================================
#Punto a) Momentos en los que la E(t) = 1.5:
f = @(t) E(t) - 1.5; %funcion auxiliar f(t) = E(t) - 1.5
tol = 1e-9;
kmax = 100;
disp('Biseccion, NewtonRaphson - RAIZ 1')
%Aplicamos primero Biseccion y luego NewtonRaphson: 
%tic();
[x0_r1, rhB_r1, itB_r1] = Biseccion (f, 0, 2, 3, 1e-4);
%x0_r1  %Valor inicial para NewtonRaphson
%itB_r1  %Cantidad de iteraciones con Biseccion
[r1, rhNR_r1, itNR_r1] = NewtonRaphson(f, dE,x0_r1, tol, kmax);
%t1 = toc();
Tiempo_t1 = r1   %Valor buscado t1 donde E(t1) = 1.5
rh1 = [rhB_r1,rhNR_r1];
%itNR_r1 %Cantidad de iteraciones con NewtonRaphson para Raiz 1
%t1

disp('Biseccion, NewtonRaphson - RAIZ 2')
%tic();
[x0_r2, rhB_r2, itB_r2] = Biseccion (f, 2, 5, 3, 1e-4);
%x0_r2  %Valor inicial para NewtonRaphson
%itB_r2  %Cantidad de iteraciones con Biseccion
[r2, rhNR_r2, itNR_r2] = NewtonRaphson(f, dE,x0_r2, tol, kmax);
%t1 = toc();
Tiempo_t2 = r2
rh2 = [rhB_r2,rhNR_r2];
%itNR_r2 %Cantidad de iteraciones con NewtonRaphson para Raiz 2
%t1

#Gráfica de la funcion E(t):
figure(2)
plot(t,E(t));
grid on
hold on
%line([0,14],[1.5,1.5]);
plot(r1,1.5,'*',r2,1.5,'*')
title('Grafica de E(t) marcando los valores cuando E(t)=1.5')
xlabel('Tiempo t');
ylabel('Energía térmica E(t)')
hold off;
#===============================================================================

#==================================INCISO B=====================================
disp('Biseccion')
[x0, rhB, itB] = Biseccion (dE, 1, 3, 100, 1e-14);
tiempoMAX_E = x0
maximodeE_B = E(x0)
%tic();
itB
%disp('Biseccion y NewtonRaphson')
%[x0, rhB1, itB] = Biseccion (dE, 1, 3, 3, 1e-4);
%x0
%itB
%[rBNR, rhNR1, itNR1] = NewtonRaphson(dE, ddE,x0, tol, kmax);
%t1 = toc();
%maximodeE_BNR = rBNR
%rhBNR = [rhB1,rhNR1];
%it
%t1

disp('NewtonRaphson')
tic()
[rNR, rhNR, itNR] = NewtonRaphson(dE, ddE,2, tol, kmax);
t2 = toc();
tiempoMAX_E = rNR
maximodeE_NR = E(rNR)
itNR
%t2
#===============================================================================

#==================================INCISO C=====================================
disp('Secante para el punto c')
tic()
[maximodeDDE, rh, it] = Secante (ddE, 0, 2, kmax, tol)
t2 = toc();
maximodeDDE
%it
%t2
#===============================================================================

#==================COMPARACION DE METODOS PARA EL INCISO B======================
figure(3)
semilogy(rhB,'g-o')
hold on
grid on
semilogy(rhNR,'r-*')
%semilogy(rh2,'c--s')
%semilogy(rhN2,'r-diamond')
hold off
title('Tasa de Convergencia para el inciso B')
xlabel('Iteracion')
ylabel('rh de cada método')
Metodos = {'Biseccion','NewtonRaphson'};
legend(Metodos);

%figure(4)
%semilogy(rh2,'g-o')
%hold on
%grid on
%semilogy(rhN2,'r-*')
%hold off
%title('Tasa de Convergencia para la raiz 2')
%xlabel('Iteracion')
%ylabel('rh de cada método')
%Metodos = {'Biseccion y NewtonRaphson','NewtonRaphson'};
%legend(Metodos);

