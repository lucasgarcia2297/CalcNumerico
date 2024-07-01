function [P,A,L,U] = doolittle_p (A)
  n = length(A);
  r = [1:n]'; %Vector de índices
  epsilon = 1e-9;
  for k = 1:n
    [pmax, pos] = max(abs( A(r(k:n), k) ));
    if pmax < epsilon
      disp('Los posibles pivots son nulos');
    endif
    pos = pos(1) + k-1; %Actualizo la posicion del pivote
    if pos~=k
      r([pos,k]) = r([k,pos]); %Actualizo el pivote
    endif
    P = eye(n)(r,:);
    A(r(k+1:n),k) = A(r(k+1:n),k) / A(r(k),k);
    A(r(k+1:n),k+1:n) = A(r(k+1:n),k+1:n) - A(r(k+1:n),k)*A(r(k),k+1:n);
  endfor
  #Planteamos el sistema A
  L = eye(n) + tril(A(r,1:n),-1);
  U = triu(A(r,1:n),0);
endfunction
