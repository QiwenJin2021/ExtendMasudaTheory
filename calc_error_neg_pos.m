function [err_P,err_avg,err_P_neg,err_P_pos] = calc_error_neg_pos(errs,P)

errs_abs = abs(errs);

err_avg = mean(errs_abs);

err_P = prctile(errs_abs, P*100);

% Negative error
errs_neg_ind = errs<0;
errs_neg = errs(errs_neg_ind);
errs_neg = abs(errs_neg);
err_P_neg = prctile(errs_neg, P*100);

% Positive error
errs_pos_ind = errs>=0;
errs_pos = errs(errs_pos_ind);
err_P_pos = prctile(errs_pos, P*100);


end