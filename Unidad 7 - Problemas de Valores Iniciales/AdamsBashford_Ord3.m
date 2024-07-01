function [x, w] = AdamsBashford_Ord3(f, x0, xn, y0, N)
h = (xn-x0)/N;
x = [x0:h:xn];
w = zeros(1,N+1);
w(1) = y0;
w(2) = w(1) + h*f(x(1),w(1));
w(3) = w(2) + h*f(x(2),w(2));
for i=3:N
f0 = f(x(i),w(i));
f1 = f(x(i-1),w(i-1));
f2 = f(x(i-2),w(i-2));
w(i+1) = w(i) + (h/12)*(23*f0 - 16*f1 + 5*f2);
endfor
endfunction