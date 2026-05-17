function [err_P,err_avg] = calc_error2(errs,P)
%UNTITLED6 此处提供此函数的摘要

[N1, N2]= size(errs);
errs1 = abs(errs);

err_avg = sum(errs1,1)/N1;

err_P = prctile(errs1, P*100);



end