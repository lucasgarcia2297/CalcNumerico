function [t,w] = Euler_hacia_atras (f,dfy,a,b,y0,N,maxit,tol)
  h = (b-a)/N;
  t = [a:h:b]';
  w = zeros(1,N+1)';
  w(1) = y0;
  for i=1:N
    w0 = w(i);
    for it=1:maxit
      fm1 = f(t(i+1),w(i+1));
      dfm1 = dfy(t(i+1),w(i+1));
      g = w0 - w(i) - h*fm1;
      dg = 1 - h*dfm1;
      w(i+1) = w0 - g/dg;
      
      if (abs(w(i+1)-w0) < tol)
        break;
      endif
      w0 = w(i+1);
    endfor
    w(i+1) = w(i) + h*f(t(i+1),w(i+1));
  endfor
endfunction
