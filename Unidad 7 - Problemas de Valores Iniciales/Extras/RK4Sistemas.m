function [t,u] = RK4Sistemas(f,t,u0)
%RK4Sistemas udtiliza el metodo de Runge-Kutta para resolver un sistema de
% ecuaciones de primer orden (ODE) de la forma u' = f(t,u), cuyas condiciones
% iniciales deben incorporarse al vector u0.
%
% u = RK4Sistemas(f,t,u0)
%
% f es una función (vector m-dimensional) y esta representado por:
% n: cantidad de ecuaciones,  m: cantidad de puntos
%   f = @(t,u) [ f1(u1,u2,...un,t); f2(u1,u2,...un,t);... fm(u1,u2,...un,t)]; 
% por ejemplo donde las ui son la variables dependientes y t la independiente.

% t: es un vector (n+1-dimensional) que representa la discretizacion.

% u0 es un vector m-dimensional, con un valor inicial por cada ecuacion
% u: es una matriz de resultados (m x n+1 dimensional) donde cada fila represena
% una variable y donde cada columna es el vector solucion estimado en cada punto
% de la malla.

u(:,1) = u0;
% la primera columna son los valores iniciales (datos)
h = t(2) - t(1);
% en forma vectorial:
  for i = 1:length(t)-1,
      k1 = f(t(i),u(:,i));
      k2 = f(t(i)+h/2,u(:,i)+h*k1/2);
      k3 = f(t(i)+h/2,u(:,i)+h*k2/2);
      k4 = f(t(i)+h,u(:,i)+h*k3);
      
      u(:,i+1) = u(:,i)+h*(k1+2*k2+2*k3+k4)/6;
end
