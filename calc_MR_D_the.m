
% Calculate the M-R diameter of LND
% theoretically

function [D_pq_the] = calc_MR_D_the(paras,p,q)

% Method 1
D_p0 = exp(p*paras(:,2) + p^2/2*paras(:,3).^2);
D_q0 = exp(q*paras(:,2) + q^2/2*paras(:,3).^2);

% D_p0_p = D_p0.^p;
% D_q0_q = D_q0.^q;

aa = sum(paras(:,1).* D_p0);
bb = sum(paras(:,1).* D_q0);

D_pq_the = (aa / bb)^(1/(p-q));


% 已验证两种方法是一致的
% Method 2
% fun_p = @(x) x.^p .* combined_lognormal(x, paras);
% int_p = integral(fun_p,0,inf);
% 
% fun_q = @(x) x.^q .* combined_lognormal(x, paras);
% int_q = integral(fun_q,0,inf);
% 
% D_pq_the2 = (int_p / int_q)^(1/(p-q));


end