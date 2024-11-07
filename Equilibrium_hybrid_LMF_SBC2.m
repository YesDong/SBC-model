% This codes generates equilibrium (mean equilibrium) of 
% 4 hybrid LMF-SBC II models whose parameters are presented in Table 3.
clear all
close all
clc
D=40;
n=250;
eps=1e-5;
% r1=0.3;
% r2=0.3;
% r3=0.4;
o=rand(n,1);
del=0.5;
p=0.8*ones(n,D);
XR_all=zeros(D,4,10);
Xp_all=zeros(D,4,10);
sDx_all=zeros(D,10,10);
load('F:\code4\data\equilibrium\hybrid\A2.mat')
R_val=zeros(D,4,10);
for w=1:D
    for i=1:4
    Rw1=0.05*i;
    R_val(w,i,:)=linspace(inf_A(i,w), sup_A(i,w),10);
    for j=1:10
    R=zeros(D,1);
    R(1)=0.5;
    R(2)=0.5*Rw1;
    R(w)=0.5*R_val(w,i,j);
    [x,t] = LMF_SBC_equ(R,p,del,o,eps);
    XR_all(w,i,j)=sum(x)/n;
    sDx_all(w,i,j)=t;
    end
    end
end
save('F:\code4\data\equilibrium\hybrid\X22_R_all.mat','XR_all','R_val')

R_fix=0.5*ones(D,1);
for w=1:D
    for i=1:4
    Rw1=0.05*i;
    R_val(w,i,:)=linspace(inf_A(i,w), sup_A(i,w),10);
    p_ch=zeros(n,D);
    for j=1:10
    p_ch(:,1)=0.8*ones(n,1);
    p_ch(:,2)=0.8*Rw1*ones(n,1);
    p_ch(:,w)=0.8*R_val(w,i,j)*ones(n,1);
    [x,t] = LMF_SBC_equ(R_fix,p_ch,del,o,eps);
    Xp_all(w,i,j)=sum(x)/n; 
    sDx_all(w,i,j)=t;
    end
    end
end
save('F:\code4\data\equilibrium\hybrid\X22_p_all.mat','Xp_all','R_val')


Xt_all=zeros(n,100,3);
for w=3:6:15
% for i=1:4
    R(1)=0.5;
    R(2)=0.5*0.05;
    R(w)=0.5*R_val(w,1,10);
    [X, F_all]= LMF_SBC(R,p,del,o,100);
    Xt_all(:,:,(w-3)/6+1)=X;
% end
end
save('F:\code4\data\equilibrium\hybrid\hsd_X22t_all.mat','Xt_all')