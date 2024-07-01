clear all;
clc;
clf;

#Problema de Valor de Contorno
#Con condiciones de Dirichlet en los extremos, es decir con el valor de 
#la variable a calcular

#Método utilizado: Diferencias finitas.

# -u''(x) = f(x), 0<= x <= L=1

#Condiciones iniciales:
L = 1; 
u0 = 5;
uL = 6;

f = @(x)(20*exp(-10*(x-.7).^2));

#Tomamos el tiempo que lleva el armado de la matriz
tic();

N = 40;  %Numero de divisiones del dominio.

h = L/N;
unos = ones(N+1,1);
MatrizDiagonal = [-1*unos 2*unos -1*unos];
A = spdiags(MatrizDiagonal, [-1 0 1], N+1, N+1);

#Modificamos la matriz por las condiciones de contorno
A(1,[1:2]) = [1 0];
A(N+1, [N:N+1]) = [0 1];
condA = cond(A);
rhoA = max(abs(eig(A)));

#Armado del lado derecho
X = linspace(0,L,N+1)'; 
F = [u0; h^2*f(X(2:N)); uL];

tArmadoMatriz = toc();

#------------------------------------------------------------
#Resolucion del sistema por el resolutor de Octave:
tic();
U = A \ F;
tOctave = toc();
#------------------------------------------------------------
#------------------------------------------------------------
#Metodo Directo y Factorización LU de Doolittle:
tic()
[UD] = Doolittle_Pivote(A,F);
tD = toc();
#------------------------------------------------------------
#------------------------------------------------------------
#----------------------Métodos Iterativos-----------------------------
#Inicializacion de parámetros:
n = length(A(:,1));
maxit = 5000;
tol = 1e-4;
U0 = zeros(n,1);

#Solución con Jacobi
[TJ,cJ] = Tc_Jacobi(A,F);
KTJ = cond(TJ);
rhoTJ = max(abs(eig(TJ)));
tic()
[UJ, itJ, rhJ] = Jacobi(A,F,U0,maxit,tol);
tJ = toc();

#Solución con Gauss-Seidel

[TGS,cGS] = Tc_GaussSeidel(A,F);
KTGS = cond(TGS);
rhoTGS = max(abs(eig(TGS)));
tic()
[UGS, itGS, rhGS] = GaussSeidel(A,F,U0,maxit,tol);
tGS = toc();

#Solución con SOR
wSOR = 1.85;
tic()
[USOR, itSOR, rhSOR] = Sor(A,F,U0,maxit,tol,wSOR);
tSOR = toc();

#Solucion con Gradientes Conjugados
#Armado de la matriz simétrica
tic();

h1 = 1/(N);
X1 = linspace(0,L,N+1)';
f1_1 = (h1^2)*(20*exp(-10*(X1(2)-0.7)^2))+u0;
f1_final = (h1^2)*(20*exp(-10*(X1(N)-0.7)^2))+uL;
f1 = [f1_1; (h^2)*(20*exp(-10*(X1(3:N-1)-0.7).^2));f1_final];

F1 = f1;

A1 = spdiags(MatrizDiagonal, [-1 0 1], N-1, N-1);
U0GC = zeros((N-1),1);

[UGC, itGC, rhGC] = GradienteConjugado(A1,F1,U0GC,maxit,tol);
UGC = [u0;UGC;uL];
tGC = toc();
#------------------------------------------------------------
#------------------------------------------------------------
#DATOS DE LA RESOLUCIÓN:
disp('----------------------------------------------------');
disp('Número de condicion de la matriz: ');
disp(condA);

disp('Radio Espectral de la matriz: ');
disp(rhoA);

disp('Valores de los tiempos de cálculo: ');
disp('Armado del sistema: ');
disp(tArmadoMatriz);
disp('-----------------------------------------------');
disp('Calculo por Octave: ');
disp(tOctave);
disp('-----------------------------------------------');
disp('=================Método Directo================');
disp('Calculo por Factorización LU de Doolittle: ');
disp(tD);
disp('-----------------------------------------------');
disp('===============Métodos Iterativos================')
disp('Calculo por Jacobi: ');
disp(tJ);
disp('Cantidad de iteraciones Jacobi: ');
disp(itJ);
disp('Número de condicion de la matriz de iteración T de Jacobi: ');
disp(KTJ);
disp('rho de matriz de iteracion T de Jacobi: ');
disp(rhoTJ);
disp('-----------------------------------------------');
disp('Calculo por GaussSeidel: ');
disp(tGS);
disp('Cantidad de iteraciones GaussSeidel: ');
disp(itGS);
disp('Número de condicion de la matriz de iteración T de Jacobi: ');
disp(KTGS);
disp('rho de matriz de iteracion T de Jacobi: ');
disp(rhoTGS);
disp('-----------------------------------------------');
disp('Calculo por SOR: ');
disp(tSOR);
disp('Cantidad de iteraciones SOR: ');
disp(itSOR);
disp('w Sor: ');
disp(wSOR);
disp('-----------------------------------------------');
disp('Calculo por Gradiente Conjugado: ');
disp(tGC);
disp('Cantidad de iteraciones Gradiente Conjugado: ');
disp(itGC);
disp('-----------------------------------------------');

figure(1)
plot(X,U,'m-o');
hold on
grid on
plot(X1,UGC,'b-*');
xlabel('Dominio');
ylabel('Solución del Problema: Gradientes Conjugados');
hold off

figure(2)
plot(X,UJ,'g-o*');
hold on
grid on
plot(X,UGS,'b-v');
plot(X,USOR,'c--s');
plot(X1,UGC,'r-diamond');
title('Solución del PVC: Métodos Iterativos')
xlabel('Dominio');
ylabel('Solución del Problema');
Metodos = {'Jacobi','Gauss-Seidel', 'SOR', 'Gradientes Conjugados'};
legend(Metodos);
hold off

figure(3)
semilogy(rhJ,'g-o')
hold on
grid on
semilogy(rhGS,'b-v')
semilogy(rhSOR,'c--s')
semilogy(rhGC,'r-diamond')
hold off
title('Tasa de Convergencia: Métodos Iterativos')
xlabel('Iteracion')
ylabel('rh de cada método')
Metodos = {'Jacobi','Gauss-Seidel', 'SOR','Gradientes Conjugados'};
legend(Metodos);


