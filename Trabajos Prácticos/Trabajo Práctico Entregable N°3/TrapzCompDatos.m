function I = TrapzCompDatos (x, y)
  #Regla Newton Cotes Compuesta en funci�n de un conjunto de datos
  L = length(x)-1;
  I = 0;
  for i = 1:L
    h = x(i+1) - x(i); %h puede ir variando en el bucle: (intervalos no necesariamente equidistantes)
    yi1 = y(i);
    yi2 = y(i+1);
    
    S = (h/2)*(yi1 + yi2); %Formula del Trapecio h/2[f(x0)+f(x1)]
    I = I+ abs(S);
    endfor
endfunction
