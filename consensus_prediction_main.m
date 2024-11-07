% This code is the main running file of consensus prediction (Section 5.5).
% We present consensus prediction examples, tuning methods, and intermediate 
% results using the SBC model on the Twitter-Abortion dataset('TA').
clear all
close all
clc
dataname='TA';
% dataname='TD';
% dataname='TS';
% dataname='Re_Pol';
% dataname='We_hea';
load(['D:\code\data\datareal_last\' dataname '.mat'])
% load('D:\code\data\datareal_last\TS.mat')
% load('D:\code\data\datareal_last\Re_Pol.mat')
for i=1:5
    i
    for j=1:5
        j
        % for k=1:5
r1=0.1*i*1.7;
r2=0.1*j*1.7;
r3=0;
T=100;
del=0.4;
[X1,F]=SBC_TWO(a1,a2,r1,r2,del,o,T);
r=0.3;
%X2 = DW(a1,r,del,o,T);
%X3 = HK(del,o,T);
% save(['F:\code4\data\datareal_last\output\' dataname '.mat'],'X1','X2','X3')
[MD1(i,j),JS1(i,j),WD1(i,j)] = E_consensus(e,X1(:,end));
%[MD2(i,j),JS2(i,j),WD2(i,j)] = E_consensus(e,X2(:,end));
%[MD3(i,j),JS3(i,j),WD3(i,j)] = E_consensus(e,X3(:,end));
         % end
    end
end
last_MD1=min(min(MD1));
% last_MD2=min(min(MD2));
% last_MD3=min(min(MD3));
last_JS1=min(min(JS1));
% last_JS2=min(min(JS2));
% last_JS3=min(min(JS3));
last_WD1=min(min(WD1));
% last_WD2=min(min(WD2));
% last_WD3=min(min(WD3));