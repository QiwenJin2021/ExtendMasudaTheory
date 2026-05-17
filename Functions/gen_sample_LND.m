

function [Dp] = gen_sample_LND(GSD,CMD,N)

tn = normrnd(0,1,[N,1]);
Dp_ln = tn*log(GSD) + log(CMD);
Dp = exp(Dp_ln);

end