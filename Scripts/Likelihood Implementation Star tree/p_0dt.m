% This function computes the probability of a character dies
function prob= p_0dt(mu,lamda,t)
% p_0dt computes and return the probability of an ancestral dying without   
% giving birth to any links in its child
% inputs:
% mu= death rate per link
% lamda= birth rate per link
% t= divergence time associated with the child

beta_val=beta(mu,lamda,t);
prob=mu*beta_val;
end

