
% 验证Masuda论文
clear all;clc;
addpath(genpath(pwd));

% 参数预设
P = 0.95;
u = 1.96; % For P = 0.95

% Distribution parameters
GSD = 1.6;
CMD = 5;
s = log(GSD);


N = [100,200,300,500,700,1000,2000,3000,5000,7000,10000,20000,30000,50000]; % 样本大小
N=N';
R = 1000; %重复次数

a = 5;
b = 0;
c = b + a/2;

err_limit = 0.05;

% 理论值
D_the = exp(log(CMD) + c * (log(GSD))^2);

% 理论误差
% Err_masuda = u * a * s * sqrt(2 * c^2 * s^2 + 1) ./ sqrt(N);


% 样本生成，粒径计算
for j = 1:length(N)
    u(j,1) = err_limit * sqrt(N(j)) / (a * s * sqrt(2 * c^2 * s^2 + 1));
    P_the(j,1) = 1 - 2 * normcdf(-u(j,1));
    for i = 1:R
        Dp = gen_sample_LND(GSD,CMD,N(j));
        D_sim(i,1) = calc_D_sim(Dp,c);

    end
    k = D_sim/D_the;
    e = k.^a - 1;
    e_p_ind = find(abs(e)<=0.05);
    P_sim(j,1) = length(e_p_ind) / R;

end
PP = [P_sim P_the];

% % 绘图
% numBins = 50;                           % 期望的 bin 数量
% minVal = 0.1;
% maxVal = 10;
% edges = logspace(log10(minVal), log10(maxVal), numBins+1);
%
% % 绘制直方图（使用自定义边界）
% histogram(k, edges, 'Normalization', 'pdf');
% set(gca, 'XScale', 'log');              % X 轴改为对数刻度



