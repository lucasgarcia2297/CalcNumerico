function [x,Ab,L,U,P] = Doolittle(A,b)
  n = length(b);
  Ab = [A b]; %Matriz ampliada
  r = [1:n]'; %Vector de índices
  epsilon = 1e-9;
  for k = 1:n
    [pmax, pos] = max(abs( Ab(r(k:n), k) ));
    if pmax < epsilon
      disp('Los posibles pivots son nulos');
    endif
    pos = pos(1) + k-1; %Actualizo la posicion del pivote
    if pos~=k
      r([pos,k]) = r([k,pos]); %Actualizo el pivote
    endif
    
    P = eye(n)(r,:);
    Ab(r(k+1:n),k) = Ab(r(k+1:n),k) / Ab(r(k),k);
    Ab(r(k+1:n),k+1:n+1) = Ab(r(k+1:n),k+1:n+1) - Ab(r(k+1:n),k)*Ab(r(k),k+1:n+1);
  endfor
  #Planteamos el sistema A
  L = eye(n) + tril(Ab(r,1:n),-1);
  U = triu(Ab(r,1:n),0);
  
  br = P*b;
  y = Sustitucion_Adelante([L br]);
  x = Sustitucion_Atras([U y]);
endfunction
