function Q = Cuadratura_Gauss_Comp (f,a,b,L,n)
  [xg,w] = Gauss_xw(n);
  
  x = linspace(a,b,L+1);
  h=(b-a)/L;
  Q = 0;
  for i=1:L
    t = h/2*(xg+1)+x(i);
    Q += h/2*(w'*f(t));
  endfor
  
endfunction
