clear all; clc; clf;
#TP7 - PVI
#Ejercicio 11

#{ (t^2)y'' - 2ty' + 2y = (t^3)ln(t)  1<=t<=2
#{ y(1) = 1
#{ y'(1) = 0

%y'' = (2/t)y' - (2/(t^2))y + tln(t)  --> divido todo por (t^2) y despejo y''

#{ y'' = (2/t)y' - (2/(t^2))y + tln(t)
#{ y(1) = 1
#{ y'(1) = 0
#Cambio de Variable
# z1 = y    | { z1' = z2
# z2 = y'   | { z2' = (2/t)z2 - (2/(t^2))z1 + tln(t)

#             {z1(1) = 1
#             {z2(1) = 0

#=================Armo el sistema===================
f = @(t,y) [          y(2,1);             #y(2,1) = y'1
            (2/t)*y(2,1) - (2/(t^2))*y(1,1) + t*log(t)];
#condiciones iniciales
y0 = [1; 0];
#=====================================================
a = 1; b = 2;
inter = [a b];
h = 0.2;
h = 0.1;
h = 0.05;
t = a:h:b;
L = length(t)-1

#Solucion exacta
fex = @(t) (7/4).*t + (1/2)*(t.^3).*log(t) - (3/4)*t.^3;


#==========Solucion====================================================================================
#con Predictor Corrector de AdamsBashford y AdamsMoulton orden 4, con primeros 4 pasos con runge-kutta4

yPC = AdamsBashfortMoulton (f,t,y0);

#Cálculo con runge-Kutta (solo para comparar- no lo pide el ejercicio)
[~,yrk4] = RungeKutta4 (f,inter,y0,L);

figure(1)
plot(t,yPC(1,:),'r-o')
hold on
plot(t,fex(t),'g-*-')
plot(t,yrk4(:,1),'b-o')

title('Ejercicio 11')
xlabel('Tiempo')
ylabel('Y')
legend('solucion PC','solucion exacta','RungeKutta4')
grid on
grid minor
hold off


Error = abs(yPC(1,:) - fex(t));
figure(2)
semilogy(t,Error,'b-*')
title('Error')
xlabel('Tiempo')
ylabel('y')
grid on
grid minor

f(t(end),y0)