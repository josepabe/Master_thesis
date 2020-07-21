function out=comb(leav,n)
    out=0;
    c=0;
    prob_set2=1;
    prob_set1=1;
    
    sub_set1=1
    sub_set2=1;
    
    
    mu=0.6;
    lamda=0.4;
    tList=[0.5 0.5 0.5];
    
    for i=1:n
        pos=n-c;
        
        if i<n-1
            set1=leav(:,1:end-i)
            set2=leav(:,pos:end)
            
            sub_set2=Substitution(set2,tList)
            
            prob_set2=col_prob(set2,tList,mu,lamda,prob_set2)
            [prob_set1,sub_set1]=rec(set1)
            out=out+(prob_set2*prob_set1*sub_set2*sub_set1);
            
        elseif i==n-1
            set1= leav(:,1)
            set2= leav(:,2:end)
            
            sub_set2=Substitution(set2,tList)
            sub_set1=Substitution(set1,tList)
            
            prob_set2=col_prob(set2,tList,mu,lamda,prob_set2)
            prob_set1=col_prob(set1,tList,mu,lamda,prob_set1)
            out=out+(prob_set2*prob_set1*sub_set2*sub_set1);
        else
            set2= leav(:,1:end)
            sub_set2=Substitution(set2,tList)
            prob_set2=col_prob(set2,tList,mu,lamda,prob_set2)
            out=out+(prob_set2*sub_set2)
        end    
        c=c+1;
    end
end


