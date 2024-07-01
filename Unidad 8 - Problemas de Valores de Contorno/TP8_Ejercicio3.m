clear all;
clc;
#TP8 - Ejercicio 3 [PVC]
# Diferencias Finitas con condiciones Dirichlet
# {-y'' + p(x)y' + q(x)y + r(x) = 0,  a <= x <= b
# { y(a) = ?, 
# { y(b) = ?

#f(x) = [ p(x)    q(x)   r(x)] Columnas
f = @(x) [(-2./x) 2./(x.^2) sin(log(x))./(x.^2)];

a = 1; b=2; inter = [a b];   %1<=x<=2
yc = [1 2];    %condiciones de contorno: y(a)=1 y(b)=2
h = 0.01; %probar con 0.1 y 0.01; 
L = (b-a)/h;

%Solucion con disparo lineal
[xDL, yDL] = disparo_lineal(f,inter,yc, L);

%Solucion con disparo diferencias finitas
[xDFD, yDFD] = dif_fin_dir(f,inter,yc, L);

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
hold off
legend("Exacta", "DisparoLineal", "DiferenciasDivididas")

#Calculo del error y gráfica
Error_absDL = abs(y_exacta(xx) - yDL);  %Error disparo lineal
Error_absDFD = abs(y_exacta(xx) - yDFD); %Error diferencias finitas dirichlet

[Error_absDL Error_absDFD]
figure(2)
semilogy(Error_absDL,'b-')
hold on
grid on
grid minor
semilogy(Error_absDFD,'r-')
legend("DisparoLineal", "DiferenciasDivididas")

ErrorCuadraticoDL = norm(y_exacta(xx)-yDL) %error cuadrático solucion con disparo lineal
ErrorCuadraticoDFD = norm(y_exacta(xx)-yDFD) %error cuadrático solución con diferencias finitas 
#Para este ejercicio se conclyo que con el metodo del disparo lineal
# se obtuvo menor error en este caso. Sin embargo esto puede que no ocurra siempre.
# Además, el método de diferencias finitas suele preferirse ante el disparo lineal
# ya que es más estable.