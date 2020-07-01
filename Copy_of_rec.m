function a=rec(leav)
    a=[];
    att=[];
    a=[a;{att {leav}}];
    mu=0.6;
    lamda=0.4
    tList=[0.5 0.5 0.5];
    
    prob=0;
    p=1;
    
    for i=1:size(leav,1)
        t=t(i);
        if leav(i,1)=='#'
            n=sum(leav(i,:)=='#')
            x=p_nt(mu,lamda,t,n)
        else
            n=sum(leav(i,:)=='#')
            if n==0
                x=p_0dt(mu,lamda,t)
            else
                x=p_ndt(mu,lamda,t,n)
            end
        end
        p=p*x;
    end
    
    
    
    s1=leav(:,end);
    s2=leav(:,1:end-1);
    while size(s2,2)>=1
        t_i=t(find(s1(:,1)=='#'));
        p_i=p_nt(mu,lamda,t_i,1)*p_0dt(mu,lamda,0.5)*p_0dt(mu,lamda,0.5);
        
        att=[att {s1}];
        a=[a;{att {s2}}];
        s1=s2(:,end);
        s2=s2(:,1:end-1);
    end
    
end
