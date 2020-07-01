% This function computes the probability of a character survies and gives
% birth to n characters
function prob= p_nt(mu,lamda,t,n)
    beta_val=beta(mu,lamda,t);
    prob=(exp(-mu*t))*(1-(lamda*beta_val))*((lamda*beta_val)^(n-1));
end

