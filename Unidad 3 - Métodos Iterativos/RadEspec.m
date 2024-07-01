#Funcion que calcula el radio espectral
function [rho] = RadEspec (A)
  rho = max(abs(eig(A)));
endfunction
