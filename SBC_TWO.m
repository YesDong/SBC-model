function [X,F] = SBC_TWO(a1,a2,r1,r2,del,o,T)
% This code generates the simplex bounded confidence (SBC) 
% model for opinion evolution over an interactive complex.
% a1: n*n,     denoting the [1]-order interaction among the individuals
% a2: n*n*n,   denoting the [2]-order interaction among the individuals
% r1: denoting the fusion parameter of [1]-order
% r2: denoting the fusion parameter of [2]-order
% del: Positive integer , denoting confidence parameter
% o: n*1, denoting the initial opinion values
% T: Positive integer, denoting opinion evolution times
% X: n*T,   denoting the opinion values in evolution
% F: n*2*T, denoting the increment of each individual's opinion value in each iteration
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
D2=zeros(n,n,n);
K2=zeros(n,n,n);
% K3=zeros(n,n,n,n);
% D3=zeros(n,n,n,n);
X=zeros(n,T);
F=zeros(n,2,T);
while t<=T
    D1=repmat(x,1,n)-repmat(x',n,1);
    K1=1-D1.^2/((1+del)^2);
    if r2~=0
        K2=permute(K1, [1, 3, 2]).* permute(K1, [3, 1, 2]);
        D2=permute(repmat(x,1,n,n),[2,3,1])-repmat((x*x').^(1/2),1,1,n);
    end
    % if r3~=0
    %     for i=1:n
    %     K3(:,:,:,i)=K2.*permute(repmat(K1(:,i),1,n,n),[2,3,1]);
    %     D3(:,:,:,i)=x(i)*ones(n,n,n)-(repmat(x*x',1,1,n).*permute(repmat(x,1,n,n),[2,3,1])).^(1/3);
    %     end
    % end 
    X(:,t)=x;
    F1=-diag(D1.*K1*a1(:,:));
    F2=-permute(sum(sum(D2.*K2.*a2(:,:,:),1),2),[3,2,1]);
    % if a3~=0
    % F3=-permute(sum(sum(sum(D3.*K3.*a3(:,:,:,:),1),2),3),[4,3,2,1]);
    % else
    % F3=0;
    % end

    % x=x+r1/(n-1)*F1+r2/nchoosek(n-1,2)*F2+r3/nchoosek(n-1,3)*F3;
    x=x+r1/(n-1)*F1+r2/nchoosek(n-1,2)*F2;
    F(:,:,t)=[F1,F2];
    t=t+1;
end

end