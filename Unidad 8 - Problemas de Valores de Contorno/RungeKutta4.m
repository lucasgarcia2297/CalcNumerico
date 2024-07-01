function [t,y] = RungeKutta4 (f,inter,y0,L)
%  funcion [t,y] = RungeKutta4(f,[t0 TF], y0, L)
%  Método de Runge-Kutta de orden 4 para resolver el PVI
%    {y' = f(t,y) en [t0,TF]
%    {y(t0) = y0
%  Usando L pasos
%  y0 puede ser vectorial o escalar

 t = linspace(inter(1),inter(2),L+1)';
 h = (inter(2)-inter(1))/L;
 
% Reservamos lugar en memoria para y
 y = zeros(length(y0),L+1);
 y(:,1)=y0;
 
 for i = 1:L
  k1 = h*f( t(i)     ,  y(:,i));
  k2 = h*f( t(i)+h/2 ,  y(:,i)+k1/2);
  k3 = h*f( t(i)+h/2 ,  y(:,i)+k2/2);
  k4 = h*f( t(i+1)   ,  y(:,i)+k3);
  
  y(:,i+1) = y(:,i) + (k1+2*k2+2*k3+k4)/6;  
 endfor
 y = y';
endfunction
