function [x, rh, it] = NewtonRaphson(f, df, x0, tol, kmax)
  it = 0;
  while it<kmax
    it+=1;
    x = x0 - f(x0)/df(x0);
    rh(it) = abs(x-x0);
    if rh(it)<tol;  
      break;
    endif
    x0 = x;
  endwhile
endfunction

