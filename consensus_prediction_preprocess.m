% This code is a pre-processing code of the data to extract the interaction 
% simplex in the real data in Section 5.5 to represent the higher-order interactions.
%  
% Part of the data set comes from:
%
% 1.Okawa, M. and Iwata, T. (2022). Predicting opinion dynamics via sociologically-informed neural networks. In
% Proceedings of the 28th ACM SIGKDD Conference on Knowledge Discovery and Data Mining, pages 1306–
% 1316.
% 2.De, A., Bhattacharya, S., Bhattacharya, P., Ganguly, N., and Chakrabarti, S. (2019). Learning linear influence
% models in social networks from transient opinion dynamics. ACM Transactions on the Web, 13(3):1–33.

clear all
close all
clc

% load('D:\code\data\datareal\GTwitter_10ALLXContainedOpinionX.mat')
% load('D:\code\data\datareal\Twitter_10ALLXContainedOpinionX.mat')
% graph=load('D:\code\data\datareal\reddit.mat');
% graph=load('D:\code\data\datareal\webo.mat');
graph=load('D:\code\data\datareal\TAbortion.mat');
a1=graph.Adj;
n=size(a1,1);
a2=zeros(n,n,n);
% a3=zeros(n,n,n,n);
for i=1:n
    for j=1:n
      for k=1:n
    if a1(i,j)*a1(i,k)*a1(j,k)==1
       a2(k,j,i)=1;
    end
            for l=1:n
    % if a2(k,j,i)*a(k,l)*a(j,l)*a(i,l)==1
    %    a3(j,k,l,i)=1;
    % end
            end
       end    
    end
    i
end
a3=0;
r3=0;
% us_o=zeros(n,1);
% us_e=zeros(n,1);
Nor_Opinion=(graph.OpMat(:,3)-min(graph.OpMat(:,3)))/(max(graph.OpMat(:,3))-min(graph.OpMat(:,3)));
o=ones(n,1)*0.5;
e=ones(n,1)*0.5;
for num=1:n
    zz=find(graph.OpMat(:,1)==num);
    if ~isempty(zz)
    o(num)=Nor_Opinion(zz(1));
    e(num)=Nor_Opinion(zz(end));
    end
end
% save('D:\code\data\datareal_last\TS.mat','a1','a2','a3','e','o')
% save('D:\code\data\datareal_last\TD.mat','a1','a2','a3','e','o')
% save('D:\code\data\datareal_last\Re_Pol.mat','a1','a2','a3','e','o')
% save('D:\code\data\datareal_last\We_hea.mat','a1','a2','a3','e','o')
% save('D:\code\data\datareal_last\TA.mat','a1','a2','a3','e','o')