function [t,w] = Crank_Nicholson_Newton (f, dfy, t0, tn, alpha, N, maxit, tol)
  %dfy: derivada de f respecto a y
  %t0: valor inicial del intervalo
  %tn: valor fina del intervalo
  %alfha: valor inicial del PVI
  %N: cantidad de subintervalos
  %maxit: cantidad maxima de iteraciones
  %tol: tolerancia. 
 
  h = (tn-t0)/N; %paso de tiempo o de la variable independiente
  t = [t0:h:tn]';
  w = zeros(N+1,1);
  for i = 1:N
    w0 = w(i);
    fi = f(t(i),w(i));
    for it = 1:maxit
      fim1 = f(t(i+1),w0);
      dfim1 = dfy(t(i+1),w0);
      %Función recursiva en forma implícita
      g = w0 - w(i) - h*0.5*(fi + fim1); %Representa la función implícita
      dg = 1 - h*0.5*dfim1; %Derivada de la función implícita.
      
      %Ecuación recursiva de Newton (sistema no lineal)
      w(i+1) = w0 - g/dg; %Calculamos los ceros de la función implicita con Newton
      if (abs(w(i+1)-w0) < tol)
        break;
      endif
      w0 = w(i+1);
    endfor
    
    %Solución del PVI por Crank Nicholson con iteraciones de Newton  
    w(i+1) = w(i) + (h/2)*(fi + f(t(i+1),w(i+1)));
  endfor
endfunction
