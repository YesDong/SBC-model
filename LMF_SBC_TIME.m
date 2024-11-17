function [X, F_all,time]= LMF_SBC_TIME(R,p,del,o,T)
% This code is in the form of time counting for "LMF_SBC" and, compared to the original code, 
% it only adds the output of the running time ("time").
%%%%%example%%%%
% clear all
% close all
% clc
% R=[0.3,0.3,0.4]';
% o=rand(20,1);
% p=ones(20,3);
% del=0.3;
% T=100;
%%%%%%%%%%%%
D=length(R);
n=length(o);
F=zeros(n,D);
F_all=zeros(n,D,T);
tstart = tic;
% R=r./()
t=1;
x=o;
X=zeros(n,T);
while t<=T
  for w=1:D
      F(:,w)=E(x,1/w,del).^w-x.*E(x,0,del).^w;
  end
  X(:,t)=x;
  x=x+F.*p*R;
  F_all(:,:,t)=F.*p;
  t=t+1;
end
time=toc(tstart); 
end

