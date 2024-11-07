function [X] = DW(a1,r1,del,o,T)
%%%%Example%%%%
% close all
% clear all
% clc
% D=3;
% n=100;
% % p=0.5*ones(D,n);
% p=rand(n,D);
% T=100;
% r1=0.5;
% r2=0.3;
% r3=0.1;
% del=0.3;
% a1=zeros(n,n);
% a2=zeros(n,n,n);
% a3=zeros(n,n,n,n);
% o=rand(n,1);
% for i=1:n
%     for j=1:n
%     if p(i,1)>=rand(1)
%        a1(j,i)=1;
%     end
%       for k=min(j+1,n):n
%     if p(i,2)>=rand(1)
%        a2(k,j,i)=1;
%     end
%             for l=min(k+1,n):n
%     if p(i,3)>=rand(1)
%        a3(j,k,l,i)=1;
%     end
%             end
%        end    
%     end
%     i
% end
%%%%%%%%%%%%%%%
t=1;
x=o;
n=length(o);
X=zeros(n,T);

while t<=T
    D1=repmat(x,1,n)-repmat(x',n,1);
    K1=1-D1.^2/((1+del)^2);
    X(:,t)=x;
    F1=-diag(D1.*K1*a1(:,:));
    x=x+r1/(n-1)*F1;
    % F(:,:,t)=F1;
    t=t+1;
end
end