clear all; clf; clc;
#TP8 - Ejercicio 8

#{x1'(t) = x1*(3 - 0.002*x2)
#{x2'(t) = -x2*(0.5 - 0.0006*x1)

f = @(t,x) [ x(1)*(3   - 0.002 *x(2)) ;
            -x(2)*(0.5 - 0.0006*x(1))];  
            
#a) cual es el predador y cual la presa? x1 o x2?
%Para responder debo observar la gráfica
% la que crece será la presa.
% cuando la otra (depredador) tiende a cero.

#b)
presa_inicial = 1600;
predador_inicial = 800;
y0 = [presa_inicial; predador_inicial];
a = 0; b = 12; %(en 12 meses)
L = 1000;

%==Solucion con método RungeKutta4
[trk4,xrk4]=RungeKutta4(f,[a,b],y0,L);


%==Solucion con método Predictor-Corrector AdamsBashford_Ord4, AdamsMoulton
[t,x]=PredicCorrecAdamsSistemas(f,[a,b],y0,L);
figure(1)
plot(t,x(:,1),'r-') %presas
hold on
plot(t,x(:,2),'b-') %depredadores
grid on
grid minor
title('Evolución de las especies')
xlabel('Tiempo (Meses desde el momento inicial)')
ylabel('Cantidad de individuos')
legend('Presa=x1', 'Predador=x2')
#Gráfica con Runge-Kutta4
##plot(trk4,xrk4(:,1),'g-.-') %presas
##plot(trk4,xrk4(:,2),'k-.-') %depredadores
hold off

figure(2)
plot(x(:,1),x(:,2),'k-o')
grid on
grid minor;
title('Orbita de la solución del sistema predador-presa')
xlabel('Presas (en miles)')
ylabel('Predadores (en miles)')
legend('Eje X: Presas; Eje Y:Predadores')