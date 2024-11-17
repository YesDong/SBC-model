clear all
close all
clc
%%
load('D:\code\data\time_all.mat')
T=time_all(5,:,:);
figure1=figure(1);
set(gcf,'position',[120 100 800 550])
axes1 = axes('Parent',figure1);
L11=plot(1:10,T(:,:,1),'-s','color','#d75425', 'linewidth', 1.2);hold on
L12=plot(1:10,T(:,:,2),'-^','color','#e6b532', 'linewidth', 1.2);hold on
L13=plot(1:10,T(:,:,3),'-o','color','#7e2f8c', 'linewidth', 1.2);hold on
L14=plot(1:10,T(:,:,4),'-*','color','#52bcec', 'linewidth', 1.2);hold on
L15=plot(1:10,T(:,:,5),'-d','color','#a21d2f', 'linewidth', 1.2);hold on
L16=plot(1:10,T(:,:,6),'-x','color','#2b2a76', 'linewidth', 1.2);   
L17=plot(1:10,T(:,:,7),'-p','color','#73aa43', 'linewidth', 1.2); 
L18=plot(1:10,T(:,:,8),'-h','color','#c03d64', 'linewidth', 1.2); 
L19=plot(1:10,T(:,:,9),'-v','color','#4ab6d9', 'linewidth', 1.2); 
L110=plot(1:10,T(:,:,10),'-+','color','#9077d7', 'linewidth', 1.2); 
ylim([0,8])
legend1 = legend([L11 L12 L13 L14 L15 L16 L17 L18 L19 L110],'Iterations = 500','Iterations = 1000','Iterations = 1500','Iterations = 2000','Iterations = 2500','Iterations = 3000','Iterations = 3500','Iterations = 4000','Iterations = 4500','Iterations = 5000');  
set(legend1,...
    'Position',[0.129980162771211 0.43125 0.261269837228789 0.493252308953689],...
    'FontSize',13);
ylabel({'Running time (Seconds)'},'Interpreter','latex','FontSize',17,'Rotation',90);
xlabel({'Highest interaction order ($D$)'},'Interpreter','latex','FontSize',17);
% title({'$k$=2, $\eta$=0.3, $Dim$=100'},'Interpreter','latex','FontSize',15);
set(axes1,'FontSize',16);
grid on
saveas(gcf,['D:\code\data\Dtime_fig.eps'],'epsc')
%%
figure1=figure(2);
axes1 = axes('Parent',figure1);
T=time_all(:,5,:);
set(gcf,'position',[120 100 800 550])
L11=plot(400:400:4000,T(:,1),'-s','color','#d75425', 'linewidth', 1.2);hold on
L12=plot(400:400:4000,T(:,2),'-^','color','#e6b532', 'linewidth', 1.2);hold on
L13=plot(400:400:4000,T(:,3),'-o','color','#7e2f8c', 'linewidth', 1.2);hold on
L14=plot(400:400:4000,T(:,4),'-*','color','#52bcec', 'linewidth', 1.2);hold on
L15=plot(400:400:4000,T(:,5),'-d','color','#a21d2f', 'linewidth', 1.2);hold on
L16=plot(400:400:4000,T(:,6),'-x','color','#2b2a76', 'linewidth', 1.2);   
L17=plot(400:400:4000,T(:,7),'-p','color','#73aa43', 'linewidth', 1.2); 
L18=plot(400:400:4000,T(:,8),'-h','color','#c03d64', 'linewidth', 1.2); 
L19=plot(400:400:4000,T(:,9),'-v','color','#4ab6d9', 'linewidth', 1.2); 
L110=plot(400:400:4000,T(:,10),'-+','color','#9077d7', 'linewidth', 1.2); 
ylim([0,8])
legend1 = legend([L11 L12 L13 L14 L15 L16 L17 L18 L19 L110],'Iterations = 500','Iterations = 1000','Iterations = 1500','Iterations = 2000','Iterations = 2500','Iterations = 3000','Iterations = 3500','Iterations = 4000','Iterations = 4500','Iterations = 5000');  
set(legend1,...
    'Position',[0.129980162771211 0.43125 0.261269837228789 0.493252308953689],...
    'FontSize',13);
ylabel({'Running time (Seconds)'},'Interpreter','latex','FontSize',17,'Rotation',90);
xlabel({'Number of individuals ($N$)'},'Interpreter','latex','FontSize',17);
% title({'$k$=2, $\eta$=0.3, $Dim$=100'},'Interpreter','latex','FontSize',15);
set(axes1,'FontSize',16);
grid on
saveas(gcf,['D:\code\data\Ttime_fig.eps'],'epsc')
