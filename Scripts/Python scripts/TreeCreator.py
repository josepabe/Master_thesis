"""
@author: Abel Thomson Joseph
This module contain functions which enables the user to generate newick trees.
"""
import os

def writeTrees(tau,topology,rList,pathFar,pathFel,pathEq):
    """
    Generates Equal, Farris and Felsenstein trees in newick format.
    
    Parameters
    ----------
    tau: tree length (Float)
    topology: The 4 taxas List(String) 
    rList: Long to short branch ratio List(Float)
    pathFar: location of directory for Farris trees
    pathFel: location of directory for Felsenstein trees
    pathEq: location of directory for Equal trees
    """
    
    #check if a paths exists and create if not existing
    if not os.path.exists(pathFar):
        os.makedirs(pathFar)
        
    if not os.path.exists(pathFel):
        os.makedirs(pathFel)
    
    if not os.path.exists(pathEq):
        os.makedirs(pathEq)
    
    
    for ratio in rList:
        # Generating Farris Tree
        farTrees= __farTree(tau,topology,ratio)
        # Generating Felsenstein Tree
        felTrees= __felTree(tau,topology,ratio)
        
        for idx in range(len(farTrees)):
            far_File=pathFar+'Far_'+str(idx+1)+'_'+str(ratio)+'.nwk'
            with open(far_File,'w+') as far:
                far.write(farTrees[idx])
                
        for idx in range(len(felTrees)):
            fel_File=pathFel+'Fel_'+str(idx+1)+'_'+str(ratio)+'.nwk'
            with open(fel_File,'w+') as fel:
                fel.write(felTrees[idx])
    
    # Generating Equal Tree
    EqTrees=__EqTree(tau,topology)
    for idx in range(len(EqTrees)):
            eq_File=pathEq+'Eq_'+str(idx+1)+'_1'+'.nwk'
            with open(eq_File,'w+') as eq:
                eq.write(EqTrees[idx]) 

def __EqTree(tau,topology):
    """ Function generates 2 Equal trees for the the given tree lengh tau and 
    topology. One with root on middle branch and other with root on a leaf branch """
    bLen=round(tau/5,3)
    rLen=round(bLen/2,3)
    tree1=['((']
    tree1.append(topology[0]+':'+str(bLen)+',')
    tree1.append(topology[1]+':'+str(bLen)+'):'+str(rLen)+',(')
    tree1.append(topology[2]+':'+str(bLen)+',')
    tree1.append(topology[3]+':'+str(bLen)+'):'+str(rLen)+');') 
    nwkTree1=''.join(tree1)
    
    tree2=['(((']  
    tree2.append(topology[0]+':'+str(bLen)+',')
    tree2.append(topology[1]+':'+str(bLen)+'):'+str(bLen)+',')
    tree2.append(topology[2]+':'+str(bLen)+'):'+str(rLen)+',')
    tree2.append(topology[3]+':'+str(rLen)+');')     
    nwkTree2=''.join(tree2)
    
    return [nwkTree1,nwkTree2]

def __felTree(tau,topology,ratio):
    """ Function generates 3 Felsenstine trees for the the given tree lengh tau, 
    topology and long to short branch ratio. One with root on middle branch, 
    another with root on a long leaf branch and other with root on a short leaf branch """
    
    # calculating p and q from the parameters ratio and tau
    p=round((tau*ratio)/(3+(2*ratio)),3)
    q=round(p/ratio,3)
    half_p=round(p/2,3)
    half_q=round(q/2,3)
    
    # Creating trees
    tree1=['((']
    tree1.append(topology[0]+':'+str(q)+',')
    tree1.append(topology[1]+':'+str(p)+'):'+str(half_q)+',(')
    tree1.append(topology[2]+':'+str(p)+',')
    tree1.append(topology[3]+':'+str(q)+'):'+str(half_q)+');') 
    nwkTree1=''.join(tree1)
    
    tree2=['(((']  
    tree2.append(topology[0]+':'+str(q)+',')
    tree2.append(topology[1]+':'+str(p)+'):'+str(q)+',')
    tree2.append(topology[2]+':'+str(p)+'):'+str(half_q)+',')
    tree2.append(topology[3]+':'+str(half_q)+');')     
    nwkTree2=''.join(tree2) 
    
    tree3=['(((']  
    tree3.append(topology[0]+':'+str(q)+',')
    tree3.append(topology[1]+':'+str(p)+'):'+str(q)+',')
    tree3.append(topology[3]+':'+str(q)+'):'+str(half_p)+',')
    tree3.append(topology[2]+':'+str(half_p)+');')     
    nwkTree3=''.join(tree3)
    
    return [nwkTree1,nwkTree2,nwkTree3]

def __farTree(tau,topology,ratio):
    
    """ Function generates 3 Farris trees for the the given tree lengh tau, 
    topology and long to short branch ratio. One with root on middle branch, 
    another with root on a long leaf branch and other with root on a short leaf branch """
    
    # calculating p and q from the parameters ratio and tau
    p=round((tau*ratio)/(3+(2*ratio)),3)
    q=round(p/ratio,3)
    half_p=round(p/2,3)
    half_q=round(q/2,3)
    
    # Creating trees
    tree1=['((']
    tree1.append(topology[0]+':'+str(p)+',')
    tree1.append(topology[1]+':'+str(p)+'):'+str(half_q)+',(')
    tree1.append(topology[2]+':'+str(q)+',')
    tree1.append(topology[3]+':'+str(q)+'):'+str(half_q)+');') 
    nwkTree1=''.join(tree1)
    
    tree2=['(((']  
    tree2.append(topology[0]+':'+str(p)+',')
    tree2.append(topology[1]+':'+str(p)+'):'+str(q)+',')
    tree2.append(topology[2]+':'+str(q)+'):'+str(half_q)+',')
    tree2.append(topology[3]+':'+str(half_q)+');')     
    nwkTree2=''.join(tree2) 
    
    tree3=['(']  
    tree3.append(topology[0]+':'+str(half_p)+',(')
    tree3.append(topology[1]+':'+str(p)+',(')
    tree3.append(topology[2]+':'+str(q)+',')
    tree3.append(topology[3]+':'+str(q)+'):'+str(q)+'):'+str(half_p)+');')     
    nwkTree3=''.join(tree3)
    
    return [nwkTree1,nwkTree2,nwkTree3]




            
