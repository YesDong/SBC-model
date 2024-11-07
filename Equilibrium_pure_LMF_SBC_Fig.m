% This codes generates Figure 8, Figure 9, and Figure 10, which illustrate the examples of
% opinion evolution and the relations between equilibrium state and the
% parameters in pure LMF-SBC.

clear all
close all
clc
load('D:\code\data\equilibrium\Xt_all.mat')
load('D:\code\data\equilibrium\X_all.mat')

for w=1:3
f=figure(w);
axes1 = axes('Parent',f);
set(gcf,'position',[120 100 700 500])
for i=1:100
L1=plot(1:50,Xt_all(i,:,w),'Color','black');hold on
end
ylabel({'States'},'FontSize',14,'Rotation',90);
xlabel({'$t$'},'FontSize',14,'Interpreter','latex');
L2=plot(1:50,(w+1)/(3*w+1)*ones(50,1),'r','LineWidth',1.5);
L3=plot(1:50,min((2*w+1)^2/(3*w+1)^2,exp(-w/(w+1)))*ones(50,1),'--r','LineWidth',1.5);
legend([L1 L2 L3],['States in pure LMF-SBC' num2str(w)],['{W_1}_{[' num2str(w) ']}'],['{W_2}_{[' num2str(w) ']}'],'FontSize',14)
set(axes1,'FontSize',12);
%saveas(gcf,['F:\code4\tu\equili_ex' num2str(w) '.eps'],'epsc')
end


for j=1:4
f1=figure(j+3);
axesj = axes('Parent',f1);
[D,m,n]=size(X_all);
P1=plot(1:D,X_all(:,j*2-1,5),'-^','Color','black');hold on
w=1:D;
P2=plot(1:D,(w+1)./(3*w+1),'r','LineWidth',1.5);
P3=plot(1:D,min((2*w+1).^2./(3*w+1).^2,exp(-w./(w+1))),'--r','LineWidth',1.5);
ylabel({'Value'},'FontSize',13,'Rotation',90);
xlabel({'$\omega$'},'FontSize',13,'Interpreter','latex');
legend([P1 P2 P3],'Equilibrium state',['{W_1}_{[\omega]}'],['{W_2}_{[\omega]}'],'FontSize',14)
grid on
set(axesj,'FontSize',12);
%saveas(gcf,['F:\code4\tu\equili_omega' num2str(j) '.eps'],'epsc')
end

D=D/2;
% B=linspace(0.6,0,D)'*[1,1,1];

B1=linspace(1.3,2,D);

B_all=colormap(flipud(parula(13)));
B=B_all(4:end,:);

figure(8)
set(gcf,'position',[120 100 1700 400])
f2=subplot(1,3,3);
for i=1:D
plot((1:m)*0.1,X_all(i,:,5),'Color',B(i,:),'LineWidth',B1(i));hold on
end
xlabel({'$\delta$'},'Interpreter','latex','FontSize',13);
ylabel({'Equilibrium state'},'FontSize',13,'Rotation',90);
axis([0.1,1,0.36,0.52])
colorbar('Direction','reverse','FontSize',12,'Ticks',0:0.1:1,...
         'TickLabels',{'\omega=1','\omega=2','\omega=3','\omega=4','\omega=5','\omega=6','\omega=7','\omega=8','\omega=9','\omega=10','\omega=11'});
grid on
set(f2,'FontSize',12);
%%%%%%%%%%%%%%%%%
f2=subplot(1,3,1);
for i=1:D
% plot((1:n)*0.1,permute(X_all(i,5,:), [3, 2, 1]),'Color',C(1+(i-1)*fix(size(C,1)/20),:),'LineWidth',1);hold on
plot((1:n)*0.1,permute(X_all(i,5,:), [3, 2, 1]),'Color',B(i,:),'LineWidth',B1(i));hold on
end
xlabel({'$p^{[\omega]}$'},'FontSize',13,'Interpreter','latex');
ylabel({'Equilibrium state'},'FontSize',13,'Rotation',90);
%%%%%%%%%%%%%%%%%

axis([0.1,1,0.36,0.52])
colorbar('Direction','reverse','FontSize',12,'Ticks',0:0.1:1,...
         'TickLabels',{'\omega=1','\omega=2','\omega=3','\omega=4','\omega=5','\omega=6','\omega=7','\omega=8','\omega=9','\omega=10','\omega=11'});
grid on
set(f2,'FontSize',12);
f3=subplot(1,3,2);
for i=1:D
% plot((1:n)*0.1,permute(X_all(i,5,:), [3, 2, 1]),'Color',C(1+(i-1)*fix(size(C,1)/20),:),'LineWidth',1);hold on
plot((1:n)*0.1,permute(X_all(i,5,:), [3, 2, 1]),'Color',B(i,:),'LineWidth',B1(i));hold on
end
ylabel({'Equilibrium state'},'FontSize',13,'Rotation',90);
xlabel({'$R_{[\omega]}$'},'FontSize',13,'Interpreter','latex');
axis([0.1,1,0.36,0.52])
fig=gca;
colormap(B);
colorbar('Direction','reverse','FontSize',12,'Ticks',0:0.1:1,...
         'TickLabels',{'\omega=1','\omega=2','\omega=3','\omega=4','\omega=5','\omega=6','\omega=7','\omega=8','\omega=9','\omega=10','\omega=11'});
% colorbar('Direction','reverse','FontSize',10,'Ticks',0.2:0.1:1);
grid on
set(f3,'FontSize',12);
% saveas(gcf,['F:\code4\tu\equili_pa.eps'],'epsc')
