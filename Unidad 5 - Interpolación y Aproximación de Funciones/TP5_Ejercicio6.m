clear all; clc; clf;
##TP5 - Ejercicio 6

f = @(x) sin(2*pi*x);

puntos = 21;
a = -1; b = 1;

x = linspace(a,b,puntos)';
y = f(x);

xx = linspace(a,b,201)';
##P = polyfit(x,y,puntos-1)
[L,P] = Lagrange (x,y);
PL = polyout(P,'x');
fL = polyval(P,xx);

[a, b, c, d] = Spline_Cubico_Natural(x, y);
[S] = ArmarSpline(a,b,c,d,x);

[S(xx) fL sin(2*pi*xx)] %Comparaciones de la Spline, Lagrange y el valor real

figure(1)
plot(x,y,'go')
hold on
grid on
plot(xx,f(xx),'k-.-')
plot(xx,fL,'r-')
plot(xx,S(xx),'b-')
hold off

yy = sin(2*pi*xx);
ErrorLagrange = norm(yy-fL)
ErrorSpline = norm(yy-S(xx))

%Perturbando los datos:
for i = 1:21
  fP = f(x(i))+((-1)^(i+1)*10^(-4));
  yP(i,1) = fP;  
endfor
yP
%plot(xx,fP(xx),'k-.-') 
%P = polyfit(x,y,puntos-1)
[L,P] = Lagrange (x,yP);
PL = polyout(P,'x');
fL = polyval(P,xx);

[a, b, c, d] = Spline_Cubico_Natural(x, yP);
[SP] = ArmarSpline(a,b,c,d,x);
[SP(xx) fL sin(2*pi*xx)] %Comparaciones de la Spline, Lagrange y el valor real

figure(2)
plot(x,yP,'go')
hold on
grid on
%plot(xx,f(xx),'k-.-')
plot(xx,fL,'r-')
plot(xx,S(xx),'b-')
hold off

