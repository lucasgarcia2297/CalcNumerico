function [x, w]=AdamsBashford_Ord2(f, x0, xn, y0, N)
h = (xn-x0)/N;
x = [x0:h:xn];
w = zeros(1,N+1);
w(1) = y0;
w(2) = y0 + h*f(x(1),y0);
for i=2:N
f0 = f(x(i),w(i));
f1 = f(x(i-1),w(i-1));
w(i+1) = w(i) + h*0.5*(3*f0 - f1);
endfor
endfunction
