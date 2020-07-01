function p1=prob_b(s2,tList,mu,lamda,p1)
for i=1:size(s2,1)
    t=tList(i);
    if s2(i,1)=='#'
        n=sum(s2(i,:)=='#');
        x1=p_nt(mu,lamda,t,n);
    else
        n=sum(s2(i,:)=='#');
        if n==0
            x1=p_0dt(mu,lamda,t);
        else
            x1=p_ndt(mu,lamda,t,n);
        end
    end
    p1=p1*x1;
end
end