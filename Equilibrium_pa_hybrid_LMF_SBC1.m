% This codes generates the model parameters of hybrid LMF-SBC I in Section 5.3 (Figure 11).
clear all
close all
clc

N=40;
sele_w1=1:3;
sele_w2=1:N;
sup_A=zeros(3,N);
inf_A=zeros(3,N);
for i=1:4
del=0.25*i;
w1=1;
for j=2:N
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
    sup_A(i,j)=-F1_W2/J1_W2;
    inf_A(i,j)=-F1_W1/F2_W1;
end
end

end
save('F:\code4\data\equilibrium\hybrid\A.mat','sup_A','inf_A')

for zz=1:4
F1=figure(zz);
axes1 = axes('Parent',F1);
hold(axes1,'on');

set(gcf,'position',[120 100 900 600])
[~,n]=size(sup_A);
L1=plot(2:n,sup_A(zz,2:end),'-^black','LineWidth',1.5);hold on
L2=plot(2:n,inf_A(zz,2:end),'-oblack','LineWidth',1.5);
for j=1:n
% line([j,j],[inf_A(1,j),sup_A(1,j)],'LineWidth',0.5)
plot([j,j],[inf_A(zz,j),sup_A(zz,j)],'black:','LineWidth',1)
end

ylabel({['Ratio of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral1} ' num2str(zz)]},'FontSize',14,'Interpreter','latex','Rotation',90);
xlabel({'$\omega_2$'},'FontSize',14,'Interpreter','latex');

legend([L1 L2],'$\sup\mathcal{R}^{[\omega_2]}_{[1]}$','$\inf\mathcal{R}^{[\omega_2]}_{[1]}$','FontSize',16,'Interpreter','latex')
set(legend,...
    'Position',[0.129841279207714 0.806934463147314 0.405357133490698 0.118432728322365],...
    'FontSize',16);
annotation(F1,'textbox',...
    [0.29515873015873 0.418333333333333 0.521507936507937 0.0519047619047627],...
    'String',{['Feasible region of parameters in hybrid LMF-SBC \uppercase\expandafter{\romannumeral1} ' num2str(zz)]},...
    'LineStyle','none',...
    'FontSize',14,...
    'FitBoxToText','off',...
    'Interpreter','latex',...
    'BackgroundColor',[1 1 1]);
set(axes1,'FontSize',16);
box on
axis([0 40 0 0.3])
%saveas(gcf,['F:\code4\tu\h1-' num2str(zz) '.eps'],'eps')
end
