function sub_blk=sub_imblk(imblk)
% sub_imblk calculates and returns the substitution probability of immortal
% block
% inputs:
% imblk= Gives fate of ancestral immortal link
    sub_blk=1
    for j=1:size(imblk,2)
        sub_blk=sub_blk*0.25
        
    end
end