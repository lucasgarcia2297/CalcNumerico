function A = CrearMatriz (n)
  A = zeros(n,n) + diag(2*[1:n],0) + diag(0.5*[3:n],-2) + diag(0.5*[1:n-2],2) + ...
                                                          diag(0.25*[5:n],-4) + diag(0.25*[1:n-4],4) ; 
endfunction
