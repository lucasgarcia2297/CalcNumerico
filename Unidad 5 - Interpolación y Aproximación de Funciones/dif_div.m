function [c,dv] = dif_div (x,y)
  n = length(y);
  dv = zeros(n,n);
  dv(1:n,1) = y; %primera columna con los valores de la funcion
  for i = 2:n
    dv(1:n-i+1,i) = (dv(2:n-i+2,i-1) - dv(1:n-i+1,i-1)) ./  (x(i:n) - x(1:n-i+1));
  endfor
  c = dv(1,1:n)';
endfunction
