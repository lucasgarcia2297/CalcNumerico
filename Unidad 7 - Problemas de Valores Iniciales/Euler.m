function [x,y] = Euler(f,a,b,y0,n)
  h = (b-a)/n;
  x = linspace(a,b,n+1)';
  y = zeros(n+1,1);
  y(1) = y0;
  for i = 1:n
     y(i+1) = y(i) + h*f(x(i),y(i));
  endfor;
endfunction;