
% Analyse simulation results，establish correction expressions of Masuda theory for large σ
clear all;clc;
addpath(genpath(pwd));
filepath = 'D:\Mycode\ParticleAnalysis\PSD_simu_Masuda_verify\Data\';

P = 0.95; % Confidence level 95%
% u = 1.96; % For P = 0.95
u = -norminv( (1-P)/2 );

% Distribution parameters
GSD = [1.1 1.2 1.3 1.4 1.6 1.8 2.0 2.2 2.5 2.7 3.0 3.3 3.5 4.0 5.0 6.0 8.0];
% GSD = [4.0];
GSD = GSD';
CMD = 5;
s = log(GSD);
SampleSize = [100,200,300,500,700,1000,2000,3000,5000,7000,10000,50000,100000];
SampleSize = SampleSize';
tmp = [];

for i=1:length(s)
    
    str_lnd1 = strcat('LND_GSD=',num2str(GSD(i)));
    str_lnd = strcat(str_lnd1);
    matfile = [filepath 'Results_' str_lnd '.mat'];
    load(matfile);

    for j = 1:5
    tmp1 = [ones(13,1)*(s(i)) SampleSize  ones(13,1)*j err_the_D(:,j) err_sim_D(:,j) err_sim_D_neg(:,j) err_sim_D_pos(:,j)];
    tmp = [tmp;tmp1];
    end

    tmp1 = [ones(13,1)*(s(i)) SampleSize ones(13,1)*6 err_the_D(:,7) err_sim_D(:,7) err_sim_D_neg(:,7) err_sim_D_pos(:,7)];
    tmp = [tmp;tmp1];

    tmp1 = [ones(13,1)*(s(i)) SampleSize ones(13,1)*7 err_the_D(:,6) err_sim_D(:,6) err_sim_D_neg(:,6) err_sim_D_pos(:,6)];
    tmp = [tmp;tmp1];

    

end

file = ['Data.mat'];
save(file,'tmp');

% exp(((x2 - 2.25656) / sqrt(sqrt(x1) / 0.15612237)) * x0)
% 2.1696525**(((x0*x2)**3.4891112/x1)**0.37427387)

