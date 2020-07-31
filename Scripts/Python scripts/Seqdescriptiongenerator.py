"""
@author: Abel Thomson Joseph

This module contains functions that generate the java code text for 
PIPJava simulator used to genenerate alignment for provided trees

"""
import re

def seqText(path,file_Col):
    """ This generate the java code text for PIPJava simulator
        
        Parameters
        ----------
        path: the output file location, String
        file_Col: the list of paths of directories containng Equal,
        Farris and Felsenstein trees in newick format.
        
    """
    # Opening the output file for writing
    with open(path,'w+') as file:
        for loc in file_Col:
            for item in loc:
               # Extracting required contents 
               try:
                   found = re.search("Zone\\\\(.+?).nwk",item).group(1)
                   extract = re.search("D(.+?)\\\\",item).group(1)
               except AttributeError:
                   print("not extracted")
               
               # writing into output file
               file.write("""expectedLength = 50;\nchangeIntensity = 0.0098;
                          \nnReplica = 1;\nnTaxa = 4;\ntreeRate = 1;""")
               file.write('\nfileTree="D'+extract+"/"+found+'.nwk";')
               outdir="output_"+found+"_50";
               file.write('\noutdir="'+outdir+'";')
               file.write("\ngenerate(new File(Execution.getFile(outdir)));\n\n")
                                               
               file.write("""expectedLength = 500;\nchangeIntensity = 0.00998;
                          \nnReplica = 1;\nnTaxa = 4;\ntreeRate = 1;""")
               file.write('\nfileTree="D'+extract+"/"+found+'.nwk";')
               outdir="output_"+found+"_500";
               file.write('\noutdir="'+outdir+'";')
               file.write("\ngenerate(new File(Execution.getFile(outdir)));\n\n")
                                               
               file.write("""expectedLength = 5000;\nchangeIntensity = 0.00999;\
                          \nnReplica = 1;\nnTaxa = 4;\ntreeRate = 1;""")
               file.write('\nfileTree="D'+extract+"/"+found+'.nwk";')
               outdir="output_"+found+"_5000";
               file.write('\noutdir="'+outdir+'";')
               file.write("\ngenerate(new File(Execution.getFile(outdir)));\n\n")
           
          
    
    