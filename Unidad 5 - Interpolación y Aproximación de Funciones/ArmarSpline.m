function [S] = ArmarSpline (a,b,c,d,x)
  n = length(a);  
  xd = x;
  M = [d c b a]
  S = @(x) a(1)*(x==xd(1));
  for i=1:n
    S = @(x) S(x)+...
    polyval(M(i,:), (x-xd(i))).*(x>xd(i)).*(x<=xd(i+1));
  endfor
endfunction
