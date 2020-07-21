function bList=subblocking(block)
    inx=find(block(1,:)==1);
    block(1,inx)='U';
   % block(1,find(block(1,:)~='U'))='-';
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