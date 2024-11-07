function [x,t]= LMF_SBC_equ(R,p,del,o,eps)
% This code generates the equilibrium of LMF-SBC during the opinion evolution over an interactive complex.
% R: D*1, denoting the fusion parameter of each order
% p: n*D, denoting the interactions probabilities of each individual on each order
% del: Positive integer , denoting confidence parameter
% o: n*1, denoting the initial opinion values
% eps: Positive integer, denoting upper bound of opinion increment in equilibrium state
% x: n*1,   denoting the opinion values at the equilibrium of LMF-SBC during the opinion evolution
% t: positive integer, denoting the number of iterations in equilibrium state
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
% F_all=zeros(n,D,T);
% X=zeros(n,T);
T=1e6;
t=1;
x=o;
sDx=1;
while t<=T&&sDx>eps
  for w=1:D
      F(:,w)=E(x,1/w,del).^w-x.*E(x,0,del).^w;
  end
%   X(:,t)=x;
  Dx=F.*p*R;
  sDx=abs(sum(Dx));
  x=x+Dx;
%   F_all(:,:,t)=F.*p;
  t=t+1;
end
end

