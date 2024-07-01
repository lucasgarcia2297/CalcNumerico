function S = SimpsonCompuestoDatos (x, y)
  n = length(x); #tiene que ser impar
  h = (x(n)- x(1))/(n-1); %debe ser x espaciado
  
  S0 = y(1) + y(n);
  S1 = 0; %Suma de impares
  S2 = 0; %Suma de pares
  for i = 2:(n-1)
    r = mod(i,2);
    if r==0
      S1 = S1 + 4*y(i);
     else
      S2 = S2 + 2*y(i);
    endif
  endfor
  
  S = h*(S0+S1+S2)/3; 
  #Simpson compuesto:
  # I = (h/3)[f(x0) + f(xn) + 2*sum(f(xi pares)) + 4*sum(f(xi impares))]  
  #   = (h/3)[     S0       +        S1         +       S2           ]
endfunction
