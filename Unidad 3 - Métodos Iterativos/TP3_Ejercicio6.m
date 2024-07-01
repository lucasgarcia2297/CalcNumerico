##TP3 - Métodos iterativos
##  Ejercicio 6: gradientesConjugados sin precondicionar 
##   (Demostrar)
##   a) Si A es de nxn simétrica y definida positiva, entonces
##   el gradiente de la función cuadrática 
##      q(x) = (1/2)*x'*A*x - x'*b 
##   evaluado en x está dado por grad(q) = Ax-b.
##   
##   b) El valor mínimo de q(x) está dado por 
##        qmin = -(1/2)*b'*inv(A)*b;
##       
##   c) Implementación del algoritmo GradienteConjugado