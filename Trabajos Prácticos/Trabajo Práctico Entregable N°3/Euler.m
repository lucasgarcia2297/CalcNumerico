function [t, y] = Euler (f,inter,y0,L)
%  funcion [t,y] = Euler(f,[t0 TF], y0, L)
%  Método de Euler para resolver el PVI de Orden 1
%    {y' = f(t,y) en [t0,TF]
%    {y(t0) = y0
%  Usando L pasos
%  y0 puede ser vectorial o escalar

 t = linspace(inter(1),inter(2),L+1)';
 h = (inter(2)-inter(1))/L;
 
% Resevamos lugar en memoria para y
 y = zeros(length(y0),L+1);
 y(:,1)=y0;
 for i = 1:L
   y(:,i+1) = y(:,i) + h*f(t(i),y(:,i));
 endfor
 y = y';
endfunction
