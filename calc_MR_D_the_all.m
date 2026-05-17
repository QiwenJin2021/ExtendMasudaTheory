function [D_pq_the] = calc_MR_D_the_all(CMD,GSD)
% Calculate the M-R diameter of LND
% theoretically

b = 0;
c10 = 1 / 2 + b;
c20 = 2 / 2 + b;
c30 = 3 / 2 + b;
c40 = 4 / 2 + b;
c32 = 5 / 2 + b;
c43 = 7 / 2 + b;
cmm = 6 / 2 + b;

D10 = exp(log(CMD) + c10 * (log(GSD))^2);
D20 = exp(log(CMD) + c20 * (log(GSD))^2);
D30 = exp(log(CMD) + c30 * (log(GSD))^2);
D40 = exp(log(CMD) + c40 * (log(GSD))^2);
D32 = exp(log(CMD) + c32 * (log(GSD))^2);
D43 = exp(log(CMD) + c43 * (log(GSD))^2);

% MMD
% a=6,b=0
Dmm = exp(log(CMD) + cmm * (log(GSD))^2);

D_pq_the = [D10 D20 D30 D40 D32 D43 Dmm];

end
