function p_i=prob_a(p_i,mu,lamda,tList,t_i)


for k=1:3
    if ismember(k,t_i)
        px=p_nt(mu,lamda,tList(k),1);
    else
        px=p_0dt(mu,lamda,tList(k));
    end
    p_i=p_i*px;
end

end