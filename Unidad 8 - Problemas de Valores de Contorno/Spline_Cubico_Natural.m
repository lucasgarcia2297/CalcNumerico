function [a, b, c, d] = Spline_Cubico_Natural(x, y)
# Pasamos un arreglo de puntos x e y
# Es una funcion para el calculo de una Spline Cubica Natural, es decir con 
# derivadas segundas nulas.
# programado en base a Burden y Faires Ed9 pag 149. Ojo tener cuidado el codigo 
# en base 1 y el libro en base 0.
# S(x) = Sj(x) = aj + bj(x-xj) + cj(x-xj)^2 + dj(x-xj)^3 para xj <= x <= xj+1;
# S''(x1) = 0  , S''(xn+1) = 0
n = length(x);

v = zeros(n,1);
c = v;
# calculamos los h de cada Spline.
h(1:n-1) = x(2:n) - x(1:n-1); # sin usar el lazo

# paso 2 calcula los terminos independientes del Burden
v(2:n-1) = 3*((y(3:n) - y(2:n-1) )' ./h(2:n-1)...
 - (y(2:n-1) - y(1:n-2))' ./h(1:n-2));

 # Paso 3 del Burden
l = ones(n,1);
u = zeros(n,1);
z = zeros(n,1);

# Paso 4 del Burden
for i = 2:n-1
  l(i) = 2 * ( x(i+1) - x(i-1) ) - h(i-1) * u(i-1);
  u(i) = h(i)/l(i);
  z(i) = ( v(i) - h(i-1) * z(i-1) ) / l(i);
endfor

# Paso 6 del Burden

for i = n-1:-1:1
  c(i) = z(i) - u(i) * c(i+1);
  # Ec. 3 apunte
  b(i) = ( y(i+1)-y(i) ) / h(i) - h(i) * ( c(i+1) + 2 * c(i) ) / 3;
  
  d(i) = ( c(i+1) - c(i) ) / ( 3*h(i) ); # Ec. 5 apunte
endfor

  a = y(1:n-1);
  c = c(1:n-1);
  
  b = b';
  d = d';
endfunction