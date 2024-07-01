clear all; clc;
#TP6 - Diferenciación e Integración
# Ejercicio 7:

x =   [  0 200  400  600  800  1000 1200]';
Rho = [  4 3.95 3.89 3.80 3.60 3.41 3.30]';
Ac =  [100 103  106  110  120  133  149.6]';

a = 0;
b = 1200; %L = 12;

Integrando = (Rho/1000).*Ac;  %Rho(x)*Ac(x) (divido por 1000 para obtener la unidad de kg)
y = Integrando;
disp('===========================')
disp('calculo con Trapezoidal')
Q1 = TrapCompDatos(x,y)
disp('calculo con Simpson')
Q2 = SimpCompDatos(x,y)
%Error = abs(Q1 - Q2)
%EDifRel = abs(Error(1:end-1)./Error(2:end))
disp('===========================')
##[PL, L] = Lagrange(x,y);
##%PL=polyfit(x,y,n-1);
##plag = @(x) polyval(PL,x);
##
##W_Spol = SimpsonCompuesto(plag,x(1),x(n),n-1)
##ErrSimp=abs(W_Spol-W_S)


disp('===========================')
disp('Valor Octave con trapz')
W_Octave = trapz(x,y)

ErrTrap = abs(W_Octave-Q1)

%curva que une los puntos
p = polyfit(x,y,5);
xx = linspace(0,1200,1000)';
plot(x,y,'*',xx,polyval(p,xx),'r-')
grid on
pint = polyint(p);
integralp = polyval(pint,1200) - polyval(pint,0)