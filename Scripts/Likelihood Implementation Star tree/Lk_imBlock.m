function LK_im=Lk_imBlock(Block,mu,lamda,tList)
% LK_imBlock computes and returns the likelihood of a immortal block for all
% ancestral possibilities
% inputs:
% Block= Block data without ancestral information
% mu= death rate per link
% lamda= birth rate per link
% tList= list of divergence times
n=size(Block,2);
stop=(2^(n-1))-1;

anc=[];
% generating ancestral possibilities for the immortal block where immortal
% block has atleast 1 descendent
for i=0:stop
    anc=[anc;de2bi(i,'left-msb',n)]
end

LK_im=0;

%Sub blocking based on the selected ancestor and computing the likelihood
for i=1:size(anc,1)
    [im_block,block]=Split_im(anc(i,:),Block)
    
    gamma_im=(1-(lamda/mu))
    prob_im=gamma_im*(imm_prob(im_block(2:end,:),tList,mu,lamda))
    sub_probim=0.25^size(im_block,2)
    
    if ~isempty(block)
        par=sum(block(1,:)~=0)
        gamma_m=(lamda/mu)^par
        b=subblocking(block)
        prob_col=1;
        sub_col=1;
        for n=1:size(b,1)
            leav=b{n}(2:end,:)
            prob_col=prob_col*col_prob(leav,tList,mu,lamda)
            sub_col=sub_col*Substitution(leav,tList)
        end
        
        LK_im=LK_im+(gamma_m*prob_im*sub_probim*prob_col*sub_col);
    else
        
        LK_im=LK_im+(prob_im*sub_probim)
    end
    
end

prob_empty_im=imm_prob([],tList,mu,lamda)

prob_empty_im=prob_empty_im*gamma_im
prob_blk=LK_Block(Block,mu,lamda,tList)
LK_im=LK_im+(prob_empty_im*prob_blk)

end