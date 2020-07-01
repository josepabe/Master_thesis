function out=comb(leav,n)
    out=[];
    c=0;
    for i=1:n
        pos=n-c;
        % also include the correction for 1,3
        if i<n-1
            set1=leav(:,1:end-i)
            set2=leav(:,pos:end)
            perm=rec(set1)
            out=[out;{perm}];
        elseif i==n-1
            perm={leav(:,1)}
            out=[out;{perm}];
        else
            perm={leav(:,1:end)}
            out=[out;{perm}];
        end    
        c=c+1;
    end
end


