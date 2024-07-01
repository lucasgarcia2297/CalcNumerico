#==================================INCISO A=====================================
#Funcion de Energia termica E(t):
E = @(t) ((t+1/3).^3+1/3).*e.^(-t);
#Primera derivada E'(t):
dE = @(t) e.^(-t).*(3*(t+1/3).^2-((t+1/3).^3+1/3));

#Intervalo de tiempo
t = linspace(0,14,100);

f = @(t) E(t) - 1.5; %funcion auxiliar f(t) = E(t) - 1.5
                     %derivada de f(t) = dE(t)
                     
%------Aplicamos primero Biseccion y luego NewtonRaphson para cada raiz--------- 
tol = 1e-14;
kmax = 100;

disp('Biseccion, NewtonRaphson - RAIZ 1') 
[x0_r1, rhB_r1, itB_r1] = Biseccion (f, 0, 2, 3, tol); %a = 0, b=2, maxit = 3.
x0_r1  %Valor inicial para NewtonRaphson
[r1, rhNR_r1, itNR_r1] = NewtonRaphson(f, dE, x0_r1, tol, kmax);
Tiempo_t1 = r1   %Valor buscado t1 donde E(t1) = 1.5

disp('Biseccion, NewtonRaphson - RAIZ 2')
[x0_r2, rhB_r2, itB_r2] = Biseccion (f, 2, 5, 3, tol); %a = 2, b=5, maxit = 3.
%x0_r2  %Valor inicial para NewtonRaphson
[r2, rhNR_r2, itNR_r2] = NewtonRaphson(f, dE,x0_r2, tol, kmax);
Tiempo_t2 = r2
#===============================================================================
#Gráfica de la funcion E(t):
figure(2)
plot(t,E(t),'b');
grid on
hold on
line([0,14],[1.5,1.5],"linestyle", "-.","color","k"); 
plot(r1,1.5,'*g',r2,1.5,'*g')
%title('Grafica de E(t) marcando los valores cuando E(t)=1.5')
xlabel('Tiempo t');
ylabel('Energía térmica E(t)')
hold off;
#===============================================================================
