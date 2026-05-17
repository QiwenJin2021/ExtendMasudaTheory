function [D_sim_all] = calc_D_sim_all(D)

b = 0;
c10 = 1 / 2 + b;
c20 = 2 / 2 + b;
c30 = 3 / 2 + b;
c40 = 4 / 2 + b;
c32 = 5 / 2 + b;
c43 = 7 / 2 + b;
cmm = 6 / 2 + b;

D10 = calc_D_sim(D,c10);
D20 = calc_D_sim(D,c20);
D30 = calc_D_sim(D,c30);
D40 = calc_D_sim(D,c40);
D32 = calc_D_sim(D,c32);
D43 = calc_D_sim(D,c43);

% MMD

Dmm = calc_D_sim(D,cmm);

D_sim_all = [D10 D20 D30 D40 D32 D43 Dmm];

end