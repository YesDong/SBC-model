% This code generates a total of 5 groups, each consisting 
% of 20 opinion evolution processes, on different scale 
% interaction complexes (according to the SBC model presented
% in Equation (8)), along with local mean field approximations
% corresponding to opinion evolution (based on the LMF-SBC 
% model presented in Equation (13)).

close all
clear all
clc
D=3;     %The highest interaction order
T=50;    %Opinion Evolution Times
r1=0.3;  %[1]-order fusion parameter
r2=0.3;  %[2]-order fusion parameter
r3=0.4;  %[3]-order fusion parameter
del=0.5; %Confidence parameter

for jj=1:5
    n=20*jj; %Number of Individuals
    p=zeros(n,D);
    p(:,1)=rand(n,1)+0;
    p(:,2)=rand(n,1)+0;
    p(:,3)=rand(n,1)+0;
%     p=rand(n,D);
    o=rand(n,1);
    z=jj+15;
disp('===============Begin LMF_SBC===============')
r=[r1,r2,r3]';
[lmf_X,lmf_F] = LMF_SBC(r,p,del,o,T);
disp('LMF_SBC Done!')
%save(['F:\code4\data\NewLMF_all\LMF_SDOD',num2str(z),'.mat'],'lmf_X','p','lmf_F')   

for time=1:20
    time   %Random Times
a1=zeros(n,n);
a2=zeros(n,n,n);
a3=zeros(n,n,n,n);
D2=zeros(n,n,n);
K2=zeros(n,n,n);
K3=zeros(n,n,n,n);
D3=zeros(n,n,n,n);
X=zeros(n,T);
x=o;
for t=1:T
    t     
%%%%%%%%Generating Interaction Complexes%%%%%%%%%%%
for i=1:n
    for j=1:n
    if p(i,1)>=rand(1)
       a1(j,i)=1;
    end
      for k=min(j+1,n):n
    if p(i,2)>=rand(1)
       a2(k,j,i)=1;
    end
            for l=min(k+1,n):n
    if p(i,3)>=rand(1)
       a3(j,k,l,i)=1;
    end
            end
       end    
    end
end
%%%%%%%%Opinion Evolution on Interaction Complexes%%%%%%%%%%%
    D1=repmat(x,1,n)-repmat(x',n,1);
    K1=1-D1.^2/((1+del)^2);
    if r2~=0
        K2=permute(K1, [1, 3, 2]).* permute(K1, [3, 1, 2]);
        D2=permute(repmat(x,1,n,n),[2,3,1])-repmat((x*x').^(1/2),1,1,n);
    end
    if r3~=0
        for i=1:n
        K3(:,:,:,i)=K2.*permute(repmat(K1(:,i),1,n,n),[2,3,1]);
        D3(:,:,:,i)=x(i)*ones(n,n,n)-(repmat(x*x',1,1,n).*permute(repmat(x,1,n,n),[2,3,1])).^(1/3);
        end
    end 
    X(:,t)=x;
    F1=-diag(D1.*K1*a1(:,:));
    F2=-permute(sum(sum(D2.*K2.*a2(:,:,:),1),2),[3,2,1]);
    F3=-permute(sum(sum(sum(D3.*K3.*a3(:,:,:,:),1),2),3),[4,3,2,1]);
    x=x+r1/(n-1)*F1+r2/nchoosek(n-1,2)*F2+r3/nchoosek(n-1,3)*F3;
end
disp('SBC Done!')
%save(['F:\code4\data\NewLMF_all\OC-SDOD',num2str(z),'-',num2str(time),'.mat'],'a1','a2','a3','X')
end
end