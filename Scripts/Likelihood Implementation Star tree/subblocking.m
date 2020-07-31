function bList=subblocking(block)
% subblocking split a mortal block into subblocks such that each subblock defining 
% the fate of a signle ancestral link 
% inputs:
% Block= Gives fate of ancestral links of the selected ancestral sequence

    inx=find(block(1,:)==1);
    block(1,inx)='U';
    bList=[];
    
    for i=size(inx,2):-1:1
                
        if i==size(inx,2)
            bList=[bList;{block(:,inx(i):end)}];
        else
            stop=inx(i+1)-1;
            bList=[{block(:,inx(i):stop)};bList];
        end
    end
    
end