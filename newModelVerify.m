
% Verify the proposed new model to estimate mean diameter unceertainty

clear all;clc;
addpath(genpath(pwd));

P = 0.95; % Confidence level 95%
u = -norminv( (1-P)/2 );
CMD = 5;
b = 0;

Points = 200; % Number of data points to be generated
T = 5000; % sampling times

for i = 1:Points

    % Parameters are within the training data, GSD:1.1~5.0, a:1-7, N:100~100000
%     GSD(i,1) = 1.1+(5-1.1)*rand;
GSD(i,1) = 1.05+(1.3-1.05)*rand;
    s(i,1) = log(GSD(i,1));
%     N(i,1) = randi([100, 100000]);
    N(i,1) = randi([5, 100]);
    a(i,1) = randi([1, 7]);
    c = a(i,1)/2+b;

    D_pq_the = exp(log(CMD) + c * (log(GSD(i,1)))^2);
    [err_D_neg_mod(i,1),err_D_pos_mod(i,1)] = calc_err_newModel(GSD(i,1),a(i,1),b,u,N(i,1));

    for j = 1:T
        fprintf('Points=%2d,j=%2d\n', i, j);
        X1 = gen_sample_LND(GSD(i,1),CMD,N(i,1));
        D_pq_sim(j,1) = calc_D_sim(X1,c);
        err_Dpq(j,1) = D_pq_sim(j,1) / D_pq_the - 1;
    end

    [~,~,err_D_neg_sim(i,1),err_D_pos_sim(i,1)] = calc_error_neg_pos(err_Dpq,P);


end


% Points = 200; % Number of data points to be generated
% T = 5000; % sampling times
% 
% for i = 1:Points
% 
%     % Parameters are out-off the training data, GSD:5.0~8.0, a:1-8, N:100~100000
%     GSD(i,1) = 5+(8-5)*rand;
%     s(i,1) = log(GSD(i,1));
%     N(i,1) = randi([1000, 150000]);
%     a(i,1) = randi([1, 8]);
%     c = a(i,1)/2+b;
% 
%     D_pq_the = exp(log(CMD) + c * (log(GSD(i,1)))^2);
%     [err_D_neg_mod(i,1),err_D_pos_mod(i,1)] = calc_err_newModel(GSD(i,1),a(i,1),b,u,N(i,1));
% 
%     for j = 1:T
%         fprintf('Points=%2d,j=%2d\n', i, j);
%         X1 = gen_sample_LND(GSD(i,1),CMD,N(i,1));
%         D_pq_sim(j,1) = calc_D_sim(X1,c);
%         err_Dpq(j,1) = D_pq_sim(j,1) / D_pq_the - 1;
%     end
% 
%     [~,~,err_D_neg_sim(i,1),err_D_pos_sim(i,1)] = calc_error_neg_pos(err_Dpq,P);
% 
% 
% end



