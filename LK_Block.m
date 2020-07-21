function LK=LK_Block(Block,mu,lamda,tList)
    LK=0;
    n=size(Block,2)
    start=(2^(n-1))%bi2de(cat(2,1,repmat(0,1,n-1)),'left-msb')
    stop=(2^n)-1 %bi2de(repmat(1,1,n),'left-msb')
    
    anc=[];
    for i=start:stop
        anc=[anc;de2bi(i,'left-msb')]
    end
    
%     prob_block=0;
%     sub_block=0;
    for m=1:size(anc,1)
        nseq=sum(anc(m,:)~='-')
        block=[anc(m,:);Block]
        b=subblocking(block);
        prob_col=1;
        sub_col=1;
        for n=1:size(b,1)
            leav=b{n}(2:end,:)
            prob_col=prob_col*col_prob(leav,tList,mu,lamda)
            sub_col=sub_col*Substitution(leav,tList)
        end
        gamma=(lamda/mu)^nseq;
%         prob_block=prob_block+prob_col;
%         sub_block=sub_block+sub_col;
        LK=LK+(gamma*prob_col*sub_col);
    end
    
    
end

