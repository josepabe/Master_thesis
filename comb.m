function out=comb(leav,n)
    out=0;
    c=0;
    prob_set2=1;
    prob_set1=1;
    
    mu=0.6;
    lamda=0.4;
    tList=[0.5 0.5 0.5];
    
    for i=1:n
        pos=n-c;
        % also include the correction for 1,3
        if i<n-1
            set1=leav(:,1:end-i)
            set2=leav(:,pos:end)
            
            prob_set2=col_prob(set2,tList,mu,lamda,prob_set2)
            prob_set1=rec(set1)
            out=out+(prob_set2*prob_set1);
        elseif i==n-1
            set1= leav(:,1)
            set2= leav(:,2:end)
            
            prob_set2=col_prob(set2,tList,mu,lamda,prob_set2)
            prob_set1=col_prob(set1,tList,mu,lamda,prob_set1)
            out=out+(prob_set2*prob_set1);
        else
            set2= leav(:,1:end)
            prob_set2=col_prob(set2,tList,mu,lamda,prob_set2)
            out=out+prob_set2
        end    
        c=c+1;
    end
end


