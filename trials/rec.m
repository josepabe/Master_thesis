function [prob,sprob]=rec(leav)

mu=0.6;
lamda=0.4;
tList=[0.5 0.5 0.5];

prob=0;
p=1;

sprobS1=1;


p=col_prob(leav,tList,mu,lamda,p);
sprob=Substitution(leav,tList)
prob=prob+p;

p_i=1;
prob_1=1;
s1=leav(:,end)
s2=leav(:,1:end-1)
p1=1;
while size(s2,2)>1
    disp('a')
    t_i=tList(find(s1(:,1)~='-'));
    
    sprobS1=sprobS1*Substitution(s1,tList)
    sprobS2=Substitution(s2,tList)
    
    p_i=prob_a(p_i,mu,lamda,tList,t_i);
    prob_1=prob_1*p_i;
    
    p1=prob_b(s2,tList,mu,lamda,p1);
    prob_c=prob_1*p1;
    prob=prob+prob_c;
    
    s1=s2(:,end)
    s2=s2(:,1:end-1)
    sprob=sprob+(sprobS1*sprobS2)
end
t_i=tList(find(s1(:,1)~='-'));

p_i=prob_a(p_i,mu,lamda,tList,t_i);
prob_1=prob_1*p_i;

p1=prob_b(s2,tList,mu,lamda,p1);

prob_c=prob_1*p1;
prob=prob+prob_c;

sprobS1=sprobS1*Substitution(s1,tList)
sprobS2=Substitution(s2,tList)
sprob=sprob+(sprobS1*sprobS2)


end
