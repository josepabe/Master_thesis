% This function computes the probability of a character dies but gives
% birth to n characters
function prob= p_ndt(mu,lamda,t,n)
    beta_val=beta(mu,lamda,t);
    if n==0
        prob=mu*beta_val;
    else
        prob=(1-(exp(-mu*t))-(mu*beta_val))*(1-(lamda*beta_val))*((lamda*beta_val)^(n-1));
    end

end

