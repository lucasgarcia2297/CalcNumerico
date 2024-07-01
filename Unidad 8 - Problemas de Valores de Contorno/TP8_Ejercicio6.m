clear all; clc;
##TP8 - Ejercicio 6 
#-0.9*u'(3) - 15*u(3) = -15.4  
# A=-0.9      B = -15    C = -15.4(?)

#rob = [-0.9 -15 60] %[A B C](?) 

Largo = 5; %largo de la barra: 5cm
K0 = 0.9; %Conductividad termica del material: 0.9 cal/(s.cm.°C)
u0 = 6; %Temperatura fija en el extremo izquierdo. 
H = 15; %Coeficiente de transferencia de calor: 15 cal/(s.cm^2.°C)
uE = 4; %Temperatura exterior: 4°C
f = @(x) 5*x.*(5-x); %Fuente de calor (cal/s.cm^3)
cR = @(x) 1.05*x+2; %Coeficiente de proceso radioactivo (cal/(s.cm^3.°C))
F = @(x) [(0.*x)/K0 (cR(x))/K0 (-f(x))/K0];

#Respuesta a) Planteo de la Ecuación Diferencial
#Ecuación de difusión-reacción
#  {  -k0u''(x) + cR(x)u(x) = f(x)  , 0<=x <= L
#  {  u(0) = 6  --> temperatura prescripta (tipo Dirichlet)
#  { -K0u'(L) = H[u(L) - uE] --> ley de enfriamiento de Newton (tipo Robin)

# u'' = (cR(x)/k0)u(x) - (f(x)/k0)  
# u0 = 6,   Au'(L)+Bu(L)=C
# A = -k0;
# B = Hu(L);
# C = -HuE;

#Respuesta b) Temperatura en el punto medio de la barra.
h = 0.0001;
L = Largo/h;
inter = [0 Largo];
%A = 0.9; B = 15; C = 60;
A = K0
B = H
C = H*uE
rob = [A B C];
[x,y]=dif_fin_rob(F,inter,u0,rob,L);

puntos = length(x)
ptoMedio = puntos/2+0.5
TemperaturaPuntoMedio = y(ptoMedio) 
#Respuesta con 4 digitos decimales exactos: 6.4563


plot(x,y,'r-*')
grid on
grid minor
hold on
##plot(x,f(x),'b-*')
##plot(x,cR(x),'g-*')
