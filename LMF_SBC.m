function [X, F_all]= LMF_SBC(R,p,del,o,T)
% This code generates the local mean field approximation of simplex bounded
% confidence (LMF-SBC) for opinion evolution over an interactive complex.
% R: D*1, denoting the fusion parameter of each order
% p: n*D, denoting the interactions probabilities of each individual on each order
% del: Positive integer , denoting confidence parameter
% o: n*1, denoting the initial opinion values
% T: Positive integer, denoting opinion evolution times
% X: n*T,       denoting the opinion values in evolution
% F_all: n*D*T, denoting the increment of each individual's opinion value in each iteration
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
end

