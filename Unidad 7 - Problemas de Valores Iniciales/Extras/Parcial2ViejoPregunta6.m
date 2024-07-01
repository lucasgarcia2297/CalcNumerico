clc; clear all;
format long g
%Parcial 2 Viejo [Ejemplo parcial 2.pdf]

#  fT = -cv - kx + F  --> #  fT = -cx' - kx + F

#c:coeficiente de amortiguamiento 
#k:constante del resorte
#x:posicion del objeto
#v:velocidad del objeto
#F:fuerza Externa.

#Segunda ley de Newton:
#fT = ma --> fT = m*x''(t) 

#z1 = x    | z1' = z2; 
#z2 = x'   | z2' = (-cx' - kx + F)/m   

m = 20;
k = 20;
c = 10;
F = 0;
x0 = [1 0]'; %un metro hacia la derecha

fT = @(t,x) [x(2,1);
            (-c*x(2,1) - k*x(1,1) + F)/m ];
L = 2000;
inter = [0,10];
[t,x] = RungeKutta4(fT,inter,x0,L);
x1 = x(:,1); %Posicion
v1 = x(:,2); %Velocidad

disp('Posicion a los 10 seg: ')
pos10seg = x1(end)

disp('Velocidad máxima alcanzada: ')
[~,pos] = max(abs(v1));
Vmax = v1(pos)    %v = -0.71
disp('La maxima velocidad alcanzada fue en t: ')
t_VMax = t(pos)   %t = 1.36

plot(t,v1,'r-')
grid on