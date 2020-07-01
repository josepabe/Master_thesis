% This function computes the probability of a immortal link giving
% birth to n characters
function prob= p_nddt(mu,lamda,t,n)
beta_val=beta(mu,lamda,t);
prob=(1-(lamda*beta_val))*((lamda*beta_val)^(n-1));
end