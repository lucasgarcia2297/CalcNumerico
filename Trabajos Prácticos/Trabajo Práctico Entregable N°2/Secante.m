function [x, rh it] = Secante (f, x0, x1, kmax, tol)
  it = 0;
  fx0 = f(x0);
  fx1 = f(x1);
  
  if sign(fx0)*sign(fx1)>0
    error ('Los limites del intervalo medido en f son del mismo signo');    
  endif
  
  while (it<kmax)
    it++;
    x = x1 - fx1*(x1 - x0)/(fx1 - fx0);
    fx = f(x);
    rh(it) = abs(fx);
    if rh(it)< tol && abs(x - x1) <tol
      break;
    endif
    fx0 = fx1;
    fx1 = fx;
    x0 = x1;
    x1 = x;
  endwhile
endfunction
