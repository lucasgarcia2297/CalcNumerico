function [x,it,r] = GaussSeidel(A,b,x0,maxit,tol)
 
  #Inicializamos las variables:
  n = length(A);
  x = x0;
  it = 0;
  
  #Ejecutar las siguientes intrucciones teniendo en cuenta un valor
  # m�ximo de iteraciones (maxit):
  while (it < maxit)
    for i = 1:n
      x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x0(i+1:n)) / A(i,i);  
    endfor
    
    #Calculamos el residuo y lo guardamos en el vector de residuos(r)
    r(it+1) = norm(A*x - b); %norm(x-x0)
    
    #Comparamos el valor del residuo con la tolerancia dada;
    if r(it+1) < tol 
      break;
    endif
    #Actualizamos el x0 y el numero de iteracion (it)
    x0 = x; 
    it += 1;
  endwhile
endfunction
