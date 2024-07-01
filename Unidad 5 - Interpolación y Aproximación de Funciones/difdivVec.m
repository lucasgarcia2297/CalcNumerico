function [a] = difdivVec(x,a)
n = length(x);
for k = 2:n
      a(k:n) = (a(k:n) - a(k-1:n-1))./(x(k:n) - x(1:n-k+1));
end
endfunction
