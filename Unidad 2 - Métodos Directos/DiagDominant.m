function DiagDominant (A)  
  n = length(A);
  x = 1;
  for i = 1:n
   sum = 0;
   for j=1:n
     if(j!=i)
       sum += abs(A(i,j));
     endif
    endfor
   if(abs(A(i,i)) < sum)
     x = 0;
     break;
   endif
  endfor
  if(x == 0)
   disp('La matriz NO es diagonal dominante.');
  else 
    disp('La matriz es diagonal domiante');
  endif
endfunction
