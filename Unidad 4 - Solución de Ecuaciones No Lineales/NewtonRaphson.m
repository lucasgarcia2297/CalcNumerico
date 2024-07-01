# Metodo de Newton-Raphson
function [x,rh,it,t] = NewtonRaphson(f,df,x0,kmax,tol)
tic();
it = 0;
fx=f(x0);
while it < kmax
  it++;
    x = x0 -(fx/df(x0));
    #fx0 = f(x0);
    fx = f(x);
    abs(fx);
    %rh(it) = max([abs(fx), abs((x-x0)/x)])
    rh(it) = abs(x-x0)/abs(x);  %error relativo
    %rh(it) = abs((x-x0));
    if rh(it) < tol 
      break;
    endif
    
    x0 = x;
    
endwhile
t =toc();
endfunction
