clc; clear all; clf;
## TP7 - PVI
## Ejercicio 9

# {y''' +4y'' + 5y' + 2y = 5sin(t)-2cos(t)
# { y(0) = 1
# { y'(0) = 0
# { y''(0) = -1

#Cambio de Variable
# z1 = y    | { z1' = z2
# z2 = y'   | { z2' = z3
# z3 = y''  | { z3' = -4sen(t)-2cos(t)-4z3+ 5z2 -2z1 

#             {z1(0) = 1
#             {z2(0) = 0
#             {z3(0) = -1

#=====Inciso a)==========================================
L = 3000;

inter = [0,15];
f = @(t,z) [      z(2);
                  z(3);
           -4*sin(t)-2*cos(t)-4*z(3)-5*z(2)-2*z(1) ];
z0 = [1; 0; -1];
#========================================================
#=====Inciso b)==========================================
[t,x] = RungeKutta4(f,inter,z0,L);
plot(t,x(:,1),'r-')
hold on
grid on
plot(t,x(:,2),'g-')
plot(t,x(:,3),'b-')
          
% y = z1 ---> x(:,1)
pos = find(t == 2.5)        
y2_5 = x(pos,1);  %y(t)
disp('El valor de la variable de estado y en t = 2.5, es:')
disp(y2_5)  %  -0.801143
plot(t(pos),y2_5,'r*')
hold off
#========================================================
#=====Inciso c)==========================================
#Me fijo en la gráfica cuantas veces corta al eje x
# la curva verde que representa y'(t)
# corta al eje 5 veces en el intervalo [0,15]
#========================================================