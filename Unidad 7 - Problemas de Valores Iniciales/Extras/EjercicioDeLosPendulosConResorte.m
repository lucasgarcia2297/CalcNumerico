clear all; clc;
#Ejercicio de parcial:
#2 pendulos con un resorte entre entre la masa m1 y la masa m2

# { m1x1'' = (-(m1g)/l)x1 - k(x1 - x2)
# { m2x2'' = (-(m2g)/l)x2 + k(x1 - x2)

# { x1'' = (-g/l)x1 - k(x1 - x2)/m1
# { x2'' = (-g/l)x2 + k(x1 - x2)/m2

#z1 = x1    | z1' = x1' = z2
#z2 = x1'   | z2' = x1'' = (-g/l)z1 - k(z1 - z3)/m1
#z3 = x2    | z3' = x2' = z4
#z4 = x2'   | z4' = x2'' = (-g/l)z3 + k(z1 - z3)/m2

#Datos:
g = 9.81; %Aceleración de la gravedad [m/s^2]
l = 1;    %longitud de los pendulos   [m]
m1 = 3;   %Masa del objeto 1 [kg]
m2 = 3;   %Masa del objeto 2 [kg]
k = 2;    %Constante del resorte

#Sistema con el cambio de variable:
f = @(t,z) [ z(2,1);
             (-g/l)*z(1,1) - (k*(z(1,1) - z(3,1)))/m1;
              z(4,1);
             (-g/l)*z(3,1) + (k*(z(1,1) - z(3,1)))/m2;
            ];
#Condiciones inciales:
x1ini = 0; x2ini = 3;   %posiciones iniciales
v1ini = 0; v2ini = 0;   %velocidades iniciales
c0 = [x1ini v1ini x2ini v2ini]';

#tiempo [inicial, final]
ti = 0; tf = 20;
inter = [ti ; tf];

#Subintervalos para el calculo:
L = 3000;

#Solucion S con RungeKutta4(funcion, intervaloDeTiempo, CondicionesIniciales, CantidadDeSubintervalosTomados)
[t, S] = RungeKutta4(f, inter, c0 ,L);
x1 = S(:,1);
v1 = S(:,2);
x2 = S(:,3);
v2 = S(:,4);


#Gráfica
figure(1)
d = 10; %distancia entre los objetos. solo para interpretar mejor la gráfica 

#Movimientos
plot(x1,t,'r-',x2+d,t,'b-')
hold on
grid on
#Velocidades
plot(v1,t,'m-',v2+d,t,'g-')
legend("x1","x2","v1","v2")
hold off