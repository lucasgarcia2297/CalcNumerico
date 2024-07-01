function Q = TrapCompDatos(x,y)
  n = length(x);
  Q = 0;
  for i = 1:n-1
    h = x(i+1) - x(i);
    Q += h*(y(i+1)+y(i)); 
  endfor
  Q/=2;
  
##   #Regla Newton Cotes Compuesta en función de un conjunto de datos
##  L = length(x)-1;
##  I = 0;
##  for i = 1:L
##    h = x(i+1) - x(i); %h puede ir variando en el bucle: (intervalos no necesariamente equidistantes)
##    yi1 = y(i);
##    yi2 = y(i+1);
##    
##    S = (h/2)*(yi1 + yi2); %Formula del Trapecio h/2[f(x0)+f(x1)]
##    I = I+ abs(S);
##    endfor
endfunction
