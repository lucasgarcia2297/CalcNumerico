clear all; clc;
## TP7 - PVI
## Ejercicio 2:

#{ y'   = -y+sen(t)+cos(t)    [0<=t<=2]
#{ y(0) = 0

#Primero veo si se cumple el teorema de existencia y unicidad
% |df(t,y)/dy | <= L   (constante de Lipschitz)

f = @(t,y) -y+sin(t)+cos(t);
y0 = 0;
a = 0;
b = 2;
cant = 6;
tE = zeros(cant,1);
yE = zeros(cant,1);
tRK4 = zeros(cant,1);
yRK4 = zeros(cant,1);

M = zeros(cant,5);
N = zeros(cant,4);
for i = 0:cant-1
  h(i+1) = 1/((2^i)*10);
  L(i+1) = (b-a)/h(i+1);  
  [tE,yE] = Euler(f,a,b,y0,L(i+1));
##  yE2 = yE(2);
  [tRK2,yRK2] = RungeKutta2 (f,[a b],y0,L(i+1));
##  yRK22 = yRK2(2);
  [tRK4,yRK4] = RungeKutta4 (f,[a b],y0,L(i+1));
##  yRK42 = yRK4(2);
  indx = find(tE==2,1);
  N(i+1,:) = [indx tE(indx) tRK2(indx) tRK4(indx)];
  M(i+1,:) = [h(i+1) L(i+1) yE(indx) yRK2(indx) yRK4(indx)]
endfor
h = h';
L = L';
[tE tRK2 tRK4 yE yRK2 yRK4];

%[tO23,yO23] = ode45(f,[a b],y0);
%plot(tO23,yO23,'k-');
%hold on
[tE,yE] = Euler(f,a,b,y0,L(1));
plot(tE,yE,'r-');
hold on
[tRK2,yRK2] = RungeKutta2 (f,[a b],y0,L(1));
plot(tRK2,yRK2,'b-')
[tRK4,yRK4] = RungeKutta4 (f,[a b],y0,L(1));
plot(tRK4,yRK4,'g-')
hold off