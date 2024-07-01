function [t,w]=CN(ecua,alfa,a,b,N)
h=(b-a)/N;
t=(a:h:b)’;
kmax=100;
tol=1e-6;
w=zeros(N+1,1);
w(1) = alfa;
n=1;
while(n<N+1)
w(n+1)=w(n);
[fn,~]=feval(ecua,t(n),w(n));
k=1;
while(k<kmax)
[fnp1,dfnp1dy]=feval(ecua,t(n+1),w(n+1));
g=w(n+1)-w(n)-h/2*(fn+fnp1);
dgdy=1-h/2*dfnp1dy;
w(n+1)=w(n+1)-g/dgdy;
if abs(g)<tol break; endif
k=k+1;
endwhile
endwhile
endfunction