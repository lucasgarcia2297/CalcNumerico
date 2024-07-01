clc; clear all;
#Parcial 2 Viejo [EJEMPLO PARCIAL 2]
#Ejercicio del pendulo con fluido que amortigua el desplazamiento
#q Representa a tetha en radianes 

#{q'' + f(q)q' + sen(q) = 0  t>=0;

#Amortiguamiento está dado por:
#f(q) = {0.8 , si |q|<q0,
#       {  0 , si |q|>=q0.
#Donde q0 es el ángulo a partir del cual el péndulo toca
# el fluido y que satiface L*cos(q0) = h

#=======Datos==========
L = 1; %Longitud del péndulo
h = 3/4; %altura hasta el líquido
v0 = 0; %Parte del reposo
qini= pi/2; %Posición Inicial (horizontal a la derecha)
#No confundir qini con q0 que es cuando toca el fluido

#Armo el sistema:
#q'' = -f(q)q' - sen(q)
#qini = pi/2
#qini' = 0;

#z1 = q1    | z1' = z2
#z2 = q1'   | z2' = -f(q)q' - sen(q)
 
#Condiciones iniciales
cond_iniciales = [qini v0]';

q0 = acos(h/L);
#Amortiguamiento
fAmort = @(q) (0.8).*(abs(q)<q0);

F = @(t,q) [  q(2,1);
            -fAmort(q(1,1))*q(2,1)-sin(q(1,1))];

inter = [0, 5];
N = 5000; %Cantidad de Subintervalos
[t,q] = RungeKutta4(F,inter, cond_iniciales, N);
qP = q(:,1);  %Angulos del pendulo
vP = q(:,2);  %Velocidades angulares del pendulo

q_t5 = qP(end)  %Respuesta segun el cuestionario q=-0.12505 (con un error menor a 10e-3)



#x = -0.12505 determina el angulo del pendulo en t=5segundos
#Ver la gráfica para determinar el tiempo en t=3.28 uando cambia la direccion el pendulo
#Gráfica
plot(t,q(:,1),'r-') 
hold on
grid on
plot([0 5],[0.8 0.8],'k')
plot([0 5],[-0.8 -0.8],'k')
hold off


