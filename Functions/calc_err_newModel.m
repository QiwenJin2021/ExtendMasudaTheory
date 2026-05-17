function [err_D_neg,err_D_pos] = calc_err_newModel(GSD,a,b,u,N)

sigma = log(GSD);
c = a / 2 + b;
Err_masuda = u * a * sigma * sqrt(2 * c^2 * sigma^2 + 1) / sqrt(N);

Err_masuda_D = exp(log(1+Err_masuda)/a)-1;

x0 = sigma;
x1 = N;
x2 = a;

err_D_neg = Err_masuda_D * 2.9663208 ^ ((x2 - 2.5194938) / ((sqrt(x1 / ((x2 ^ 1.5548342) ^ x0)) / x0) + x2));
err_D_pos = Err_masuda_D * exp(x0.^1.3541945 * (x2/(x1^0.32286704))^1.189809);


end