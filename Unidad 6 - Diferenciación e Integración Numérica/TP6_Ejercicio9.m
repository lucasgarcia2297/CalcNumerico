clear all; clc;
#TP6 - Diferenciaci�n e Integraci�n
# Ejercicio 9

f = @(x) (x.^2).*e.^(-x);
a =0; b = 1; L=50; 

n = 2;
Q2 = cuad_gauss_c(f,a,b,L,n)

n = 3;
Q3 = cuad_gauss_c(f,a,b,L,n)