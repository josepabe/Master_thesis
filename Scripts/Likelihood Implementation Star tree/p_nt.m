function prob= p_nt(mu,lamda,t,n)
% p_nt computes and return the probability of an ancestral link survies and gives
% birth to n links in its child
% inputs:
% mu= death rate per link
% lamda= birth rate per link
% t= divergence time associated with the child
% n= number of children born
    beta_val=beta(mu,lamda,t);
    prob=(exp(-mu*t))*(1-(lamda*beta_val))*((lamda*beta_val)^(n-1));
end

