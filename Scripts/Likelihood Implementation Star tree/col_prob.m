function p=col_prob(leav,tList,mu,lamda)
% col_prob calculates and return the likelihood of the given mortal block
% inputs:
% leav= Mortal block with ancestral information
% tList=List of divergence times
% mu= death rate per link
% lamda= birth rate per link
    p=1;
    for i=1:size(leav,1)
            t=tList(i);
            if leav(i,1)~='-'
                disp('P_nt')
                n=sum(leav(i,:)~='-')
                x=p_nt(mu,lamda,t,n)
            else
                n=sum(leav(i,:)~='-')
                if n==0
                    disp('P_0dt')
                    x=p_0dt(mu,lamda,t)
                else
                    disp('P_ndt')
                    x=p_ndt(mu,lamda,t,n)
                end
            end
            p=p*x
    end
end