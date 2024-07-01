function [resultado] = EsSimetricaDefinidaPositiva (A)
  Es_simetrica = issymmetric(A);
  autovalores = eig(A);
  if Es_simetrica == 1
    disp('Matriz Simétrica.');
  else
    disp('No es Simétrica.');
  endif
  tol =  length(autovalores)*eps(max(autovalores));
  son_positivos = all(autovalores>tol);
  if son_positivos
    disp('Matriz Definida Positiva.');
  else
    disp('No es Definida Positiva.');
  endif
  if (Es_simetrica && son_positivos)
    resultado = true;
  else 
    resultado = false;
  endif
endfunction
