% This code records the running time of LMF-SBC model under different parameter
% N: Number of individuals
% D: Highest interaction order
% T: Number of iterations
clear all
close all
clc
time_all=zeros(10,10,10);
for i=1:10
    i
    N=400*i;
    o=rand(N,1);    
    del=0.4;
    for D=1:10
        for t=1:10
            T=500*t;
    p=rand(N,D);
    R=rand(D,1);
    [X, F_all,time]= LMF_SBC_TIME(R,p,del,o,T);
    time_all(i,D,t)=time;
        end
    end
end
save('D:\code\data\time_all.mat','time_all')