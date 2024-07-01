n = 100;
A = rand(n,n);
x0 = rand(n,1); 
b = A*x0;
x = A\b;