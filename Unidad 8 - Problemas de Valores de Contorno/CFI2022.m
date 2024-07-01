clc; clear all;
#Ejercicio CFI

#Datos:
Largo = 2; 
Area = 0.01;
c = 0.217;
p = 2.7;
K0 = 0.57;
ua = 6;

H=15;
uE=4;

f = @(x) (2*x).*(2-x);
cR = @(x) 0.1*x.^3+2.5;
#---------------------------
#-K0u'' + cR(x)u = f(x)
#u'' = cR(x)u/K0 - f(x)/K0
F = @(x) [(0*x)/K0 (cR(x))/K0 (-f(x))/K0];

#-K0u'(L) = H[u(L) - uE]
#HuE = K0u'(L) + Hu(L)
# C  = Au'(L) + Bu(L)
A = K0;
B = H;
C = H*uE;
rob = [A B C];

h = 0.00005;
L = Largo/h

ycd = ua;
inter = [0 Largo];

[x,y]=dif_fin_rob(F,inter,ycd,rob,L);

#Respuesta a)
TemperaturaExtremoDerecho = y(end) %3.714619944599068

#Respuesta b)
#y'(x) = (y(x-2h) - 4*y(x-h) + 3*y(x)) / (2*h)
dub = (y(end-2) - 4*y(end-1) + 3*y(end))/(2*h);
FlujoExtremoDerecho = -K0*dub %-4.28070078948064

#Respuesta c)
S = SimpsonCompuestoDatos (x, c*p*y);
EnergiaTermicaTotal = Area*S  %0.02949592450976267