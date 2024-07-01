clear all; clc; clf;
%Script 3 para item (d)
f = @(t,x) [-t*x(2);
            t*(x(1)-x(2))];
x0 = [-1;1];
h = 0.1;
a = 0;
b = 3;
L = (b-a)/h;

[t_RK4, x_RK4] = RungeKutta4(f,[a b],x0,L);
x1 = x_RK4(:,1);
x2 = x_RK4(:,2);

#-----------------------------Inciso d-i)------------------------------------
#Calculo los coeficientes y desarrollo el Spline para x1 y para x2
[a1,b1,c1,d1] = Spline_Cubico_Sujeto(t_RK4,x1,0,0);
[a2,b2,c2,d2] = Spline_Cubico_Sujeto(t_RK4,x2,0,0);

xd= t_RK4;
n = length(a1);
S1 = @(w) a1(1)*(w==xd(1));
S2 = @(w) a2(1)*(w==xd(1));
for i = 1:n
  S1 = @(w) S1(w) + ...
  (a1(i) + b1(i).*(w - xd(i)) + c1(i).*(w - xd(i)).^2 + d1(i).*(w - xd(i)).^3).*(w>xd(i)).*(w<=xd(i+1));

  S2 = @(w) S2(w) + ...
  (a2(i) + b2(i).*(w - xd(i)) + c2(i).*(w - xd(i)).^2 + d2(i).*(w - xd(i)).^3).*(w>xd(i)).*(w<=xd(i+1));
endfor

xx = linspace(xd(1),xd(end),31);
#Grafico los Spline y observo si pasan por los puntos de x1(t) y x2(t)
figure(1);
plot(xd,x1,'o',"linewidth",1);
hold on
grid on
plot(xx,S1(xx),'g-',"linewidth",2);
plot(xd,x2,'om',"linewidth",1);
plot(xx,S2(xx),'r-',"linewidth",2);
title("Splines Cúbicos para x1 y x2");
xlabel("Tiempo [s]");
ylabel("Posición [m]");
legend('valores discretos x1','S1(t)','valores discretos x2','S2(t)');
hold off
#-----------------------------------------------------------------------------
#-----------------------------Inciso d-ii)------------------------------------
%defino las derivadas a partir de la Ecuac Diferencial y las Splines 
dx1 = @(t) (-t.*S2(t));
dx2 = @(t) t.*S1(t)- t.*S2(t);

g = @(t) (sqrt(dx1(t).^2 + dx2(t).^2)); %Integrando

I_Gauss = Cuadratura_Gauss_Comp (g,a,b,L,2) 
I = integral(g,a,b)   
#-----------------------------------------------------------------------------