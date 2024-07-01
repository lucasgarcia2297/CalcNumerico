clc; clear all;
##TP2 - Metodos iterativos
## Ejercicio 5:
## Enuncie y demuestre la relación que existe entre el 
## residuo, el error relativo y el número de condición 
## de la matriz de coeficientes del sistema lineal (Teorema 7.27 Burden).
  
##  err_rel = abs(x - xAprox)/abs(x);
##  k=cond(A); %Numero de condicion de la matriz A
  
## Teorema:  
##  err_rel <= k*((norm(r))/norm(b));  
  
##      si K(A) está cerca de 1  ==> A está bien condicionada.
##  si K(A) es mucho mayor que 1 ==> A está mal condicionada.