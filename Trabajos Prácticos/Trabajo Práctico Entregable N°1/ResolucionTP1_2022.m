clear all;
clc;
clf;

#Problema de Valor de Contorno

#{      x1 = 0
#{-x(i-1)+2x(i)-x(i+1) = 1/N^2,   i=2,3,...,N-1.
#{      xN = 0

#Condiciones de contorno:  
x1 = 0;
xN = 0;

#Número de incognitas
N = 100;

#------------Armado de la matriz------------------------
#Tomamos el tiempo que lleva el armado de la matriz
tic();
unos = ones(N,1);
MatrizDiagonal = [-1*unos 2*unos -1*unos]; %valores de las diagonales
A = spdiags(MatrizDiagonal, [-1 0 1], N, N); %matriz de NxN con valores solo en las diagonales -1 0 y 1

#Modificamos la matriz por las condiciones de contorno
A(1,[1:2]) = [1 0];      %solo x1
A(N, [N-1:N]) = [0 1];   %solo xN


#Armado del lado derecho
b = [x1;unos(2:N-1).*(1/(N^2));xN];
#Finalizo el tiempo para ver cuanto nos llevó armar la matriz
tArmadoMatriz = toc()
#------------------------------------------------------------

#Resolucion del sistema por el resolutor de Octave:
tic();
X = A \ b;
tOctave = toc();
#------------------------------------------------------------
#----------------------Métodos Iterativos-----------------------------
#Inicializacion de parámetros:
n = length(A(:,1))
maxit = 15000
tol = 1e-6
Xini = zeros(n,1) 

#Solución con Jacobi
[TJ,cJ] = Tc_Jacobi(A,b);
KTJ = cond(TJ);
rhoTJ = max(abs(eig(TJ)));
tic()
[XJ, itJ, rhJ] = Jacobi(A,b,Xini,maxit,tol);
tJ = toc();

#Solución con Gauss-Seidel
[TGS,cGS] = Tc_GaussSeidel(A,b);
KTGS = cond(TGS);
rhoTGS = max(abs(eig(TGS)));
tic()
[XGS, itGS, rhGS] = GaussSeidel(A,b,Xini,maxit,tol);
tGS = toc();

#Solución con SOR
wSOR = 2/(1+sqrt(1-(rhoTJ^2)))
tic()
[XSOR, itSOR, rhSOR] = Sor(A,b,Xini,maxit,tol,wSOR);
tSOR = toc();

#Metodo Directo Eliminacion Gaussiana:
tic()
[xEG,rEG] = Elimin_Gauss_Pivot(A,b);
tEG = toc();

#Solucion con Gradientes Conjugados
#Armado de la matriz simétrica
b1 = b(2:n-1);
length(b1)
A1 = spdiags(MatrizDiagonal, [-1 0 1], N-2, N-2)
XiniGC = zeros((N-2),1);

tic()
[XGC, itGC, rhGC] = GradienteConjugado(A1,b1,XiniGC,maxit,tol);
XGC = [x1;XGC;xN];
tGC = toc();

#------------------------------------------------------------
#------------------------------------------------------------
#DATOS DE LA RESOLUCIÓN:
disp('Valores de los tiempos de cálculo: ');
disp('Armado del sistema: ');
disp(tArmadoMatriz);
disp('-----------------------------------------------');
disp('Calculo por Octave: ');
disp(tOctave);
disp('-----------------------------------------------');
disp('=================Método Directo================');
disp('Calculo por Eliminacion Gaussiana con Pivoteo: ');
disp(tEG);
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
disp('Número de condicion de la matriz de iteración T de GaussSeidel: ');
disp(KTGS);
disp('rho de matriz de iteracion T de GaussSeidel: ');
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

#Punto c) 
t = linspace(0,1,N)';
t1 = linspace(0,1,N)';


figure(1)
plot(t,X,'m-o');
hold on
grid on
plot(t1,XGC,'b-*');
plot(t1,XGS,'r-x');
xlabel('Dominio');
ylabel('Solución del Problema: Gradientes Conjugados');
hold off

figure(2)
plot(t,XJ,'g-');
hold on
grid on
grid minor
plot(t,XGS,'b-');
plot(t,XSOR,'c-');
plot(t1,XGC,'r-');
plot(t,xEG,'y-');
title('Solución del PVC: Métodos Iterativos')
xlabel('Dominio');
ylabel('Solución del Problema');
Metodos = {'Jacobi','Gauss-Seidel', 'SOR', 'Gradientes Conjugados','Eliminación Gaussiana con Pivoteo'};
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


