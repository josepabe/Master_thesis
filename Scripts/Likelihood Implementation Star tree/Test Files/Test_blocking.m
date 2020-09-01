function Test_blocking(im_block,BlkList)
%MSA=[['-';'C';'-'] ['AT--';'--G-';'A--G'] ['G-';'TG';'--'] 
%['A-';'-C';'G-'] ['T-';'--';'AC']]
%%theta={[0.5 0.5 0.5] 0.1 0.01}
true={['-';'C';'-'];['AT--';'--G-';'A--G'];['G-';'TG';'--'];['A-';'-C';'G-'
    ];['T-';'--';'AC']};
block=[im_block;BlkList];
for inx=1:length(block)
    if isequal(block{inx},true{inx})
    continue
    else
    disp('Incorrect Blocking')
    break
    end
end
end