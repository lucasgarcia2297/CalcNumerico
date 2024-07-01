
x = [1 2];
y1 =[2 6];  %f(x)
y2 =[3 7];  %f'(x)
y3 = [8];   %f''(x)

z = [1 1 2 2 2]';

%[P, c, N] = PolIntNewton(z, f);
c = [2 3  1 1 0]';

y = [2 2 2 6 6 6]';
[c,dv] = dif_div_Hermite(z,y);
c
dv