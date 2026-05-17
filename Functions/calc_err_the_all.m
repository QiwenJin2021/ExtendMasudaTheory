
% Calculate the uncertainty of M-R diameter of multimodal distribution
% theoretically

function [Err_pq] = calc_err_the_all(paras,u,N)

Err_D10 = calc_err_the(paras,1,0,u,N);
Err_D30 = calc_err_the(paras,3,0,u,N);
Err_D32 = calc_err_the(paras,3,2,u,N);
Err_D43 = calc_err_the(paras,4,3,u,N);
Err_pq = [Err_D10 Err_D30 Err_D32 Err_D43];

end