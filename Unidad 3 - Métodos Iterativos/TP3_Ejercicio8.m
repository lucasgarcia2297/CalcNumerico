clc; clear all; clf;
##TP3 - Métodos iterativos
##  Ejercicio 8:
#         {    2i   si j=i
#A(i,j) = {  0.5i   si j=i+2 o j=i-2
#         { 0.25i   si j=i+4 o j=i-4
#         {    0    en otra posicion
#     con i = 1:1000.

# b = [pi pi...pi];

n = 1000;
#Armado de la matriz
A = CrearMatriz(n);
#Armado del lado derecho
b = ones(n,1)*pi;

#veo las caracteristicas de la matriz para saber si está bien condicionada
condA = cond(A);

rhoA = max(abs(eig(A)));

#Para ver la matriz de forma completa
full(A);
#------------------------------------------------------------

#Resolucion del sistema por el resolutor de Octave:
tic();
X = A \ b;
tOctave = toc();
#------------------------------------------------------------
#------------------------------------------------------------
#Metodo Directo Eliminación de Gauss con pivoteo:
tic()
[xEG] = Gauss_P(A,b);
tEG = toc();
#------------------------------------------------------------
#------------------------------------------------------------
#----------------------Métodos Iterativos-----------------------------
#Inicializacion de parámetros:
maxit = 10000;
tol = 10^-5; %1e-05
Xini = zeros(n,1); 

#Solución con Jacobi
[TJ,cJ] = Tc_Jacobi(A,b);
KTJ = cond(TJ);
rhoTJ = max(abs(eig(TJ)))
tic()
[XJ, itJ, rhJ] = Jacobi(A,b,Xini,maxit,tol);
tJ = toc();

#Solución con Gauss-Seidel

[TGS,cGS] = Tc_GaussSeidel(A,b);
KTGS = cond(TGS);
rhoTGS = max(abs(eig(TGS)))
rhoTJ^2
tic()
[XGS, itGS, rhGS] = GaussSeidel(A,b,Xini,maxit,tol);
tGS = toc();

#Solución con SOR
[resultado] = EsSimetricaDefinidaPositiva (A);
% A es definida positiva pero NO ES TRIDIAGONAL por lo tanto no puedo 
% calcular el w optimo.
%  wSOR = 2 / (1+sqrt(1-(rhoTGS))); #-w Optimo-#
wSOR = CalcularWOptimoSOR (A,b,Xini,maxit,tol)
tic()
[XSOR, itSOR, rhSOR] = Sor(A,b,Xini,maxit,tol,wSOR);
tSOR = toc();

#Solucion con Gradientes Conjugados
#Armado de la matriz simétrica

%b1 = b(2:n-1);
%length(b1)

N=n;
%A1 = spdiags(MatrizDiagonal, [-1 0 1], N-2, N-2)
XiniGC = zeros(N,1);
%full(A1)
tic()
[XGC, itGC, rhGC] = GradienteConjugado(A,b,XiniGC,maxit,tol);
%XGC = [x1;XGC;xN];
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
disp('-----------------------------------------------');
disp('Calculo por Octave: ');
disp(tOctave);
disp('-----------------------------------------------');
disp('=================Método Directo================');
disp('Calculo por Eliminación de Gauss con Pivoteo: ');
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


%GradienteConjugado no converge en n iteraciones porque A no es simetrica, pero converge(?
%Figura de la curva solución
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
plot(t,XJ,'g-o*');
hold on
grid on
plot(t,XGS,'b-v');
plot(t,XSOR,'c--s');
plot(t1,XGC,'r-diamond');
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


