clear all;
clc;
clf;

#Problema de Valor de Contorno
#Con condiciones de Dirichlet en los extremos, es decir con el valor de 
#la variable a calcular

#Método utilizado: Diferencias finitas.

# -u''(x) = f(x), 0<= x <= L=1

#Condiciones iniciales:
#L = 1; 
x1 = 0;
xN = 0;

#f = @(x)(20*exp(-10*(x-.7).^2));

#Tomamos el tiempo que lleva el armado de la matriz
tic();

N = 10;  %Numero de incognitas.

#h = L/N;
unos = ones(N,1);
MatrizDiagonal = [-1*unos 2*unos -1*unos];
A = spdiags(MatrizDiagonal, [-1 0 1], N, N);
full(A)
#Modificamos la matriz por las condiciones de contorno
A(1,[1:2]) = [1 0];
A(N, [N-1:N]) = [0 1];
full(A)
condA = cond(A);
rhoA = max(abs(eig(A)));

#Armado del lado derecho
#X = linspace(0,L,N+1)'; 
#F = [u0; h^2*f(X(2:N)); uL];

tArmadoMatriz = toc();
