function [x] = Sustitucion_Adelante (A)
  
#------Vectorizado (sin lazos 'for' anidados)--------  
  n = length(A(:,1));
  x = zeros(n,1);
  for i=1:n
   x(i) = (A(i,n+1) - A(i,1:i-1)*x(1:i-1)) / A(i,i);   
  endfor
#----------------------------------------------------


#---------Con lazos 'for' anidados-------------------
## n = length(A)-1;
## x = zeros(n,1);
##  x(1) = A(1,n+1)/A(1,1);
##  for i=2:n
##    s = A(i,n+1);
##    for j = i-1:-1:1
##      s = s - A(i,j)*x(j);
##    endfor
##    x(i) = s/A(i,i);
##  endfor
#----------------------------------------------------  
endfunction