
clear all;clc;
addpath(genpath(pwd));

P = 0.95; % Confidence level 95%
% u = 1.96; % For P = 0.95
u = -norminv( (1-P)/2 );

GSD = [1.3 1.4 1.5 1.6 2.0 3.0 4.0 5.0 6.0 7.0 8.0];
GSD = GSD';
CMD = 5;
s = log(GSD);

err_D_limit = 0.2;
N_crt = [];
N_crt_M = [];

b = 0;

a = [6 5 3];

for i = 1:length(GSD)
  [N_crt(i,1), N_crt(i,2)] = calc_Ncrt_newModel(GSD(i), 6, 0, u,err_D_limit, err_D_limit);
  [N_crt(i,3), N_crt(i,4)] = calc_Ncrt_newModel(GSD(i), 5, 0, u,err_D_limit, err_D_limit);
  [N_crt(i,5), N_crt(i,6)] = calc_Ncrt_newModel(GSD(i), 3, 0, u,err_D_limit, err_D_limit);
%   fprintf('GSD = %.2f, need N_neg = %.2f, N_pos = %.2f\n', GSD(i),N_neg, N_pos);
%   N_crt_M(i,1) = calc_Ncrt_Masuda(GSD(i),6,b,u,err_D_limit);
%   N_crt_M(i,2) = calc_Ncrt_Masuda(GSD(i),5,b,u,err_D_limit);
%   N_crt_M(i,3) = calc_Ncrt_Masuda(GSD(i),3,b,u,err_D_limit);
%   [N_crt_M(i,1), N_crt_M(i,2)]= calc_Ncrt_Masuda(GSD(i),6,b,u,err_D_limit);
%   [N_crt_M(i,3), N_crt_M(i,4)] = calc_Ncrt_Masuda(GSD(i),5,b,u,err_D_limit);
%   [N_crt_M(i,5), N_crt_M(i,6)] = calc_Ncrt_Masuda(GSD(i),3,b,u,err_D_limit);
end



