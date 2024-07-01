m = 5; 
n = 4*m+1;
x = linspace(0,1,n);
y = zeros(1,n);
a = x(1:m+1);
y(1:m+1) = sin(2*pi*a);
y(2*m+1:-1:m+2) = y(1:m);
y(2*m+2:n) = -y(2:2*m);