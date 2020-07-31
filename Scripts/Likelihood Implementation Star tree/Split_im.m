function [im_blk,blk]=Split_im(ancs,Block)
% splits the first block into mortal and immortal blocks again with respect
% to the ancestral sequence selected.
% Inputs:
% ancs= selected ancs sequence for the block
% Block= Contains sequence data on taxa 

    Block=[ancs;Block]
    inx=find(ancs, 1, 'first')
        if isempty(inx)
            im_blk=Block(:,1:end);
            blk=[];
        else
            im_blk=Block(:,1:inx-1);
            blk=Block(:,inx:end);
        end
end