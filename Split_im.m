function [im_blk,blk]=Split_im(ancs,Block)
    Block=[ancs;Block]
    inx=find(ancs, 1, 'first')
        if isempty(inx)
            im_blk=Block(:,1:end)
            blk=[]
        else
            im_blk=Block(:,1:inx-1)
            blk=Block(:,inx:end)
        end
end