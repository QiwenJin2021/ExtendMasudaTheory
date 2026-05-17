
function [err_sim,err_the,err_sim_D,err_the_D] = simu_Masuda_Dpq_all(filepath,str_lnd,P,u,CMD,GSD)


SampleSize = [100,200,300,500,700,1000,2000,3000,5000,7000,10000,50000,100000];
% SampleSize = [1000];
SampleSize = SampleSize';
len_SampleSize = length(SampleSize);
err_sim = zeros(len_SampleSize,7);
err_sim_D = zeros(len_SampleSize,7);
err_sim_D_neg = zeros(len_SampleSize,7);
err_sim_D_pos = zeros(len_SampleSize,7);
err_avg = zeros(len_SampleSize,7);
err_the = zeros(len_SampleSize,7);
err_the_D = zeros(len_SampleSize,7);

D_pq_the = calc_MR_D_the_all(CMD,GSD);
T = 5000; % sampling times
for kk = 1:length(SampleSize)
    [err_the(kk,:), err_the_D(kk,:)] = calc_err_Masuda_all(GSD,u,SampleSize(kk));
    for j = 1:T
        fprintf('N=%2d,j=%2d\n', SampleSize(kk),j);

        X1 = gen_sample_LND(GSD,CMD,SampleSize(kk));
        D_pq_sim(j,:) = calc_D_sim_all(X1);

        err_D10(j,kk) = D_pq_sim(j,1) ./ D_pq_the(1,1) - 1;
        err_D20(j,kk) = D_pq_sim(j,2) ./ D_pq_the(1,2) - 1;
        err_D30(j,kk) = D_pq_sim(j,3) ./ D_pq_the(1,3) - 1;
        err_D40(j,kk) = D_pq_sim(j,4) ./ D_pq_the(1,4) - 1;
        err_D32(j,kk) = D_pq_sim(j,5) ./ D_pq_the(1,5) - 1;
        err_D43(j,kk) = D_pq_sim(j,6) ./ D_pq_the(1,6) - 1;
        err_Dmm(j,kk) = D_pq_sim(j,7) ./ D_pq_the(1,7) - 1;

    end
    [err_sim_D(kk,1),err_avg(kk,1),err_sim_D_neg(kk,1),err_sim_D_pos(kk,1)] = calc_error_neg_pos(err_D10(:,kk),P);
    [err_sim_D(kk,2),err_avg(kk,2),err_sim_D_neg(kk,2),err_sim_D_pos(kk,2)] = calc_error_neg_pos(err_D20(:,kk),P);
    [err_sim_D(kk,3),err_avg(kk,3),err_sim_D_neg(kk,3),err_sim_D_pos(kk,3)] = calc_error_neg_pos(err_D30(:,kk),P);
    [err_sim_D(kk,4),err_avg(kk,4),err_sim_D_neg(kk,4),err_sim_D_pos(kk,4)] = calc_error_neg_pos(err_D40(:,kk),P);
    [err_sim_D(kk,5),err_avg(kk,5),err_sim_D_neg(kk,5),err_sim_D_pos(kk,5)] = calc_error_neg_pos(err_D32(:,kk),P);
    [err_sim_D(kk,6),err_avg(kk,6),err_sim_D_neg(kk,6),err_sim_D_pos(kk,6)] = calc_error_neg_pos(err_D43(:,kk),P);
    [err_sim_D(kk,7),err_avg(kk,7),err_sim_D_neg(kk,7),err_sim_D_pos(kk,7)] = calc_error_neg_pos(err_Dmm(:,kk),P);

    err_sim(kk,1) = (err_sim_D(kk,1)+1)^1 - 1;
    err_sim(kk,2) = (err_sim_D(kk,2)+1)^2 - 1;
    err_sim(kk,3) = (err_sim_D(kk,3)+1)^3 - 1;
    err_sim(kk,4) = (err_sim_D(kk,4)+1)^4 - 1;
    err_sim(kk,5) = (err_sim_D(kk,5)+1)^5 - 1;
    err_sim(kk,6) = (err_sim_D(kk,6)+1)^7 - 1;
    err_sim(kk,7) = (err_sim_D(kk,7)+1)^6 - 1; % mass median diameter 



end
matfile = [filepath 'Results_' str_lnd '.mat'];
save(matfile,'err_sim','err_sim_D','err_the','err_the_D','err_sim_D_neg','err_sim_D_pos');


end