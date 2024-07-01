%Script 2 para item (b) y (c)
clear all; clc;
f = @(t,x) [-t*x(2);
            t*(x(1)-x(2))];
x0 = [-1;1];

#----------------------------inciso b)-----------------------------------
a = 0;
b = 3;
h = 0.1;
L = (b-a)/h   %L = 30
[t_RK4, x_RK4] = RungeKutta4(f,[a b],x0,L); 
x1_t3 = x_RK4(end,1)                  %Posición en x1 para t=3s
x2_t3 = x_RK4(end,2)                  %Posición en x2 para t=3s
v = norm([-3*x2_t3; 3*x1_t3-3*x2_t3]) %Rapidez en t=3s
#------------------------------------------------------------------------
#----------------------------inciso c)-----------------------------------
%Para ver cuantos digitos correctos tienen los valores anteriores
% variamos el L, cuanto mas grande sea mas preciso será el 
% resultado, compararemos cuantos digitos coinciden con los 
% resultados anteriores.
for i=1:50
  h = 1/i
  L = (b-a)/h
  
  [t_RK4, x_RK4] = RungeKutta4(f,[a b],x0,L); 
  x1_t3 = x_RK4(end,1)                    %Posición en x1 para t=3s
  x2_t3 = x_RK4(end,2)                    %Posición en x2 para t=3s
  v = norm([-3*x2_t3; 3*x1_t3-3*x2_t3])   %Rapidez en t=3s
endfor
#-------------------------------------------------------------
