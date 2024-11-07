% This codes generates Figure 15 and Figure 16, which illustrate the examples of
% opinion evolution and the relations between equilibrium state and the
% parameters in hybrid LMF-SBC II.
clear all
close all
clc
load('D:\code\data\equilibrium\hybrid\hsd_X22t_all.mat')
load('D:\code\data\equilibrium\hybrid\X22_R_all.mat')
load('D:\code\data\equilibrium\hybrid\X22_p_all.mat')
figure(1);
T=50;

for w=1:3
f=figure(w);
set(f,'position',[120 100 700 500])
axes1 = axes('Parent',f);

for i=1:100
L1=plot(1:T,Xt_all(i,1:T,w),'Color','black');hold on
end
ylabel({'States'},'FontSize',14,'Rotation',90);
xlabel({'$t$'},'FontSize',14,'Interpreter','latex');
% w=w+2;
w=6*(w-1)+3;
L2=plot(1:T,(1+1)/(3*1+1)*ones(T,1),'r','LineWidth',1.5);
L3=plot(1:T,min((2*w+1)^2/(3*w+1)^2,exp(-w/(w+1)))*ones(T,1),'--r','LineWidth',1.5);
legend([L1 L2 L3],['States in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 1'],['${W_1}_{[1]}$'],['${W_2}_{[' num2str(w) ']}$'],'FontSize',14,'Interpreter','latex')
set(axes1,'FontSize',12);
%saveas(gcf,['F:\code4\tu\equili_hybrid2_ex' num2str(w) '.eps'],'epsc')
end

[D,~,~]=size(XR_all);
f1=figure(4);
axes1 = axes('Parent',f1);
P(1)=plot(3:D,XR_all(3:end,1,end),'-^','Color','black');hold on
P(2)=plot(3:D,XR_all(3:end,2,end),'-o','Color','black');hold on
P(3)=plot(3:D,XR_all(3:end,3,end),'-s','Color','black');hold on
P(4)=plot(3:D,XR_all(3:end,4,end),'-x','Color','black');hold on
% P2=plot(1:D,(1+1)./(3*1+1)*ones(1,D),'r','LineWidth',1.5);
% P3=plot(1:D,min((2*w+1).^2./(3*w+1).^2,exp(-w./(w+1))),'--r','LineWidth',1.5);
ylabel({'Equilibrium state'},'FontSize',13,'Rotation',90);
xlabel({'$\omega_2$'},'FontSize',13,'Interpreter','latex');
legend(P,'hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 1','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 2','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 3','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 4','FontSize',14,'Interpreter','latex')
% legend([P P2 P3],'hybrid LMF-SDOD \uppercase\expandafter{\romannumeral2} 1','hybrid LMF-SDOD \uppercase\expandafter{\romannumeral2} 2','hybrid LMF-SDOD \uppercase\expandafter{\romannumeral2} 3','hybrid LMF-SDOD \uppercase\expandafter{\romannumeral2} 4',['${W_1}_{[1]}$'],['${W_2}_{[\omega_2]}$'],'FontSize',10,'Interpreter','latex')
grid on
set(axes1,'FontSize',12);
%saveas(gcf,'F:\code4\tu\equili_hybrid2_pa1.eps','eps')

f2=figure(5);
axes2 = axes('Parent',f2);
P2(1)=plot(permute(R_val(10,1,:)*0.8, [3, 2, 1]),permute(XR_all(10,1,:), [3, 2, 1]),'-^','Color','black');hold on
P2(2)=plot(permute(R_val(10,2,:)*0.8, [3, 2, 1]),permute(XR_all(10,2,:), [3, 2, 1]),'-o','Color','black');hold on
P2(3)=plot(permute(R_val(10,3,:)*0.8, [3, 2, 1]),permute(XR_all(10,3,:), [3, 2, 1]),'-s','Color','black');hold on
P2(4)=plot(permute(R_val(10,4,:)*0.8, [3, 2, 1]),permute(XR_all(10,4,:), [3, 2, 1]),'-x','Color','black');hold on
ylabel({'Equilibrium state'},'FontSize',13,'Rotation',90);
xlabel({'$R_{[\omega_2]}$'},'FontSize',13,'Interpreter','latex');
legend(P2,'hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 1','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 2','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 3','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 4','FontSize',14,'Interpreter','latex')
% axis([0.1,1,0.36,0.52])
grid on
set(axes2,'FontSize',12);
%saveas(gcf,'F:\code4\tu\equili_hybrid2_pa2.eps','eps')


f3=figure(6);
axes3 = axes('Parent',f3);
P2(1)=plot(permute(R_val(10,1,:)*0.5, [3, 2, 1]),permute(Xp_all(10,1,:), [3, 2, 1]),'-^','Color','black');hold on
P2(2)=plot(permute(R_val(10,2,:)*0.5, [3, 2, 1]),permute(Xp_all(10,2,:), [3, 2, 1]),'-o','Color','black');hold on
P2(3)=plot(permute(R_val(10,3,:)*0.5, [3, 2, 1]),permute(Xp_all(10,3,:), [3, 2, 1]),'-s','Color','black');hold on
P2(4)=plot(permute(R_val(10,4,:)*0.5, [3, 2, 1]),permute(Xp_all(10,4,:), [3, 2, 1]),'-x','Color','black');hold on
ylabel({'Equilibrium state'},'FontSize',13,'Rotation',90);
xlabel({'$p_i^{[\omega_2]}$'},'FontSize',13,'Interpreter','latex');
legend(P2,'hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 1','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 2','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 3','hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 4','FontSize',14,'Interpreter','latex')
% axis([0.1,1,0.36,0.52])
grid on
set(axes3,'FontSize',12);
%saveas(gcf,'F:\code4\tu\equili_hybrid2_pa3.eps','eps')
