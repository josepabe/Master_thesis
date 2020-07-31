# -*- coding: utf-8 -*-
"""
This is just an example to demonstrate the functions calls of functions writeTrees and
seqText
"""
# importing required modules
import TreeCreator as treemod
import glob
import Seqdescriptiongenerator 

# Defining variables for tree generation
# User can change these
r=[2,4,6]
tau=2.5
topology=['A','D','B','C']

pathFar='D:\\Study\\Thesis\\Topology3\\treelength_2.5\\Trees\\Far_zone\\'
pathFel='D:\\Study\\Thesis\\Topology3\\treelength_2.5\\Trees\\Fel_zone\\'
pathEq='D:\\Study\\Thesis\\Topology3\\treelength_2.5\\Trees\\Eq_zone\\'
 
# Generating Trees               
treemod.writeTrees(tau,topology,r,pathFar,pathFel,pathEq)

# Defining variables for java code fragment generation for PIPJava simulator.
# User can change these
files_Eq=(glob.glob("D:/Study/Thesis/Topology3/treelength_7.5/Trees/Eq_Zone/*.nwk"))
files_Fel=(glob.glob("D:/Study/Thesis/Topology3/treelength_7.5/Trees/Fel_Zone/*.nwk"))
files_Far=(glob.glob("D:/Study/Thesis/Topology3/treelength_7.5/Trees/Far_Zone/*.nwk"))

file_Col=[files_Eq,files_Fel,files_Far]

path="D:/Study/Thesis/Seq_file_3_7.5.txt"

# Generating code fragment
Seqdescriptiongenerator.seqText(path,file_Col) 
