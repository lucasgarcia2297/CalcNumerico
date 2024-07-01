function [x,y] = EulerSistemaEDO (f,a,b,y0,N)
# f debo definirla como una "matriz" [ f1(t,x) ; f2(t,x); ...]

  h = (b-a)/N;
  x = linspace(a,b,N+1)';
  y = zeros(length(y0),N+1);
  y(:,1) = y0;
  for i = 1:N
     y(:,i+1) = y(:,i) + h*f(x(i),y(:,i));
  endfor;
  y = y';
endfunction
% Para que Runge Kutta tambine funcione ´para sistemas
% debo agregarle los dos puntitos a la y. 