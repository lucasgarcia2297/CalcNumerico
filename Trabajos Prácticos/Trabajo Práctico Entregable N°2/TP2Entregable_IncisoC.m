clear all; clc; clf;
#==================================INCISO C=====================================
#Primera derivada E'(t):
dE = @(t) e.^(-t).*(3*(t+1/3).^2-((t+1/3).^3+1/3));
#Segunda derivada E''(t):
ddE = @(t) e.^(-t).*(6*(t+1/3) - 6*(t+1/3).^2 + ((t+1/3).^3)+ 1/3);

#Intervalo de tiempo
t = linspace(0,14,100);

disp('M. Secante para el punto c')
%[raiz,error, iteraciones] = Secante(funcion, x0, x1, iteracion_max, tolerancia)
[r, rh, it] = Secante (ddE, 0, 2, 100, 1e-14);
tiempo = r
maximaRazondeCambiodeE = dE(r)

figure(3)
plot(t,dE(t),'r-',t,ddE(t),'m-')
hold on
grid on
grid minor
plot(r,maximaRazondeCambiodeE,'*k',r,0,'*k')
line([0,14],[0,0],'color','k')
line([r,r],[0,maximaRazondeCambiodeE],'linestyle','-.','color','k')
hold off
xlabel('Tiempo')
Funciones = {"E'(t)","E''(t)"};
legend(Funciones);
#===============================================================================

