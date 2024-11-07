function [a1,a2,a3] = generate_OC(p,n,T)
% This code generates the datasets of opinion complex to represent higher-order interaction.
% p: n*D, denoting the interactions probabilities of each individual on each order
% n: Positive integer, denoting number of individuals
% T: Positive integer, denoting opinion evolution times
% a1: n*n,     denoting the [1]-order interaction among the individuals
% a2: n*n*n,   denoting the [2]-order interaction among the individuals
% a3: n*n*n*n, denoting the [3]-order interaction among the individuals
a1=cell(1,T);
a2=cell(1,T);
a3=cell(1,T);
for t=1:T
for i=1:n
    for j=1:n
    a1{t}=zeros(n,n);
    a2{t}=zeros(n,n,n);
    a3{t}=zeros(n,n,n,n);
    if p(i,1)>=rand(1)
       a1{t}(j,i)=1;
    end
      for k=min(j+1,n):n
    if p(i,2)>=rand(1)
       a2{t}(k,j,i)=1;
       a1{t}(j,i)=0;
    end
            for l=min(k+1,n):n
    if p(i,3)>=rand(1)
       a3{t}(j,k,l,i)=1;
       a2{t}(k,j,i)=0;
       a1{t}(j,i)=0;
    end
            end
       end    
    end
end
end
end

