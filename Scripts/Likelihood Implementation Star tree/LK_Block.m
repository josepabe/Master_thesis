function LK=LK_Block(Block,mu,lamda,tList)
% LK_Block computes and returns the likelihood of a mortal block for all
% ancestral possibilities
% inputs:
% Block= Block data without ancestral information
% mu= death rate per link
% lamda= birth rate per link
% tList= list of divergence times

    LK=0;
    n=size(Block,2);
    start=(2^(n-1));%bi2de(cat(2,1,repmat(0,1,n-1)),'left-msb')
    stop=(2^n)-1; %bi2de(repmat(1,1,n),'left-msb')
    anc=[];
    
    for i=start:stop
        anc=[anc;de2bi(i,'left-msb')]
    end
    
    for m=1:size(anc,1)
        nseq=sum(anc(m,:)~=0);
        block=[anc(m,:);Block];
        b=subblocking(block);
        prob_col=1;
        sub_col=1;
        for n=1:size(b,1)
            leav=b{n}(2:end,:)
            prob_col=prob_col*col_prob(leav,tList,mu,lamda)
            sub_col=sub_col*Substitution(leav,tList);
        end
        gamma=(lamda/mu)^nseq;
        LK=LK+(gamma*prob_col*sub_col);
    end
    
    
end

