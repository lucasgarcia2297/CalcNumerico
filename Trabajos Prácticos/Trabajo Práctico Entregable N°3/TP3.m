clear all; clc;
# TP entregable 3
% { x1'(t) = -t*x2
% { x2'(t) = t*x1 - t*x2

#La f debo definirla como:
% x debo definirlo como un vector, en este caso de 2 componentes
a = 0; b = 20;
h = 0.05;
L = (b-a)/h %Calcularlo L = 400 para este caso
f = @(t,x) [-t*x(2)        ; 
             t*x(1) - t*x(2)];

y0 = [-1 1];

## --------------Inciso a)-------------------------
[t,x] = RungeKutta4(f,[a b],y0,L);
plot(x(:,1),x(:,2),'b-')
hold on
grid on
plot(x(1,1),x(1,2),'r*')
## -----------------------------------------------
## --------------Inciso b)-------------------------
a = 0; b = 5;
h = 5/200;
L = (b-a)/h;

[t,x] = RungeKutta4(f,[a b],y0,L);
x(end, :)
t(end) %t = 3
norm(f(t(end),x(end,:)))
plot(x(end,1), x(end,2), 'r*')
## -----------------------------------------------
## --------------Inciso d I)-------------------------
 
#df1 =?  %
#df2 =?

[Sx1,dSx1] = Funcion_Spline (t,x(:,1),0,0);
[Sx2,dSx2] = Funcion_Spline (t',x(:,2),0,0);

%g= @(x) sqrt(dSx1(x).^2+dSx2(x).^2) %ajuste de la aproximación . Debo integrar este ajuste

g= @(x) sqrt(dSx1(t).^2+dSx2(t).^2);

%[] = cuadratura_gauss
## -----------------------------------------------
## --------------Inciso e)-------------------------
d = sqrt(x(:,1).^2+x(:,2).^2)  %vector distancia al origen
pos = find(d<=0.01) %,pause %Busco el tiempo(?) en el que la posición es menor a esa distancia(?)
##d(pos-1)
##d(pos)
t(pos(1)) %es el instante buscado. 4.55 para L = 200, a= 0 b = 5 
figure(2)
plot(t,d,'r',t(pos(1)),d(pos(1))) %ver para qué distancia se valor es menor. 
hold on
R = 0.01;
tita = (0:0.01:2.01*pi);
x_c = R*cos(tita);
y_c = R*sin(tita);
plot(x_c,y_c,'-k')      %Grafica un circulo que determina la distancia que se pide (0.1)
##plot(t(pos(1)),d(pos(1)),'r*')

## -----------------------------------------------