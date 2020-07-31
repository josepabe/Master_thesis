function prob= p_ndt(mu,lamda,t,n)
% p_ndt computes and return the probability of an ancestral link dying but gives
% birth to n links in its child
% inputs:
% mu= death rate per link
% lamda= birth rate per link
% t= divergence time associated with the child
% n= number of children born
    beta_val=beta(mu,lamda,t);
    if n==0
        prob=mu*beta_val;
    else
        prob=(1-(exp(-mu*t))-(mu*beta_val))*(1-(lamda*beta_val))*((lamda*beta_val)^(n-1));
    end

end

