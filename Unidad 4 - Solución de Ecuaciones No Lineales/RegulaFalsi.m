function [x, rh, t] = RegulaFalsi(f, xmin, xmax, kmax, tol)
  tic();
  it = 0;
  fxmax = f(xmax);
  fxmin = f(xmin);
  if sign(fxmax)*sign(fxmin) > 0
    error(' Los limites del intervalo medidos en f son del mismo signp');
  endif
  
  while it < kmax
    x = xmax - fxmax*(xmax - xmin)/(fxmax - fxmin);
    fx = f(x);
    rh(it+1) = abs(fx);
    if rh(it+1) < tol && abs(x - xmax) < tol
      break;
    endif
    
    if sign(fx)*sign(fxmin) > 0
      fxmin = fx;
      xmin = x;
     else
      fxmax = fx;
      xmax = x;
    endif
    it++;
  endwhile
  t = toc();
endfunction