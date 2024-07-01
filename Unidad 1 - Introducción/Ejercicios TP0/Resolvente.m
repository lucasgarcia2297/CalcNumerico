function [r1,r2] = Resolvente (coef)
  a = coef(1)
  b = coef(2)
  c = coef(3)
  
  disc = b^2-4*a*c;
  if disc <0
    disp("Las raices son complejas");
  else
    disp("Las raices son reales.")
  endif
  r1 = (-b+sqrt(disc))/(2*a);
  r2 = (-b-sqrt(disc))/(2*a);
endfunction
