clear all; clc;
f = @(x) sin(pi*x);
a = 0; b = 5;

L = 1000;
x = linspace(a,b,L+1)';
y = f(x);
QT = TrapCompDatos(x,y)
QNC = intNCcompuesta(f,a,b,L,2)
QO = quad(f,a,b)

S = SimpCompDatos (x,y)
QNCS = intNCcompuesta(f,a,b,L,3)