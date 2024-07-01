clc; clear all;
##Integral de ejemplo
f1 = @(x) (x.^3)./((e.^x)-1);
f2 = @(x) (exp(-(x).^2));

a1 = 1; b1 = 10;
a2 = -5; b2 = 5;

m=12
  L = (b1-a1)/(0.009)
  I1 = integral(f1,a1,b1)
  I2 = integral(f2,a2,b2)
for n = 2:m
  Q1 = intNCcompuesta(f1,a1,b1,L,n)
  Q2 = intNCcompuesta(f2,a2,b2,L,n)
endfor

x1 = linspace(a1,b1,200)';
x2 = linspace(a2,b2,200)';
figure(1)
plot(x1,f1(x1),'r-')
grid on
figure(2)
plot(x2,f2(x2),'b-')
grid on