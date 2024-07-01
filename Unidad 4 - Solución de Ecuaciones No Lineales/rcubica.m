function [x] = rcubica (a,xa,xb)
  
  f = @(x) x.^3 -a;
  maxit = 1000;
  tol = 1e-5;
  [p] = biseccion(f,xa,xb,maxit,tol);
   x = p;
endfunction
