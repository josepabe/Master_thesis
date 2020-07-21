function subProb=Substitution(block,tList)
    u=0.25;
    set=['A' 'C' 'G' 'T'];
    trans=0.25;
    Prob1=1;
    subProb=0;
    for i=1:size(set,2)
        parent=set(i)
        for j=1:size(block,2)
            col=block(:,j)
            ti=find(col~='-')
            if j==1
                for k=1:length(ti)
                    t=ti(k)
                    bL=tList(t)
                    if col(t,1)==parent
                        prob=exp(-u*bL)+((1-exp(-u*bL))*trans);
                    else
                        prob=(1-exp(-u*bL))*trans;
                    end
                    Prob1=Prob1*prob;
                end
            else
                prob=trans;
            end
            Prob1=Prob1*prob;
        end
        subProb=subProb+Prob1;
    end
             
    
end