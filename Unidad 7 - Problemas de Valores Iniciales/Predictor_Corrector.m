function [x, w]= Predictor_Corrector (f, x0, xn, y0, N)
  h = (xn - x0)/N;
  x = linspace(x0,xn,N+1);
  w = zeros(1,N+1);
  w(1) = y0;
  w(2) = w(1) + h*f(x(1),w(1));
  w(3) = w(2) + h*f(x(2),w(1));
  w(4) = w(3) + h*f(x(3),w(3)); %Primer Predictor_Corrector
  
  for i = 3:N-1
    f0 = f(x(i),w(i));
    f1 = f(x(i-1),w(i-1));
    f2 = f(x(i-2),w(i-2));
    fm1 = f(x(i+1),w(i+1));
    
    #Corrector
    w(i+1) = w(i) + h/24*(9*fm1 + 19*f0 - 5*f1 + f2);
    #Predictor de la siguiente iteración
    w(i+2) = w(i+1) + h/24*(55*fm1 - 59*f0 + 37*f1 - 9*f2);
  endfor
  fm1 = f(x(N+1),w(N+1));
  w(N+1) = w(N) + h/24*(9*fm1 + 19*f0 - 5*f1 + f2);
endfunction
