clear all, clc
#TP8 - Ejercicio 5
#Problema de difusión del calor en una barra: (Estado Estacionario)
##Ecuación:
##  -K0u''(x) = f(x) , 0 <= x <= L
##donde:
##    K0 la conductividad térmica


##Condiciones de contorno:

##u(L) = ?                 temperatura prescripta (tipo Dirichlet)
##-K0u'(L) = ?            flujo de calor prescripto (tipo Neumann)
##-K0u'(L) = H[u(L) - uE]  ley enfriamiento de Newton (tipo Robin)
##donde:
##      uE la temperatura externa en las cercanías del borde x = L.
##      H es una constante de proporcionalidad.
##   si ?=0 decimos que el extremo se encuentra aislado.

#Para este ejercicio, a la ecuacion diferencial:
#  -K0u''(x) = f(x) , 0 <= x <= L
# debo llevarla a la forma y'' = p(x)y' + q(x)y + r(x),
#  u'' = 0*u' + 0*u -f(x)/K0
##Datos:
Largo = 3;
K0 = 1;
ua = 21; %temperatura em en extremo izquierdo
dub = 0 ; %u'(L) = 0. Condicion Neumann con extremo derecho aislado ?=0.

#Fuente:
f = @(x) 20.*sin(5.*(x-1));

#F(x) = [ p(x)    q(x)   r(x)] Columnas
##F = @(x) [ 0     0   -f(x)/K0 ];
F = @(x) [ 0*x 0*x -f(x)./K0];

ycd = ua;
##%Au'(b)=-k0*u'(b)  Bu(b) = Hu(L)  C=q+HuE
##Hu(L) = HuE
##-K0u'(L)+Hu(L) = HuE
rob = [-K0 0 0]; %si C es negativo, va a introducir calor, si es positivo va a sacar calor.
inter = [0 Largo];
h = 0.1;
L = Largo/h  % 100 Subintervalos

%Solucion con Diferencias Finitas Dirichlet
##[xDFD, yDFD] = dif_fin_dir(f,inter,yc,L);
%Solucion con Diferencias Finitas Robin
[xDFR, yDFR] = dif_fin_rob(F,inter,ycd,rob,L);
TemperaturaExtremoDerecho = yDFR(end)

plot(xDFR,yDFR,'r-*')
xlabel("Longitud Barra")
ylabel("Temperatura")
hold on
grid on
[xDFR, yDFR];
[TempMaxima, indx] = max(yDFR);
TempMaxima
PosicionTempMax = xDFR(indx)