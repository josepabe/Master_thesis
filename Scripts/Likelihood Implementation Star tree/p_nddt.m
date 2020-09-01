function prob= p_nddt(mu,lamda,t,n)
% p_nddt computes and return the probability of an ancestral immortal link 
% birth to n links in its child
% inputs:
% mu= death rate per link
% lamda= birth rate per link
% t= divergence time associated with the child
% n= number of children born
beta_val=beta(mu,lamda,t);
%including the link
n=n+1;
%calculating the probability
prob=(1-(lamda*beta_val))*((lamda*beta_val)^(n-1));
end