function [T,c] = Tc_GaussSeidel(A, b)
 
  U = -triu(A,1);
  DLinv = inv(tril(A));
  
  T = DLinv*(U);
  c = DLinv*b;
  
endfunction
