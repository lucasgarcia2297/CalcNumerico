clear all; clc;
#TP8 - Ejercicio 4 [PVC]
# Diferencias Finitas con condiciones Robin
# {-y'' + p(x)y' + q(x)y + r(x) = 0, a <= x <= b
# { y(a) = alfha, 
# { A y'(b) +B y(b) = C

# comparacion con dif_fin_dir y disparo_lineal

#f(x) = [ p(x)    q(x)   r(x)] Columnas
f = @(x) [(-2./x) 2./(x.^2) sin(log(x))./(x.^2)];

a = 1; b=2; inter = [a b];   %1<=x<=2
yc = [1 2];    %condiciones de contorno: y(a)=1 y(b)=2
h = 0.1; %probar con 0.1 y 0.01; 
L = (b-a)/h;

%Solucion con Disparo Lineal
[xDL, yDL] = disparo_lineal(f,inter,yc, L);

%Solucion con Diferencias Finitas Dirichlet
[xDFD, yDFD] = dif_fin_dir(f,inter,yc, L);

N = length(yDFD)
%y'(b) = (y(b-2h)-4y(b-h)+3y(b))/2h
%y(b)-----> y(N);
%y(b-h)---> y(N-1);
%y(b-2h)--> y(N-2)
dyb = (yDFD(N-2)-4*yDFD(N-1)+3*yDFD(N))/(2*h)
##A*dyb + B*y(N) = C
%Solucion con Diferencias Finitas Robin
A = 0; B = 1; C = 2;  %¿por qué? Ni idea. Ay'(b)+By(b)=C  A = -1 B=1  
##A = 0; B = 1; C = A*dyb + B*2;
rob = [A B C] %rob = [A B C]
ycd = yc(1); %ycd = Alfha
[xDFR, yDFR] = dif_fin_rob(f,inter,ycd,rob,L)

#Solución exacta
c2 = (1/70)*(8 - 12*sin(log(2)) - 4*cos(log(2)));
c1 = (11/10)-c2;
y_exacta = @(x) c1.*x + (c2./x.^2) - (3/10)*sin(log(x)) - (1/10)*cos(log(x));

%Gráfica
figure(1)
xx = linspace(inter(1), inter(2), L+1)';
plot(xx,y_exacta(xx),'k-');
hold on
grid on
plot(xDL,yDL,'b-')
plot(xDFD,yDFD,'r-')
plot(xDFR,yDFR,'g-')
hold off
legend("Exacta", "Disparo Lineal", "Dif. Finitas Dirichlet","Dif. Finitas Robin")

#Calculo del error y gráfica
Error_absDL = abs(y_exacta(xx) - yDL);  %Error Disparo Lineal
Error_absDFD = abs(y_exacta(xx) - yDFD); %Error Diferencias finitas dirichlet
Error_absDFR = abs(y_exacta(xx) - yDFR); %Error Diferencias Finitas Robin

#Comparación de Errores
disp("DisparoLineal Dif_Fin_Dir Dif_Fin_Rob") 
[Error_absDL     Error_absDFD  Error_absDFR]

figure(2)
semilogy(Error_absDL,'b-')
hold on
grid on
grid minor
semilogy(Error_absDFD,'r-')
semilogy(Error_absDFR,'g-')
legend("Disparo Lineal", "Dif. Finitas Dirichlet", "Dif. Finitas Robin")

ErrorCuadraticoDL = norm(y_exacta(xx)-yDL) %error cuadrático solucion con Disparo Lineal
ErrorCuadraticoDFD = norm(y_exacta(xx)-yDFD) %error cuadrático solución con Diferencias Finitas Dirichlet
ErrorCuadraticoDFR = norm(y_exacta(xx)-yDFR) %error cuadrático solución con Diferencias Finitas Robin
#Para este ejercicio se conclyo que con el metodo del disparo lineal
# se obtuvo menor error en este caso. Sin embargo esto puede que no ocurra siempre.
# Además, el método de diferencias finitas suele preferirse ante el disparo lineal
# ya que es más estable.