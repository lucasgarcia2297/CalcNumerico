clear all; clc; clf;
#==================================INCISO B=====================================
#Funcion de Energia termica E(t):
E = @(t) ((t+1/3).^3+1/3).*e.^(-t);
#Primera derivada E'(t):
dE = @(t) e.^(-t).*(3*(t+1/3).^2-((t+1/3).^3+1/3));
#Segunda derivada E''(t):
ddE = @(t) e.^(-t).*(6*(t+1/3) - 6*(t+1/3).^2 + ((t+1/3).^3)+ 1/3);
#Intervalo de tiempo
t = linspace(0,14,100);

disp('Biseccion') %intervalo[1,3], maxit=100, tol = 1e-14
[x0, rhB, itB] = Biseccion (dE, 1, 3, 100, 1e-14); 
tiempoMAX_E = x0
maximaEnergia_B = E(x0)

disp('NewtonRaphson') %punto inicial p0 = 2, tol = 1e-14, maxit=100, tol = 1e-14
[rNR, rhNR, itNR] = NewtonRaphson(dE, ddE,2, 1e-14, 100);
tiempoMAX_E = rNR
maximaEnergia_NR = E(rNR)

figure(3)
plot(t,E(t),'b-',t,dE(t),'r-')
hold on
grid on
grid minor
plot(rNR,maximaEnergia_NR,'k*')
plot(rNR,0,'k*')
line([0,14],[0,0],'color','k')
line([rNR,rNR],[0,maximaEnergia_NR],'linestyle','-.','color','k')
hold off
xlabel('Tiempo')
Funciones = {"E(t)","E'(t)"};
legend(Funciones);
#===============================================================================
#---------Comparaciones de los métodos: Biseccion vs. Newton-Raphson------------
figure(4)
semilogy(rhB,'g-o')
hold on
grid on
semilogy(rhNR,'r-*')
hold off
%title('Tasa de Convergencia para el inciso B')
xlabel('Iteracion')
ylabel('Error de cada método')
Metodos = {'Biseccion','NewtonRaphson'};
legend(Metodos);
#-------------------------------------------------------------------------------

