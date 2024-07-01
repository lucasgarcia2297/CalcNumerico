#Ejercicio TP3:

x = linspace(-pi,pi,51);
f = @(x) cos(x);

g1 = @(x) 1
g2 = @(x) 1-(x.^2)/(factorial(2))
g3 = @(x) 1-(x.^2)/(factorial(2))+(x.^4)/(factorial(4))
g4 = @(x) 1-(x.^2)/(factorial(2))+(x.^4)/(factorial(4))-(x.^6)/(factorial(6))

figure(1)
plot(x,f(x),'k-*',x,g1(x),'r-+')
grid on
grid minor

figure(2)
plot(x,f(x),'k-*',x,g2(x),'r-+')
grid on
grid minor

figure(3)
plot(x,f(x),'k-*',x,g3(x),'r-+')
grid on
grid minor

figure(4)
plot(x,f(x),'k-*',x,g4(x),'r-+')
grid on
grid minor
