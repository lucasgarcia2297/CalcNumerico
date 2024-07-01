function [x] = Sustitucion_Atras (A)
  
#------Vectorizado (sin lazos 'for' anidados)--------  
  n = length(A(:,1));
  x = zeros(n,1);
  
  for i=n:-1:1
   x(i) = (A(i,n+1) - A(i,i+1:n)*x(i+1:n)) / A(i,i);   
  endfor
#----------------------------------------------------


#---------Con lazos 'for' anidados-------------------
# n = length(A)-1;
# x = zeros(n,1);
#  x(n) = A(n,n+1)/A(n,n);
#  for i=n-1:-1:1
#    s = A(i,n+1);
#    for j = i+1:n
#      s = s - A(i,j)*x(j);
#    endfor
#    x(i) = s/A(i,i);
#  endfor
#----------------------------------------------------  
endfunction


