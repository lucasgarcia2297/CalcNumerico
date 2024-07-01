function [x,r] = Gauss_P (A, b)
  n=length(b); 
  A=[A b]; 
  r=1:n;
  epsilon=1e-10; 
  for k=1:n-1 
    % la funcion max devuelve 
    % pmax: el pivote de mayor valor absoluto 
    % p: posicion donde se encuentra pmax (local --> desde k hasta n. No incluye los de arriba que ya usó) 
    [pmax,p] = max(abs(A(r(k:n),k))); 
    if pmax<epsilon 
      disp('Los posibles pivots son CERO') 
      break
    endif
    p = p+k-1; %actualizamos pos. a numeracion global 
    if p~=k 
      r([p k])= r([k p]); %actualiza el pivote
    endif
    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);  %Los 'm'
    A(r(k+1:n),k+1:n+1) = A(r(k+1:n),k+1:n+1)- A(r(k+1:n),k)*A(r(k),k+1:n+1);
  endfor
  x=Sustitucion_Atras(A(r,:));
endfunction

%A(r,:) me da la matriz en diferente orden, sin alterar el orden y los valores reales de A. 
%       Se evita modificar la matriz original