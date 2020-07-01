function prob=rec(leav)
%     a=[];
%     att=[];
%     a=[a;{att {leav}}];
mu=0.6;
lamda=0.4;
tList=[0.5 0.5 0.5];

prob=0;
p=1;

p=col_prob(leav,tList,mu,lamda,p);
prob=prob+p;

p_i=1;
prob_1=1;
s1=leav(:,end);
s2=leav(:,1:end-1);
p1=1;
while size(s2,2)>=1
    
    if size(s2,2)==1
         t_i=tList(find(s1(:,1)=='#'));
%         
%         for k=1:3
%             if ismember(k,t_i)
%                 px=p_nt(mu,lamda,tList(k),1)
%             else
%                 px=p_0dt(mu,lamda,tList(k))
%             end
%             p_i=p_i*px
%         end
          p_i=prob_a(p_i,mu,lamda,tList,t_i);
          prob_1=prob_1*p_i;
%         
%         for i=1:size(s2,1)
%             t=tList(i);
%             if s2(i,1)=='#'
%                 n=sum(s2(i,:)=='#')
%                 x1=p_nt(mu,lamda,t,n)
%             else
%                 n=sum(s2(i,:)=='#')
%                 if n==0
%                     x1=p_0dt(mu,lamda,t)
%                 else
%                     x1=p_ndt(mu,lamda,t,n)
%                 end
%             end
%             p1=p1*x1;
%         end
        p1=prob_b(s2,tList,mu,lamda,p1);
        
        prob_c=prob_1*p1;
        prob=prob+prob_c;
        break
    else
         t_i=tList(find(s1(:,1)=='#'));
%         
%         for k=1:3
%             if ismember(k,t_i)
%                 px=p_nt(mu,lamda,tList(k),1)
%             else
%                 px=p_0dt(mu,lamda,tList(k))
%             end
%             p_i=p_i*px
%         end
          p_i=prob_a(p_i,mu,lamda,tList,t_i);
          prob_1=prob_1*p_i;
%         
%         for i=1:size(s2,1)
%             t=tList(i);
%             if s2(i,1)=='#'
%                 n=sum(s2(i,:)=='#')
%                 x1=p_nt(mu,lamda,t,n)
%             else
%                 n=sum(s2(i,:)=='#')
%                 if n==0
%                     x1=p_0dt(mu,lamda,t)
%                 else
%                     x1=p_ndt(mu,lamda,t,n)
%                 end
%             end
%             p1=p1*x1;
%         end
        p1=prob_b(s2,tList,mu,lamda,p1);
        prob_c=prob_1*p1;
        prob=prob+prob_c;
    end
    
    %         att=[att {s1}];
    %         a=[a;{att {s2}}];
    s1=s2(:,end);
    s2=s2(:,1:end-1);
end

end
