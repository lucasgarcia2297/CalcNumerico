function [x] = Sustitucion_Atras (A)
  
  n = length(A(:,1));
  x = zeros(n,1);
  
  for i=n:-1:1
   x(i) = (A(i,n+1) - A(i,i+1:n)*x(i+1:n)) / A(i,i);   
  endfor

endfunction

