function [J] = cuad_gauss_2d (f,a,b,c,d,m,n)
 ##Calcula la cuadratura de gauss para una integral doble
 ##m y n me dan las precisiones (trapezoidal, simpson, etc)
 ##  para cada integral, normalmente serian iguales.
 
 ##El pseudocódigo esta en el Burden version 9 pagina 243
 h1 = (b-a)/2;
 h2 = (b+a)/2;
 J = 0;
 [x1, w1] = gauss_xw(m);
 [x2, w2] = gauss_xw(n);
 
 x=0;
 for i = 1:m
   x = h1*x(m,i)+h2;
   d1 = d(x);
   c1 = c(x);
   k1 = (d1 - c1)/2;  
   k2 = (d1 - c1)/2;  
   
   J = J+w1*k1*J+X
 endfor
 
endfunction
