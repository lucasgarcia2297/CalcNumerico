function [x, w] = CN_new(f,dfy,x0,xn,y0,N,maxit,tol)
h = (xn-x0)/N;
x = [x0:h:xn];
w = zeros(1,N+1);
w(1) = y0;
for i=1:N
w0 = w(i);
f = f(x(i),w(i));
for it = 1:maxit
fm1 = f(x(i+1),w0);
dfm1 = dfy(x(i+1),w0);
g = w0 - w(i) - h*0.5*(f + fm1);
dg = 1 - h*0.5*dfm1;
w(i+1) = w0 - g/dg;
if (abs(w(i+1)-w0) < tol)
break;
endif
w0 = w(i+1);
endfor
w(i+1) = w(i) + h/2*( f + f(x(i+1),w(i+1)));
endfor
%endfunction