
% Simulate particle sizing with imaging method
% Application on time series size data
% Real GSD and CMD are unknown
% Load raw size data, Fit to LND (judge R2), Get GSD and CMD, Calculate
% error with new model
clear all;clc;
addpath(genpath(pwd));
% 1. Generate a virtual sample
GSD = 4.6;
s = log(GSD);
CMD = 5;
N_tot = 20000;
X_tot = gen_sample_LND(GSD,CMD,N_tot);

P = 0.95;
u = -norminv( (1-P)/2 );
b = 0;
a = 5;
D_the = exp(log(CMD) + (a/2+b) * (log(GSD))^2);

% 2. Assume particle measurement with imaging method
N_delta = 100;
N_current = N_delta:N_delta:N_tot;
N_current = N_current';
for i = 1:length(N_current)
    [Err_neg(i,1),Err_pos(i,1)] = calc_err_newModel(GSD,a,b,u,N_current(i,1));
    X_current = X_tot(1:N_current(i));
    pd = fitdist(X_current, 'Lognormal');
    GSD_t(i,1) = exp(pd.sigma);
    CMD_t(i,1) = exp(pd.mu);
    D_exp(i,1) = exp(log(CMD_t(i,1)) + (a/2+b) * (log(GSD_t(i,1)))^2);
    [Err_neg_t(i,1),Err_pos_t(i,1)] = calc_err_newModel(GSD_t(i,1),a,b,u,N_current(i,1));


end

