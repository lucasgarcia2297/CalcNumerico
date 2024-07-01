clc; clear all;
#Ejercicio Viejo de Parcial 2 
# 2 resortes conectados uno del otro

#Constantes
m1 = 1; m2 = 3;
k1 = 3; k2 = 4;
m = [m1 m2];
k = [k1 k2];
#{m1*x1''(t) = F1 + F2
#{m2*x2''(t) = F3

#F1 = -k1*x1
#F2 = k2*(x2-x1)
#F2 = -k2*(x2-x1)

#Despejo las x''
#{x1''(t) = -(k1/m1)*x1 + (k2/m1)*(x2-x1);
#{x2''(t) = -(k2/m2)*(x2-x1)

#condiciones iniciales:
xi1 = 0; xi2=0;
vi1 = 1; vi2 = 1;  %ambos con la misma velocidad inicial hacia la derecha (+)
x0 = [xi1 vi1 xi2 vi2]';

F1 = @(x) -k(1)*x(1);
F2 = @(x) k(2)*(x(2)-x(1));
F3 = @(x) -k(2)*(x(2)-x(1));

#z1 = x1      | z1' = z2 -->x1'
#z2 = x1'     | z2' = -(k(1)/m(1))*x(1) + (k(2)/m(1))*(x(2)-x(1))
#z3 = x2      | z3' = z4 -->x2'
#z4 = x2'     | z4' = -(k(2)/m(2)).*(x(2)-x(1))

#             {z1(0) = x1
#             {z2(0) = v1
#             {w1(0) = x2
#             {w2(0) = v2 

f = @(t,z) [     z(2,1);   %z2 = z1'
              -(k(1)/m(1))*z(1,1) + (k(2)/m(1))*(z(3,1)-z(1,1)); %z2'; 
                 z(4,1);
             -(k(2)/m(2))*z(3,1)+(k(2)/m(2))*z(1,1)];

inter = [0, 20]; %t de 0 hasta 20segundos
L = 2000;
[t,x] = RungeKutta4(f,inter,x0,L);

#Posiciones de la masa 1 en t
x1 = x(:,1);
#Velocidad de la masa 1 en t
v1 = x(:,2);

#Posiciones de la masa 2 en t
x2 = x(:,3);
#Velocidad de la masa 2 en t
v2 = x(:,4);

%Gráfica de la masa1
figure(1)
%Posicion
plot(x1,t,'r-')
hold on
grid on
%Velocidad
plot(v1,t,'b-')
hold off

%Gráfica de la masa2
figure(2)
%Posicion
plot(x2,t,'g-')
hold on
grid on
%Velocidad
plot(v2,t,'m-')
hold off

%Velocidades
figure(3)
plot(t,v1, 'r-', t, v2,'b') %Apenas aplico la velocidad se empieza a frenar 
grid on

posm1 = x1(end) %posicion de m1 en t=20 --> 0.839784731529875 con L=2000
posm2 = x2(end) %posicion de m2 en t=20 --> 1.490273495552807 con L=2000
%Respuestas con 6 cifras DECIMALES exactas: 
##Posición del primer objeto: 0.839785  (izquierda a derecha) (redondeo en el ultimo valor)
##Posición del segundo objeto: 1.490273 (derecha a izquierda) (redondeo en el ultimo valor)




