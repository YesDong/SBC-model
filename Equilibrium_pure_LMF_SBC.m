% This codes generates equilibrium (mean equilibrium) state of pure LMF-SBC
% models in Section 5.2
clear all
close all
clc
D=20;
n=250;
eps=1e-5;
% r1=0.3;
% r2=0.3;
% r3=0.4;
o=rand(n,1);
p=0.5*ones(n,D);
X_all=zeros(D,10,10);
sDx_all=zeros(D,10,10);
for w=1:D
    for i=1:10
    del=0.1*i;
    for j=1:10
    R=zeros(D,1);
    R(w)=0.1*j;
    [x,t] = LMF_SBC_equ(R,p,del,o,eps);
    X_all(w,i,j)=sum(x)/n;
    sDx_all(w,i,j)=t;
    end
    end
end
% save('D:\code\data\equilibrium\X_all.mat','X_all')
Xt_all=zeros(n,50,4);
for w=1:3
    del=0.5;
    R=zeros(D,1);
    R(w)=0.5;
    [X, F_all]= LMF_SBC(R,p,del,o,50);
    Xt_all(:,:,w)=X;
end
% save('D:\code\data\equilibrium\Xt_all.mat','Xt_all')