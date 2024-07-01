##TP3 - M�todos iterativos
##  Ejercicio 6: gradientesConjugados sin precondicionar 
##   (Demostrar)
##   a) Si A es de nxn sim�trica y definida positiva, entonces
##   el gradiente de la funci�n cuadr�tica 
##      q(x) = (1/2)*x'*A*x - x'*b 
##   evaluado en x est� dado por grad(q) = Ax-b.
##   
##   b) El valor m�nimo de q(x) est� dado por 
##        qmin = -(1/2)*b'*inv(A)*b;
##       
##   c) Implementaci�n del algoritmo GradienteConjugado