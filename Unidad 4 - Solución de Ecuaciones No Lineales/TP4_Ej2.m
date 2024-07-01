clc;
# TP4 - Solucion de Ecuaciones no lineales
# Ejercicio 2 - aplicación de Punto Fijo

g1 = @(x) (1/2)*(10-x.^3).^(1/2);
g2 = @(x) (10/(4+x)).^(1/2);

f = @(x) x.^3+ 4*x.^2 - 10;

a = 1; b = 2;
p0 = 1.5;
tol = 1e-15;
kmax = 2000;

#Calculo con la primer funcion g1
[x1,h1] = puntofijo(g1,p0,kmax,tol);
x1
fCalculada1 = x1-g1(x1)  %-->g(x) = x+f(x)
xCalculada1 = x1

#Calculo con la segunda funcion g2
[x2,h2] = puntofijo(g2,p0,kmax,tol);
x2
fCalculada2 = x2-g2(x2)  %-->g(x) = x+f(x)
xCalculada2 = x2

%Para graficar g1
figure(1)
xx = linspace(1,2,1000)';
plot(xx,f(xx),'r-',xx,xx-g1(xx),'b-')
hold on
grid on
plot(xCalculada1,fCalculada1,'gx',g1(x1),f(g1(x1)),'rx')
legend("Función de la ecuación f(x)=0", "Punto fijo g(x)=x")
hold off
##
##%Para graficar g2
##figure(2)
####xx = linspace(1,2,1000)';
##plot(xx,f(xx),'r-',xx,xx-g2(xx),'g-')
##hold on
##grid on
##plot(xCalculada2,fCalculada2,'gx',g2(x2),f(g2(x2)),'rx')
##legend("Función de la ecuación f(x)=0", "Punto fijo g(x)=x")
##hold off