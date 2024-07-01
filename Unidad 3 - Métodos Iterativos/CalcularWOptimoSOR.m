function [wOptimo] = CalcularWOptimoSOR (A,b,x0,maxit,tol)
   #forma de calcular el w optimo sin la formula si 1<w<2.
   for i = 1:10
     w(i) = 0.19*(i);
     [x,it,r] = Sor(A,b,x0,maxit,tol,w(i));
     iterac(i) = it;
   endfor
   pos = find(iterac == min(iterac));
   wOptimo = 0.19*pos;   
endfunction
