# Calculo Octave solucion ODE
#TP7 - Ejercicio 5
clear all
clc;clf
%Cuando el método es consistente y Estable ==> converge

inter = [0,1];
h = 0.05;
L = (inter(2)-inter(1))/h;
t = linspace(inter(1),inter(2),L+1)';
format long g
% planteamos el PVI
f = @(t,y) t*exp(3*t) - 2*y;
y0 = 0; # valor inicial
%============================================================
# Solución analitica o Exacta
fex=@(t) (t.*exp(3*t))/5 - (exp(3*t))/25 + (exp(-2*t))/25;
fex = fex(t);
fexF=fex(end);
disp('Valor en el punto final-Solucion Exacta:')
disp(fexF)

# graficamos la exacta
figure(1)
grid on
hold on
plot(t,fex,'k-d')
%============================================================
% Solucion numerica con RK4
[trk,yrk]=RungeKutta4(f, inter ,y0,L);

plot(trk,yrk,'b-o')
grid on
grid minor
% valor al final 
yrkF=yrk(end);
disp('Valor en el punto final-Runge Kutta4:')
disp(yrkF)

%============================================================
%[tAB, yAB] = AdamsBashford_Ord2(f,0, 1, y0, L);
%[tAB, yAB] = AdamsBashford_Ord3(f,0, 1, y0, L);
# Orden 4
%tAB, yAB] = AdamsBashford_Ord4(f,0, 1, y0, L);
%[tAM, yAM] = AdamsMoulton_Ord4(f, x0, xn, y0, N);
%============================================================
% Vamos al calculo Predictor-Corrector (AdamsBashford_Ord4 y AdamsMoulton_Ord4)
[tPC1, yPC1] = Predictor_Corrector(f,inter(1), inter(2), y0, L);  
[tPC,yPC] = PredictorCorrectorAdams(f,inter(1),inter(2),y0,L);

plot(tPC,yPC,'r-*')
hold off

% valor al final 
yPCF=yPC(end);
disp('Valor en el punto final-Predictor-Corrector:')
disp(yPCF)

disp('Soluciones en el punto Final')
disp('      Exacta     -    RungeKutta4    -    Pred-Corrector')
Soluciones=[fexF yrkF yPCF]
ErrorRungeKutta4 = abs(fexF - yrkF)
ErrorPredictorCorrector = abs(fexF - yPCF)

