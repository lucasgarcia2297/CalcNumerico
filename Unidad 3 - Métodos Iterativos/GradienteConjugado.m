function [x,it,rh] = GradienteConjugado(A,b,x,maxit,tol)
  r = b - A*x;  %r0 = b-A*x0
  v = r;        %v1 = r0 
  c = r'*r;     
  for it=1:maxit
    if norm(v) < tol
      break;
    endif
    z = A*v;
    t = c / (v' * z);   %longitud del paso t_k
    x = x + t*v;        %actualizar la aproximación x_k
    r = r - t*z;        %actualizar el residuo r_k
    d = r'*r;           %calcular la dirección de búsqueda s_k = (r_k'*r_k)/((r_k-1)'*(r_k-1))
    rh(it) = norm(r,2);
    if rh(it)<tol
      break;
    endif
    v = r + d/c*v;
    c = d;
  endfor
  
endfunction
