function im_prob=imm_prob(leav,tList,mu,lamda)
% imm_prob calculates and return the likelihood of the given immortal block
% inputs:
% leav= immortal block with ancestral information
% tList=List of divergence times
% mu= death rate per link
% lamda= birth rate per link
    im_prob=1;
    if ~isempty(leav)
        
        for i=1:size(leav,1)
            t=tList(i);
            n=sum(leav(i,:)~='-');
            x=p_nddt(mu,lamda,t,n);
            im_prob=im_prob*x;
        end
    else
        for i=1:size(tList,2)
            t=tList(i);
            x=p_nddt(mu,lamda,t,1);
            im_prob=im_prob*x;
        end
    end
end