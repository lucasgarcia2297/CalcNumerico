function [a,b,c,d] = Spline_Cubico_Sujeto (x,y,dy0,dyn)
  #Pasamos un arreglo de puntos x e y
  #Es una función para el calculo de una Spline Cubica Sujeta, es decir con
  # derivadas primeras dadas en los extremos (dy0 y dyn)
  
  #S(x) = Sj(x) = aj + bj(x-xj) + cj(x-xj)^2 + dj(xx-xj)^3 para xj <= x <= xj+1;
  #S'(x1) = dy0 , S'(xn+1) = dyn

  %Cantidad de puntos
  n = length(x);
  %medimos los h de cada una de las Splines por tramos
  h(1:n-1) = x(2:n) - x(1:n-1);
  
  v = zeros(n,1);
  
  v(1) = 3*( (y(2)-y(1)) / h(1) - dy0 ); %paso 2
  v(2:n-1) = 3*( (y(3:n)-y(2:n-1))' ./ h(2:n-1) - ( y(2:n-1)-y(1:n-2))' ./ h(1:n-2)); %paso 3
  v(n) = 3*( dyn - ( y(n) - y(n-1)) / h(n-1) ); %paso 2
 
  #De aca en adelante resolvemos un sistema lineal tridiagonal utilizando un método
  # que vimos en Métodos Directos, Crout optimizado para matrices tridiagonales.
  # acordarse que tenemos base 1.
  
  l(1) = 2*h(1);
  u(1) = 0.5;
  z(1) = v(1) / l(1);
  
  for i = 2:n-1
    l(i) = 2*( x(i+1)-x(i-1) ) - h(i-1) * u(i-1);
    u(i) = h(i) / l(i);
    z(i) = ( v(i) - h(i-1)*z(i-1) ) /l(i);    
  endfor
  l(n) = h(n-1) * (2-u(n-1));
  z(n) = ( v(n) - h(n-1)*z(n-1) ) / l(n);
  c(n) = z(n);
  
  for i = n-1:-1:1
    c(i) = z(i) - u(i)*c(i+1);
    b(i) = ( y(i+1)-y(i) )/ h(i) - h(i)*( c(i+1) + 2*c(i))/3;
    d(i) = ( c(i+1)-c(i) )/(3*h(i));
  endfor
  c = c(1:n-1);
  a = y(1:n-1);
  
  b = b';
  c = c';
  d = d';
 
endfunction
