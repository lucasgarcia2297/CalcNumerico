function [P, c, N] = PolIntNewton(x, y)
#[c] = dif_div(x,y);
#[c] = dd(x,y)
[c] = difdivVec(x,y);
#[c] = dd_01(x,y)
n = length(x);
P = zeros(1,n);
P(n) = c(1);
N = zeros(n,n);
N(1,n) = 1;
for i=2:n
N(i,n-i+1:n) = poly(x(1:i-1));
P = P + c(i)*N(i,:);
endfor
endfunction