function [x, w] = AdamsMoulton_Ord4(f, x0, xn, y0, N)
h = (xn-x0)/N;
x = [x0:h:xn];
w = zeros(1,N+1);
w(1) = y0;
w(2) = w(1) + h*f(x(1),w(1));
w(3) = w(2) + h*f(x(2),w(2));
w(4) = w(3) + h*f(x(3),w(3));
w(5) = w(4) + h*f(x(4),w(4));
for i=4:N
f0 = f(x(i),w(i));
f1 = f(x(i-1),w(i-1));
f2 = f(x(i-2),w(i-2));
f3 = f(x(i-3),w(i-3));
fm1 = f(x(i+1),w(i+1));
w(i+1) = w(i) + h/720*(251*fm1 + 646*f0 - 264*f1 + 106*f2 - 19*f3);
endfor
endfunction