% This function computes the probability of a character dies
function prob= p_0dt(mu,lamda,t)
beta_val=beta(mu,lamda,t);
prob=mu*beta_val;
end

