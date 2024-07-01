clc; clear all; clf;
##TP5 - Interpolación y aproximación de Funciones
##Ejercicio 8:

##Ida
t1 = [0 1 2];
x1 = [0 2 6]; vx1 = [0 0]; %Velocidad inicial y final para x
y1 = [0 4 6]; vy1 = [0 0]; %Velocidad inicial y final para y
#Vuelta
t2 = [2 3 4];
x2 = [6 3 0]; vx2 = [0 0]; %Velocidad inicial y final para x
y2 = [6 2 0]; vy2 = [0 0]; %Velocidad inicial y final para y


#==============================IDA================================
#1era Spline para x hacia arriba: SxA1
[ax1,bx1,cx1,dx1] = Spline_Cubico_Sujeto (t1,x1,vx1(1),vx2(end))
[Sx1] = ArmarSpline(ax1,bx1,cx1,dx1,t1);
#1Era Spline para y hacia arriba: SyA1
[ay1,by1,cy1,dy1] = Spline_Cubico_Sujeto (t1,y1,vy1(1),vy1(end));
[Sy1] = ArmarSpline(ay1,by1,cy1,dy1,t1);
#=================================================================
#============================VUELTA===============================
#2da Spline para x hacia abajo: SxB2
[ax2,bx2,cx2,dx2] = Spline_Cubico_Sujeto (t2,x2,vx2(1),vx2(end));
[Sx2] = ArmarSpline(ax2,bx2,cx2,dx2,t2);
#2da Spline para y hacia abajo: SyB2
[ay2,by2,cy2,dy2] = Spline_Cubico_Sujeto (t2,y2,vy2(1),vy2(end));
[Sy2] = ArmarSpline(ay2,by2,cy2,dy2,t2);
#=================================================================
#============Grafica t vs x=======================
figure(1)
plot(t1,x1,'o','MarkerEdgeColor','k','MarkerFaceColor',[0 1 0],'MarkerSize',7,...
     t2,x2,'o','MarkerEdgeColor','k','MarkerFaceColor',[0 1 0],'MarkerSize',7);
xlabel("Tiempo"); 
ylabel("Posicion en X"); 
title('Grafica T vs X');
hold on;
grid on; 
tx1 = linspace(t1(1),t1(3),100);
tx2 = linspace(t2(1),t2(3),100);
plot(tx1,Sx1(tx1),'c-',"linewidth",2);
plot(tx2,Sx2(tx2),'b-',"linewidth",2);
hold off
#==================================================
#============Grafica t vs y=======================
figure(2)
plot(t1,y1,'o','MarkerEdgeColor','k','MarkerFaceColor',[0 1 0],'MarkerSize',7,...
     t2,y2,'o','MarkerEdgeColor','k','MarkerFaceColor',[0 1 0],'MarkerSize',7);
xlabel("Tiempo"); 
ylabel("Posicion en Y"); 
title('Grafica T vs Y');
hold on;
grid on; 
ty1 = linspace(t1(1),t1(3),100);
ty2 = linspace(t2(1),t2(3),100);
plot(ty1,Sy1(ty1),'c-',"linewidth",2);
plot(ty2,Sy2(ty2),'b-',"linewidth",2);
hold off
#==================================================
#============Grafica x vs y=======================
figure(3)
plot(x1,y1,'o','MarkerEdgeColor','k','MarkerFaceColor',[0 1 0],'MarkerSize',7,...
     x2,y2,'o','MarkerEdgeColor','k','MarkerFaceColor',[0 1 0],'MarkerSize',7);
xlabel("Posicion en X"); 
ylabel("Posicion en Y"); 
title('Gráfica X vs Y');
hold on;
grid on; 
plot(Sx1(tx1),Sy1(ty1),'c-',"linewidth",2);
plot(Sx2(tx2),Sy2(ty2),'b-',"linewidth",2);
hold off
#==================================================

#Determinar las componentes Vx y Vy de la velocidad del brazo mecánico
# en el instante de tiempo t=5.5
t = 1.5;
xx = [x1 x2]'
tt = [t1 t2]'
[Lx,Px]=Lagrange(tt,[Sx1(t1) Sx2(t2)]');
dPx = polyder(Px);
Vx = Sx1(t)./t
Vy = Sy1(t)./t
plot([ty1 ty2],polyval(Px,[ty1 ty2]),'r-',[ty1 ty2],polyval(dPx,[ty1 ty2]),'b-')