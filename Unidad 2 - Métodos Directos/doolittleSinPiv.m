function [L,U] = doolittleSinPiv (A)
  n = length(A(1,:));
  L = eye(n);
  for k = 1:n;
    m = A(k+1:n,k) / A(k,k);
    L(k+1:n,k) = m;
    A(k+1:n,k:n) = A(k+1:n,k:n) - m*A(k,k:n);
  endfor
  U = A;
endfunction
