
% Theoretical error calculated by Masuda equation for D_pq

function [Err_masuda,Err_masuda_D] = calc_err_Masuda_all(GSD,u,N)

[Err_D10, Err_D10_2] = calc_err_Masuda(GSD,1,0,u,N);
[Err_D20, Err_D20_2] = calc_err_Masuda(GSD,2,0,u,N);
[Err_D30, Err_D30_2] = calc_err_Masuda(GSD,3,0,u,N);
[Err_D40, Err_D40_2] = calc_err_Masuda(GSD,4,0,u,N);
[Err_D32, Err_D32_2] = calc_err_Masuda(GSD,5,0,u,N);
[Err_D43, Err_D43_2] = calc_err_Masuda(GSD,7,0,u,N);
[Err_Dmm, Err_Dmm_2] = calc_err_Masuda(GSD,6,0,u,N);

Err_masuda = [Err_D10 Err_D20 Err_D30 Err_D40 Err_D32 Err_D43 Err_Dmm];
Err_masuda_D = [Err_D10_2 Err_D20_2 Err_D30_2 Err_D40_2 Err_D32_2 Err_D43_2 Err_Dmm_2];

end