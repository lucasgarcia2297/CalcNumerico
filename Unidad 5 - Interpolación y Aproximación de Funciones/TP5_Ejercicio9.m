clc; clear all; clf;
##TP5 - Interpolación y aproximación de funciones

x = [0 1 2 3 4 5 6]';
y = [432 599 1012 1909 2977 4190 5961]';

#==========================Inciso a=====================
[L,PL] = Lagrange(x,y);
[PN,c,N] = PolIntNewton(x,y);

PPL = polyout(PL,'x')
PPN = polyout(PN,'x')
%---Otra forma-------- 
%n = length(x)-1; 
p6 = polyfit(x,y,6);
pp6 = polyout(p6,'x') 
yp6 = polyval(p6,x)
%---------------------
figure(1)
plot(x,y,'*');
hold on
grid on
xx = linspace(0,10,201);
yyL = polyval(PL,xx);
yyN = polyval(PN,xx);
plot(xx,yyL,'b.-')
plot(xx,yyN,'r-')
hold off
#=======================================================
#==========================Inciso b=====================
#Cuadrados mínimos aproximado por p de grado 1
p1 = polyfit(x,y,1);
yp1 = polyval(p1,x);
figure(2)
plot(x,y,'*',x,yp1,'g-')
grid on
hold off
#=======================================================
#==========================Inciso c=====================
#Cuadrados mínimos aproximado por p de grado 1
p2 = polyfit(x,y,2);
yp2 = polyval(p2,x);
figure(3)
plot(x,y,'*',x,yp2,'r-')
grid on
#=======================================================
#==========================Inciso d=====================
##errorCuad1 = (y-yp1).^2
##errorCuad2 = (y-yp2).^2
##errorCuad6 = (y-yp6).^2
errorCuad6 = norm(y-yp6,2)
errorCuad2 = norm(y-yp2,2)
errorCuad1 = norm(y-yp1,2) #error cuadratico (norma 2)
figure(4)
semilogy(errorCuad1,'g-')
hold on
grid on
semilogy(errorCuad2,'r-')
semilogy(errorCuad6,'b-')
hold off
#=======================================================
#==========================Inciso e=====================
semana10p6 = polyval(p6,10)
semana10p2 = polyval(p2,10)
semana10p1 = polyval(p1,10)
#El mas preciso pareciera ser el cuadrático : p2
#=======================================================
#==========================Inciso f=====================
x(length(x)+1) = 10;
y(length(y)+1) = 14900;
semana10 = y(end)

errorRelp6 = norm(y-(polyval(p6,10)))./norm(y)
errorRelp2 = norm(y-(polyval(p2,10)))./norm(y)
errorRelp1 = norm(y-(polyval(p1,10)))./norm(y)


##figure(5)
##plot(x,y,'*',x,yp1,'g-');
##hold on
##grid on
##plot(x,yp2,'r-');
##plot(x,yp6,'b-');
