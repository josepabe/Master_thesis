function Log_LK_MSA=Log_Likelihood_MSA(MSA,tList,mu,lamda)
    [im_block,BlkList]=Blocking(MSA);
    Log_LK_MSA=0;
    
    if ~isempty(im_block)
        Selection=im_block{1}
        Log_LK_MSA=Log_LK_MSA+log(Lk_imBlock(Selection,mu,lamda,tList))
    else
        
        Log_LK_MSA=Log_LK_MSA+log(imm_prob(im_block,tList,mu,lamda))
    end
    
    for i=1:size(BlkList,1)
        Selection=BlkList{i}
        
        Log_LK_MSA=Log_LK_MSA+log(LK_Block(Selection,mu,lamda,tList))
        
    end
    
    p=1;
    for m=1:size(MSA,1)
        t=tList(m);
        p=p*p_0dt(mu,lamda,t);
    end
    
    p_hidden=1/(1-(lamda*p/mu));
    
    Log_LK_MSA=Log_LK_MSA+log(p_hidden)
    
        
    
end