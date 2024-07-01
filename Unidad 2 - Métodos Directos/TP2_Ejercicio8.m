clc; clear all;
#TP2 - Métodos directos
# Ejercicio 8: Mezcla de gases

# A = Coeficientes de sensibilidad (Los Si):
A = [ 16.87   0.1650   0.2019   0.3170  0.2340  0.1820   0.1100;
      0.0     27.70     0.8620   0.0620 0.0730  0.1310    0.1200;
      0.0      0.0      22.35     13.05   4.420     6.001   3.043;
      0.0       0.0       0.0     11.28   0.0       1.110   0.3710;
      0.0       0.0       0.0     0.0     9.850     1.1684    2.108;
      0.0     0.0     0.0       0.0       0.2990    15.98     2.107;
      0.0     0.0     0.0     0.0         0.0        0.0      4.670
      ];
#x = Presiones parciales (Los pj):
#x = ? las incognitas.

#b = altura de los picos (los hi):
b = [17.1  65.1  186.0   82.7  84.2  63.7  119.7]';

[x] = gauss_p (A, b);
disp('Presiones parciales de los componentes de la mezcla: ');
x
disp('Presión total de la mezcla: ');
sum(x)
 