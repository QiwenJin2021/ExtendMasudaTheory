

clear all;clc;
addpath(genpath(pwd));
filepath = 'D:\Mycode\ParticleAnalysis\PSD_simu_Masuda_verify\Data\';

P = 0.95; % Confidence level 95%
% u = 1.96; % For P = 0.95
u = -norminv( (1-P)/2 );

% Distribution parameters
GSD = [1.1 1.2 1.3 1.4 1.6 1.8 2.0 2.2 2.5 2.7 3.0 3.3 3.5 4.0 5.0 6.0 8.0];
% GSD = [5.0];
GSD = GSD';
CMD = 5;
s = log(GSD);

for i=1:length(s)
    % filename save    
    str_lnd1 = strcat('LND_GSD=',num2str(GSD(i)));
    str_lnd = strcat(str_lnd1);
    [err_sim,err_the,err_sim_D,err_the_D] = simu_Masuda_Dpq_all(filepath,str_lnd,P,u,CMD,GSD(i));

end