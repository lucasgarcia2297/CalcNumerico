#Eliminacion de Gauss sin pivoteo
function [x] = Eliminacion_Gauss (A,b)
  n = length(b);
  A = [A b];  
#-----------Sin lazos anidados---------------------
  
  for k=1:n-1
    m = A(k+1:n,k)/A(k,k);
    A(k+1:n,k)=0; %Pivote
    A(k+1:n,k+1:n+1) = A(k+1:n,k+1:n+1) - m*A(k,k+1:n+1);
  endfor  
  x = Sustitucion_Atras(A);
#--------------------------------------------------

#-----------Con lazos anidados---------------------  
##  for k=1:n-1
##    for i=k+1:n
##      m = A(i,k)/A(k,k); %Pivote
##      A(i,k) = 0;
##      for j=k+1:n+1
##        A(i,j) = A(i,j)-m*A(k,j);
##      endfor
##    endfor
##  endfor
##  if A(n,n)==0
##    disp('No hay solución')
##  else
##   x = Sustitucion_Atras(A);
##  endif
#-----------------------------------------------------
endfunction
