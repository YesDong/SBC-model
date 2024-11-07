function [X] = HK(del,o,T)
%%%%Example%%%%
% close all
% clear all
% clc
% load(['F:\code4\data\datareal_last\' 'TA' '.mat']);
% del=0.4;
% T=100;
%%%%%%%%%%%%%%%
t=1;
x=o;
n=length(o);
X=zeros(n,T);

while t<=T
    D1=abs(repmat(x,1,n)-repmat(x',n,1));
    K=(D1<=del);
    X(:,t)=x;
    x=K*x./sum(K,2);
    t=t+1;
end
end