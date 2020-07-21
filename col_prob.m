function p=col_prob(leav,tList,mu,lamda)
    p=1;
    for i=1:size(leav,1)
            t=tList(i);
            if leav(i,1)~='-'
                n=sum(leav(i,:)~='-');
                x=p_nt(mu,lamda,t,n);
            else
                n=sum(leav(i,:)~='-');
                if n==0
                    x=p_0dt(mu,lamda,t);
                else
                    x=p_ndt(mu,lamda,t,n);
                end
            end
            p=p*x;
    end
end