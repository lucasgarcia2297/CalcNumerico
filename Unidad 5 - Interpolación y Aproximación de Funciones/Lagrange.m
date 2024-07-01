function [L,P] = Lagrange (x,y)
  n = length(x);
  P = zeros(1,n);
  L = zeros(n,n);
  L(:,n) = ones(n,1);
  for i=1:n
    % i debe ser distinto de j por eso hago 2 for
    for j=1:i-1 
      % podria usar poly en lugar de [1,-x(j)] %me daria el polinomio para el primer punto  
      L(i,:) =(conv(L(i,:),[1,-x(j)]))(2:n+1)./(x(i) - x(j));
      %Con conv multiplico polinomios
    endfor
    for j=i+1:n
       L(i,:) = (conv(L(i,:),[1,-x(j)]))(2:n+1)./(x(i) - x(j));
    endfor
  endfor
  %P = L(1,:)*y(1)+L(2,:)*y(2)+L(3,:)*y(3)+L(4,:)*y(4);
##  for i = 1:n
##    P(i) = L(:,i)*y(:)';
##  endfor
  P = y'*L;
endfunction
