# -*- coding: utf-8 -*-
"""
Created on Wed Feb 19 09:32:06 2020

@author: Abel-PC
"""  
def TreeBuild(p,q,topology):
    p=str(p)
    q=str(q)
    fel_zone=[]
    far_zone=[]
    for index in range(len(topology)):
        if index==0:
            fel_zone.append("(")
            fel_zone.append(topology[index])
            fel_zone.append(':')
            fel_zone.append(p)
        elif index>0 and index%2==0:
            fel_zone.append(",")
            fel_zone.append("(")
            fel_zone.append(topology[index])
            fel_zone.append(':')
            fel_zone.append(p)

        else:
            fel_zone.append(",")
            fel_zone.append(topology[index])
            fel_zone.append(':')
            fel_zone.append(q)
 
    fel_zone.append("):")
    fel_zone.append(q)
    fel_zone.append(")")
    
    far_zone.append("(")
    for index in range(len(topology)):
        if index<=1:
            far_zone.append(topology[index])
            far_zone.append(':')
            far_zone.append(q)
            far_zone.append(",")
            if index==1:
                far_zone.append("(")   
        else:
            far_zone.append(topology[index])
            far_zone.append(':')
            far_zone.append(p)
            if index<(len(topology)-1):
                far_zone.append(",")
            
    far_zone.append("):")
    far_zone.append(q)
    far_zone.append(")")
    
    fel_tree="".join(fel_zone)
    far_tree="".join(far_zone)
    
    return [fel_tree,far_tree]

def WriteTree(objList,folder):
    i=0
    for obj in objList:
        path=folder+"/Fel_"+str(i)+".nwk"
        with open(path,"w+") as file:
            file.write(obj[0])
        
        path1=folder+"/Far_"+str(i)+".nwk"
        with open(path1,"w+") as file:
            file.write(obj[1])
        i=+1
        
        
        
top=('A','B','C','D')
direc="D:/Study/Thesis/Trees"
q=[0.15,0.4125,0.575]
i=len(q)
tList=[]
for val in q:
    p=q[i-1]
    trees=TreeBuild(p,val,top)
    tList.append(trees)
    i=-1
WriteTree(tList,direc)
