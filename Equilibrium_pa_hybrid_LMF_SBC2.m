% This codes generates the model parameters of hybrid LMF-SBC II in Section 5.3 (Figure 12).
clear all
close all
clc
del=0.5;
N=40;
sele_w1=1:3;
sele_w2=1:N;
sup_A=zeros(3,N);
inf_A=zeros(3,N);
w1=1;
for i=1:4
R_w1=0.05*i;
for j=3:N
w2=sele_w2(j);
if w2>1/(1+log((w1+1)/(3*w1+1)))-1
    W1=(w1+1)./(3*w1+1);
    W2=min((2*w2+1).^2./(3*w2+1).^2,exp(-w2./(w2+1)));
    J1_W2=E(W2,1/w1,del)^w2-W2*E(W2,0,del)^w1;
%     J2_W1=E(W1,1/w2,del)^w1-W1*E(W1,0,del)^w2;
    F1_W1=E(W1,1/w1,del)^w1-W1*E(W1,0,del)^w1;
%     F2_W2=E(W2,1/w2,del)^w2-W2*E(W2,0,del)^w2;
    F1_W2=E(W2,1/w1,del)^w1-W2*E(W2,0,del)^w1;
    F2_W1=E(W1,1/w2,del)^w2-W1*E(W1,0,del)^w2;
    sup_A(i,j)=-F1_W2/J1_W2-R_w1;
    inf_A(i,j)=-F1_W1/F2_W1*(1+R_w1);
end
end
end

%save('F:\code4\data\equilibrium\hybrid\A2.mat','sup_A','inf_A')


F1=figure(1);
axes1 = axes('Parent',F1);
hold(axes1,'on');
set(gcf,'position',[120 100 900 600])
[~,n]=size(sup_A);
L1=plot(3:n,sup_A(1,3:end),'-^black','LineWidth',1.5);hold on
L2=plot(3:n,inf_A(1,3:end),'-oblack','LineWidth',1.5);
for j=3:n
if inf_A(1,j)<sup_A(1,j)
% line([j,j],[inf_A(1,j),sup_A(1,j)],'LineWidth',0.5)
plot([j,j],[inf_A(1,j),sup_A(1,j)],'black:','LineWidth',1)
end
end
ylabel({'Ratio of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 1'},'FontSize',14,'Interpreter','latex','Rotation',90);
xlabel({'$\omega_2$'},'FontSize',14,'Interpreter','latex');

legend([L1 L2],'$\sup\mathcal{R}^{[\omega_2]}_{[1]}$','$\inf\mathcal{R}^{[\omega_2]}_{[1]}$','FontSize',16,'Interpreter','latex')
set(legend,...
    'Position',[0.129841279207714 0.806934463147314 0.405357133490698 0.118432728322365],...
    'FontSize',16);
annotation(F1,'textbox',...
    [0.360714285714286 0.610000000000003 0.529285714285714 0.0519047619047628],...
    'String',{'Feasible region of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 1'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'Interpreter','latex',...
    'BackgroundColor',[1 1 1]);
set(axes1,'FontSize',16);
box on
% saveas(gcf,'F:\code4\tu\h2-1.eps','eps')

F2=figure(2);
axes2 = axes('Parent',F2);
hold(axes2,'on');
set(gcf,'position',[120 100 900 600])
[~,n]=size(sup_A);
L1=plot(3:n,sup_A(2,3:end),'-^black','LineWidth',1.5);hold on
L2=plot(3:n,inf_A(2,3:end),'-oblack','LineWidth',1.5);
for j=3:n
if inf_A(2,j)<sup_A(2,j)
plot([j,j],[inf_A(2,j),sup_A(2,j)],'black:','LineWidth',1)
end
end
ylabel({'Ratio of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 2'},'FontSize',14,'Interpreter','latex','Rotation',90);
xlabel({'$\omega_2$'},'FontSize',14,'Interpreter','latex');

legend([L1 L2],'$\sup\mathcal{R}^{[\omega_2]}_{[1]}$','$\inf\mathcal{R}^{[\omega_2]}_{[1]}$','FontSize',16,'Interpreter','latex')
set(legend,...
    'Position',[0.129841279207714 0.806934463147314 0.405357133490698 0.118432728322365],...
    'FontSize',16);
annotation(F2,'textbox',...
    [0.360714285714286 0.610000000000003 0.529285714285714 0.0519047619047628],...
    'String',{'Feasible region of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 2'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'Interpreter','latex',...
    'BackgroundColor',[1 1 1]);
set(axes2,'FontSize',16);
box on
% saveas(gcf,'F:\code4\tu\h2-2.eps','eps')

F3=figure(3);
axes3 = axes('Parent',F3);
hold(axes3,'on');
set(gcf,'position',[120 100 900 600])
[~,n]=size(sup_A);
L1=plot(3:n,sup_A(3,3:end),'-^black','LineWidth',1.5);hold on
L2=plot(3:n,inf_A(3,3:end),'-oblack','LineWidth',1.5);
for j=3:n
if inf_A(3,j)<sup_A(3,j)
plot([j,j],[inf_A(3,j),sup_A(3,j)],'black:','LineWidth',1)
end
end
ylabel({'Ratio of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 3'},'FontSize',14,'Interpreter','latex','Rotation',90);
xlabel({'$\omega_2$'},'FontSize',14,'Interpreter','latex');

legend([L1 L2],'$\sup\mathcal{R}^{[\omega_2]}_{[1]}$','$\inf\mathcal{R}^{[\omega_2]}_{[1]}$','FontSize',16,'Interpreter','latex')
set(legend,...
    'Position',[0.129841279207714 0.806934463147314 0.405357133490698 0.118432728322365],...
    'FontSize',16);
annotation(F3,'textbox',...
    [0.360714285714286 0.610000000000003 0.529285714285714 0.0519047619047628],...
    'String',{'Feasible region of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 3'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'Interpreter','latex',...
    'BackgroundColor',[1 1 1]);
set(axes3,'FontSize',16);
box on
%saveas(gcf,'F:\code4\tu\h2-3.eps','eps')

F4=figure(4);
axes4 = axes('Parent',F4);
hold(axes4,'on');
set(gcf,'position',[120 100 900 600])
[~,n]=size(sup_A);
L1=plot(3:n,sup_A(4,3:end),'-^black','LineWidth',1.5);hold on
L2=plot(3:n,inf_A(4,3:end),'-oblack','LineWidth',1.5);
for j=3:n
if inf_A(4,j)<sup_A(4,j)
plot([j,j],[inf_A(4,j),sup_A(4,j)],'black:','LineWidth',1)
end
end
ylabel({'Ratio of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 4'},'FontSize',14,'Interpreter','latex','Rotation',90);
xlabel({'$\omega_2$'},'FontSize',14,'Interpreter','latex');

legend([L1 L2],'$\sup\mathcal{R}^{[\omega_2]}_{[1]}$','$\inf\mathcal{R}^{[\omega_2]}_{[1]}$','FontSize',16,'Interpreter','latex')
set(legend,...
    'Position',[0.129841279207714 0.806934463147314 0.405357133490698 0.118432728322365],...
    'FontSize',16);
annotation(F4,'textbox',...
    [0.360714285714286 0.610000000000003 0.529285714285714 0.0519047619047628],...
    'String',{'Feasible region of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral2} 4'},...
    'LineStyle','none',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'Interpreter','latex',...
    'BackgroundColor',[1 1 1]);
set(axes4,'FontSize',16);
box on
% saveas(gcf,'F:\code4\tu\h2-4.eps','eps')