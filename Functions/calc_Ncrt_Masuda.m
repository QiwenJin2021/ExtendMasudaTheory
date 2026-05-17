function [N_crt, N_crt2]= calc_Ncrt_Masuda(GSD,a,b,u,Err_masuda_D)

sigma = log(GSD);
c = a / 2 + b;

% Err_masuda = u * a * sigma * sqrt(2 * c^2 * sigma^2 + 1) / sqrt(N);
% 
% Err_masuda_D = exp(log(1+Err_masuda)/a)-1;

Err_masuda = (Err_masuda_D + 1)^a - 1;
N_crt = ( u * a * sigma * sqrt(2 * c^2 * sigma^2 + 1)/Err_masuda )^2;

N_crt = ceil(N_crt);

N_crt2 = ( u * a * sigma * sqrt(2 * c^2 * sigma^2 + 1)/Err_masuda_D )^2;
N_crt2 = ceil(N_crt2);

end