clc; clear all;
A = 0.2468
f(1) = A;
for i = 1:60
  i
  A = 2*A.^2-1
  f(i+1) = A;
  
endfor