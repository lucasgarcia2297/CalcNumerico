function [P,N] = ArmarPolinomioNewton (c,x)
  c=c';
  n = length(x);
  P = zeros(1,n);
  P(n) = c(1);
  N = zeros(n,n);
  N(1,n) = 1;
  for i=2:n
   N(i,n-i+1:n) =poly(x(1:i-1));
   P = P + c(i)*N(i,:);      
  endfor
endfunction
