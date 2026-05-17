function [N_neg,N_pos] = calc_Ncrt_newModel(GSD,a,b,u,err_D_neg,err_D_pos)

    function e_neg = get_err_neg(N)
        [e_neg, ~] = calc_err_newModel(GSD, a, b, u, N);
    end

    function e_pos = get_err_pos(N)
        [~, e_pos] = calc_err_newModel(GSD, a, b, u, N);
    end

    % Solve N_neg ---------------------------------------------------------
    N_test = 1;
    max_val_neg = get_err_neg(N_test);   
    min_val_neg = get_err_neg(1e12); 
    if err_D_neg < 0 || err_D_neg < min_val_neg || err_D_neg > max_val_neg
        error('err_D_neg Exceeds the range of function values [%g, %g]', min_val_neg, max_val_neg);
    end

    N_low = 1;
    N_high = 1e12; 
    f_low = get_err_neg(N_low) - err_D_neg;
    f_high = get_err_neg(N_high) - err_D_neg;
    while sign(f_low) == sign(f_high) && N_high < 1e18
        N_high = N_high * 10;
        f_high = get_err_neg(N_high) - err_D_neg;
    end
    if sign(f_low) == sign(f_high)
        error('Unable to find interval containing zero point, please check the parameter or target error');
    end
    N_neg = fzero(@(N) get_err_neg(N) - err_D_neg, [N_low, N_high]);

    % Solve N_pos ---------------------------------------------------------
  
    max_val_pos = get_err_pos(N_test);   
    min_val_pos = get_err_pos(1e12);      
    if err_D_pos < 0 || err_D_pos > max_val_pos || err_D_pos < min_val_pos
        error('err_D_pos Exceeds the range of function values [%g, %g]', min_val_pos, max_val_pos);
    end

    N_low = 1;
    N_high = 1e12;
    f_low = get_err_pos(N_low) - err_D_pos;
    f_high = get_err_pos(N_high) - err_D_pos;
    while sign(f_low) == sign(f_high) && N_high < 1e18
        N_high = N_high * 10;
        f_high = get_err_pos(N_high) - err_D_pos;
    end
    if sign(f_low) == sign(f_high)
        error('Unable to find interval containing zero point, please check the parameter or target error');
    end
    N_pos = fzero(@(N) get_err_pos(N) - err_D_pos, [N_low, N_high]);

    N_neg = ceil(N_neg);
    N_pos = ceil(N_pos);

end