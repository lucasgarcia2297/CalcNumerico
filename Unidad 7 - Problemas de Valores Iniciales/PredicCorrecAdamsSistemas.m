function [t,w]=PredicCorrecAdamsSistemas(f,inter,y0,L)
  t =linspace(inter(1),inter(2),L+1)';
  h = (inter(2)-inter(1))/L;
  w = zeros(length(y0),L+1);
  w(:,1) = y0;
  
  % Runge-Kutta 4 orden
  for i = 1:3
    k1 = h*f(t(i),w(:,i));
    k2 = h*f(t(i)+h/2, w(:,i)+k1/2);
    k3 = h*f(t(i)+h/2, w(:,i)+k2/2);
    k4 = h*f(t(i)+h, w(:,i)+k3);
    
    w(:,i+1) = w(:,i) +(1/6)*(k1+2*k2+2*k3+k4);
  endfor
  
  % Método Predictor-Corrector
 
  for i=4:L
     % Adams-Bashford Predictor (ord 4)
     w(:,i+1) = w(:,i) +(h/24)*(55*f(t(i),w(:,i)) ...
     -59*f(t(i-1),w(:,i-1)) +37*f(t(i-2),w(:,i-2))-9*f(t(i-3),w(:,i-3)));
     
     % Adams-Moulton Corrector (ord 4)
     w(:,i+1) = w(:,i) +(h/24)*(9*f(t(i+1),w(:,i+1)) + 19*f(t(i),w(:,i))...
     -5*f(t(i-1),w(:,i-1)) + f(t(i-2),w(:,i-2)));
   endfor
  w = w';
endfunction
