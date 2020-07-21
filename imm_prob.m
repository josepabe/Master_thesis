function im_prob=imm_prob(leav,tList,mu,lamda)
    im_prob=1;
    if ~isempty(leav)
        
        for i=1:size(leav,1)
            t=tList(i)
            n=sum(leav(i,:)~='-')
            x=p_nddt(mu,lamda,t,n);
            im_prob=im_prob*x;
        end
    else
        for i=1:size(tList,2)
            t=tList(i)
            x=p_nddt(mu,lamda,t,1)
            im_prob=im_prob*x;
        end
    end
end