function [x, rh, it] = Biseccion (f, a, b, maxit, tol)
  fa = f(a);
  fb = f(b);
  if (fa*fb>0)
    error('No se cumple la regla de los signos.');
  endif
  it = 0;
  while (it < maxit)
    it++;
    x = a + (b-a)/2;
    fx = f(x);
    
    if (fx*fb < 0)
      rh(it) = max(abs([fx,b-x]));
      fa = fx;
      a = x;
    else
      rh(it) = max(abs([fx,x-a]));
      fb = fx;
      b = x;
    endif
    if (rh(it)<tol)
      break;
    endif
  endwhile
endfunction
