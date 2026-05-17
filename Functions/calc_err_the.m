
% Calculate the uncertainty of M-R diameter of multimodal distribution
% theoretically

function [Err_pq] = calc_err_the(paras,p,q,u,N)

w = paras(:,1);
mu = paras(:,2);
sigma = paras(:,3);
k = length(w);

sigma2 = sigma.^2;
A_i = zeros(k,1);
B_i = zeros(k,1);
delta_p_i = zeros(k,1);
delta_q_i = zeros(k,1);
for i = 1:k
    A_i(i) = exp(mu(i)+0.5*p*sigma2(i));
    B_i(i) = exp(mu(i)+0.5*q*sigma2(i));

    % Unmodified errors
%     delta_p_i(i) = u * p * sigma(i) * sqrt(2 * (0 + p/2)^2 * sigma2(i) + 1) / sqrt(N);
%     delta_p_i(i) = exp(log(1+delta_p_i(i))/p)-1;
% 
%     delta_q_i(i) = u * q * sigma(i) * sqrt(2 * (0 + q/2)^2 * sigma2(i) + 1) / sqrt(N);
%     if q~=0
%     delta_q_i(i) = exp(log(1+delta_q_i(i))/q)-1;
%     end

% Modified errors
    delta_p_i(i) = calc_err_Masuda_Dp0_Modified(paras(i,:),p,u,N);
    if q~=0
    delta_q_i(i) = calc_err_Masuda_Dp0_Modified(paras(i,:),q,u,N);
    end


end

A = sum(w.* A_i.^p);
B = sum(w.* B_i.^q);

tmp_A = zeros(k,1);
tmp_B = zeros(k,1);

for i = 1:k

    tmp_A(i) = (w(i) * A_i(i)^p * delta_p_i(i))^2;
    tmp_B(i) = (w(i) * B_i(i)^q * delta_q_i(i))^2;

end

tmp_As = sum(tmp_A);
tmp_Bs = sum(tmp_B);

delta = 1/(p-q) * (A/B)^(1/(p-q)-1) * sqrt(tmp_As*p^2/B^2 + tmp_Bs * q^2 * A^2/B^4);

D_calc = (A/B)^(1/(p-q));
Err_pq = delta / D_calc;
% Err_pq = delta;

end