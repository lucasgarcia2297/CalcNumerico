clear all; clc; clf;
##TP7 - Ejercicio 6
clear all
clc;clf
%Cuando el método es consistente y Estable ==> converge

inter = [0,1];
%h = 0.2; 
%h = 0.1;
 h = 0.05;
L = (inter(2)-inter(1))/h;
t = linspace(inter(1),inter(2),L+1)';
format long g
% planteamos el PVI
f = @(t,y) t*exp(3*t) - 2*y;
y0 = 0; # valor inicial

%Datos para Euler Hacia Atras y CranckNicholson
maxit = 1000;
tol = 1e-10;
dfy = @(y) -2;
%============================================================
# Solución analitica o Exacta
fex=@(t) (t.*exp(3*t))/5 - (exp(3*t))/25 + (exp(-2*t))/25;
fex = fex(t);
fexF=fex(end); %Valor en el punto final;
disp('Valor en el punto final-Solucion Exacta:')
disp(fexF)

# graficamos la exacta
figure(1)
grid on
hold on
plot(t,fex,'k-d')
%============================================================
% Solucion numerica con Euler Hacia Adelante
[tEAdel,yEAdel]=Euler(f,inter(1),inter(2) ,y0,L);

plot(tEAdel,yEAdel,'b-o')
grid on
grid minor
% valor al final 
yEAdelF=yEAdel(end); %Valor en el punto final;
disp('Valor en el punto final-Euler hacia Adelante:')
disp(yEAdelF)

%============================================================
%============================================================
% Solucion numerica con Euler Hacia Atrás
[tEAtras,yEAtras]=[t,w] = Euler_hacia_atras (f,dfy,inter(1),inter(2),y0,L,maxit,tol)

plot(tEAtras,yEAtras,'r-*')
grid on
grid minor
% valor al final 
yEAtrasF = yEAtras(end); %Valor en el punto final;
disp('Valor en el punto final-Euler hacia Atrás:')
disp(yEAtrasF)

%============================================================
%============================================================
% Solucion numerica con Crank-Nicholson
[tCN,yCN] = Crank_Nicholson_Newton (f, dfy, inter(1), inter(2), y0, L, maxit, tol)

plot(tCN,yCN,'g-x')
grid on
grid minor
% valor al final 
yCNF=yCN(end); %Valor en el punto final;
disp('Valor en el punto final-Cranck-Nicholson:')
disp(yCNF)

%============================================================

disp('Soluciones en el punto Final')
disp('                Exacta     -      ForwardEuler     -     BackwardEuler     -     CranckNicholson')
Soluciones=[fexF yEAdelF yEAtrasF yCNF]
ErrorEulerAdelante = abs(fexF - yEAdelF)
ErrorEulerAtras = abs(fexF - yEAtrasF)
ErrorCranckNicholson = abs(fexF - yCNF)