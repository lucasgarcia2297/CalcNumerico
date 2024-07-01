clc; clear all;
##TP2 - Metodos iterativos
## Ejercicio 5:
## Enuncie y demuestre la relaci�n que existe entre el 
## residuo, el error relativo y el n�mero de condici�n 
## de la matriz de coeficientes del sistema lineal (Teorema 7.27 Burden).
  
##  err_rel = abs(x - xAprox)/abs(x);
##  k=cond(A); %Numero de condicion de la matriz A
  
## Teorema:  
##  err_rel <= k*((norm(r))/norm(b));  
  
##      si K(A) est� cerca de 1  ==> A est� bien condicionada.
##  si K(A) es mucho mayor que 1 ==> A est� mal condicionada.