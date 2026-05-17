

function [Dp_sim] = calc_D_sim(D,c)

D_ln = log(D);
m = mean(D_ln);
s2 = var(D_ln);
Dp_sim = exp(m + c * s2);


end