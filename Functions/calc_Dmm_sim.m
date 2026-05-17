function [Dmm] = calc_Dmm_sim(D)
% Calculate the mass median diameter Dmm
volume = D.^3;
[d_sorted, idx] = sort(D);  
v_sorted = volume(idx);           
total_volume = sum(v_sorted);      
cumulative_volume = cumsum(v_sorted);  
cumulative_percent = cumulative_volume / total_volume * 100; 
Dmm = interp1(cumulative_percent, d_sorted, 50, 'linear','extrap');

end