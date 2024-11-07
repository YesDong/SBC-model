% This codes generates Figure 3 to illustrate the opinion increment
% when employing confidence function (14) in the SBC model.
clear all 
close all
clc
x1=0;
x2=0.5;
x3=1;
a=0;
a1=0.5;
a2=1;
x = linspace(0,1,100);
y = linspace(0,1,100);
[X, Y] = meshgrid(x,y);
colmin=-0.25;
colmax=0.25;
set(gcf,'position',[300 100 800 750])
Z1 = 0.5*((x'*y).^0.5-x1*ones(100)).*((1-(x-x1).^2/(1+a^2))'*(1-(y-x1).^2/(1+a^2)));
subplot1=subplot(3,3,1);
contourf(X, Y, Z1, 20)
title('$s_i=0, \kappa=0$','Interpreter','latex','FontSize',12)
set(subplot1,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
ylabel('$s_{j_2}$','FontSize',12,'Interpreter','latex')
caxis([colmin,colmax])


Z2 = 0.5*((x'*y).^0.5-x2*ones(100)).*((1-(x-x2).^2/(1+a^2))'*(1-(y-x2).^2/(1+a^2)));
subplot2=subplot(3,3,2);
contourf(X, Y, Z2, 20)
title('$s_i=0.5, \kappa=0$','Interpreter','latex','FontSize',12)
set(subplot2,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
% ylabel('$s_{j_2}$','FontSize',10,'Interpreter','latex')
caxis([colmin,colmax])

Z3 = 0.5*((x'*y).^0.5-x3*ones(100)).*((1-(x-x3).^2/(1+a^2))'*(1-(y-x3).^2/(1+a^2)));
subplot3=subplot(3,3,3);
contourf(X, Y, Z3, 20)
title('$s_i=1, \kappa=0$','Interpreter','latex','FontSize',12)
set(subplot3,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
% ylabel('$s_{j_2}$','FontSize',10,'Interpreter','latex')
caxis([colmin,colmax])

Z4 = 0.5*((x'*y).^0.5-x1*ones(100)).*((1-(x-x1).^2/(1+a1^2))'*(1-(y-x1).^2/(1+a1^2)));
subplot4=subplot(3,3,4);
contourf(X, Y, Z4, 20)
title('$s_i=0, \kappa=0.5$','Interpreter','latex','FontSize',12)
set(subplot4,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
ylabel('$s_{j_2}$','FontSize',12,'Interpreter','latex')
caxis([colmin,colmax])

Z5 = 0.5*((x'*y).^0.5-x2*ones(100)).*((1-(x-x2).^2/(1+a1^2))'*(1-(y-x2).^2/(1+a1^2)));
subplot5=subplot(3,3,5);
contourf(X, Y, Z5, 20)
title('$s_i=0.5, \kappa=0.5$','Interpreter','latex','FontSize',12)
set(subplot5,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
% ylabel('$s_{j_2}$','FontSize',10,'Interpreter','latex')
caxis([colmin,colmax])

Z6 = 0.5*((x'*y).^0.5-x3*ones(100)).*((1-(x-x3).^2/(1+a1^2))'*(1-(y-x3).^2/(1+a1^2)));
subplot6=subplot(3,3,6);
contourf(X, Y, Z6, 20)
title('$s_i=1, \kappa=0.5$','Interpreter','latex','FontSize',12)
set(subplot6,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
% ylabel('$s_{j_2}$','FontSize',10,'Interpreter','latex')
caxis([colmin,colmax])


Z7 = 0.5*((x'*y).^0.5-x1*ones(100)).*((1-(x-x1).^2/(1+a2^2))'*(1-(y-x1).^2/(1+a2^2)));
subplot4=subplot(3,3,7);
contourf(X, Y, Z7, 20)
title('$s_i=0, \kappa=1$','Interpreter','latex','FontSize',12)
set(subplot4,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
ylabel('$s_{j_2}$','FontSize',12,'Interpreter','latex')
caxis([colmin,colmax])

Z8 = 0.5*((x'*y).^0.5-x2*ones(100)).*((1-(x-x2).^2/(1+a2^2))'*(1-(y-x2).^2/(1+a2^2)));
subplot5=subplot(3,3,8);
contourf(X, Y, Z8, 20)
title('$s_i=0.5, \kappa=1$','Interpreter','latex','FontSize',12)
set(subplot5,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
% ylabel('$s_{j_2}$','FontSize',10,'Interpreter','latex')
caxis([colmin,colmax])

Z9 = 0.5*((x'*y).^0.5-x3*ones(100)).*((1-(x-x3).^2/(1+a2^2))'*(1-(y-x3).^2/(1+a2^2)));
subplot6=subplot(3,3,9);
contourf(X, Y, Z9, 20)
title('$s_i=1, \kappa=1$','Interpreter','latex','FontSize',12)
set(subplot6,'BoxStyle','full','Layer','top');
xlabel('$s_{j_1}$','FontSize',12,'Interpreter','latex')
% ylabel('$s_{j_2}$','FontSize',10,'Interpreter','latex')
caxis([colmin,colmax])
colormap(othercolor('YlGnBu4'))
h = colorbar; 
set(h, 'Position', [0.92, 0.11, 0.02, 0.81],...
    'FontSize',10)
%saveas(gcf,['F:\code4\tu\contou.eps'],'epsc')