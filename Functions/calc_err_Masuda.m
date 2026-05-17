
% Theoretical error calculated by Masuda equation for D_pq
% Use a,b to represent type of D, with agreement with Masuda's paper

function [Err_masuda, Err_masuda_D] = calc_err_Masuda(GSD,a,b,u,N)

sigma = log(GSD);
c = a / 2 + b;
Err_masuda = u * a * sigma * sqrt(2 * c^2 * sigma^2 + 1) / sqrt(N);

Err_masuda_D = exp(log(1+Err_masuda)/a)-1;

end