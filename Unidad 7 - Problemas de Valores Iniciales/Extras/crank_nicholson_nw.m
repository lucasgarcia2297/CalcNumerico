function [x, w]=crank_nicholson_nw(f, dfy, x0, xn, alpha, N, maxit, tol)
h = (xn-x0)/N;
x = [x0:h:xn]';
w = zeros(N+1,1);
w(1) = alpha;
for i=1:N
w0 = w(i);
fi = f(x(i),w(i));
for it=1:maxit
fim1 = f(x(i+1),w0);
dfim1 = dfy(x(i+1),w0);
g = w0 - w(i) - h*0.5*(fi + fim1);
dg = 1 - h*0.5*dfim1;
w(i+1) = w0 - g/dg;
if (abs(w(i+1)-w0) < tol)
break;
end %if
w0 = w(i+1);
end %for
w(i+1) = w(i) +(h/2)*( fi + f(x(i+1),w(i+1)));
end %for
end %function