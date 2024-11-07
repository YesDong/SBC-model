function [MD,JSD,WD,D_re,D_pre] = E_consensus(X_re,X_pre)
% This code computes the Mean Distance (MD), Jensen-Shannon Divergence
% (JSD), Wasserstein Distances (WD) between the real-world opinion
% distribution and the predicted opinion distribution.
% X_re: 1*n, denoting the real opinion values of n individuals
% X_pre: 1*n, denoting the predicted opinion values of n individuals
% MD: denoting Mean Distance
% JSD: denoting Jensen-Shannon Divergence
% WD: denoting Wasserstein Distances
% D_re:  denoting real-world opinion distribution
% D_pre: denoting predicted opinion distribution
[mu_re,D_re]=normfit(X_re);
[mu_pre,D_pre]=normfit(X_pre);
MD=abs(mu_re-mu_pre);
[JSD,WD]=mea(MD,D_re,D_pre);
end

