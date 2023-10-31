# The file p_rank_allsteps.sage is a better source for understanding these functions. 
# see README in this directory


import time
from math import sqrt
import threading
import itertools
import numpy 






def rankcheck(p, forms_coeffs):
    """
    Takes in a list of coefficients, corresponding to binary quadratic forms of equal discriminant of order p, and returns True if these forms generate a subgroup of order at least p^2. This function makes use of Sage's BinaryQF package

    Input:
        p: an odd prime p, which must correspond to the order of the binary quadratic forms of equal discriminant of order p
        forms_coeffs: a list of lists [ [A_i, B_i, C_i] ] of coefficients of binary quadratic forms 
    """
    
    forms = []
    for coeff in forms_coeffs:
        
        # convert coefficients to binary quadratic forms using Sage's built in BinaryQF
        Qform = BinaryQF([coeff[0], coeff[1], coeff[2]]).reduced_form() 
        if Qform not in forms:
            forms.append(Qform)
    
    # full generated will contain the subgroup generated by the forms 
    full_generated = []

    counter = 0

    while counter < len(forms):


        if counter == 0:
            
            # the following adds powers of the first form to the subgroup
            f = forms[counter]
            f1 = f
            full_generated.append(f)
            counter = counter+1

            for power in range(1, p):
                f = (f*f1).reduced_form()
                full_generated.append(f)
            
        else:


            f = forms[counter] 
            counter += 1
            if f in full_generated:
                continue 

            # the following puts powers of the next forms into current_subgroup 
            current_subgroup = []
            f1 = f
            current_subgroup.append(f)
            for power in range(1, p):
                f = (f*f1).reduced_form()
                current_subgroup.append(f)

            # the product of current_subgroup and full_generated is taken and replaces full_generated
            new_generated = set()
            for element in itertools.product(current_subgroup, full_generated):
                new  = (numpy.prod(element)).reduced_form()
                new_generated.add(new)
            full_generated = list(new_generated)
            
            
            if len(full_generated) > p: #if the forms generate a subgroup of size larger than p, then we can conclude k > 1. 
    
                return(True)

    # return False if the forms do not generate a large enough subgroup.       
    return(False)



def RemoveDuplicates(dict1):
    for d in dict1:
        dict1[d] = list(set(dict1[d]))
    return dict1



# the data needs to be read from a file, after which it can be processed by rankcheck as normal. The biggest obstacle is that we cannot read in the entire file, so we need to loop over the lines and group together those corresponding to the same discriminant. 

def rankcheck_fromfile(p, searchfilename, discfilename, modulus, mod):
    
	
    discfile = open(discfilename + ".txt", 'w')
    
    
    with open(searchfilename+".txt", "rbU") as f:
        TOTAL_LINES = sum(1 for _ in f)

    
    F = open(searchfilename+".txt", 'r')
    
    line = F.readline()
    lines_read = 1
 
    while lines_read <= TOTAL_LINES:

        currentline  = str(line)
        currentline = currentline.replace(']', ' ') 
        currentline = currentline.replace('[', ' ')
        currentline = currentline.split(',')
 
        try: 
            d = Integer(currentline[0])
            Coeff1 = Integer(currentline[1])
            Coeff2 = Integer(currentline[2])
            Coeff3 = Integer(currentline[3])
            



        except Exception as errors:
            line = F.readline()
            lines_read += 1
            continue

        d_holder = d

        forms = []
        
        while d_holder == d:
            
            f = BinaryQF([Coeff1, Coeff2, Coeff3]).reduced_form()
            f = BinaryQF([f[0], abs(f[1]), f[2]])

            if f[0] != 1:
                forms.append(f)

            line = F.readline()
            lines_read += 1

            currentline  = str(line)
            currentline = currentline.replace(']', ' ') 
            currentline = currentline.replace('[', ' ')
            currentline = currentline.replace('\n', ' ')
            currentline = currentline.split(',')
         
            if lines_read > TOTAL_LINES:
                d_holder = 0 
                continue
            else:
                d_holder = Integer(currentline[0])
                Coeff1 = Integer(currentline[1])
                Coeff2 = Integer(currentline[2])
                Coeff3 = Integer(currentline[3])


            

        forms = list(set(forms))
        
        if (d % modulus) == mod:

            rank =  rankcheck(p, forms)


            if rank:
                discfile.write("%s" % d)
                discfile.write("%s" % "\n")
        
        
    discfile.close() 
    F.close()




try:
    p = Integer(sys.argv[1])
except:
    p = int(input("p =    "))
    
if len(sys.argv) < 3:
    searchfilename = raw_input("search data file name (without .txt):  ")
else:
    searchfilename = str(sys.argv[2])

if len(sys.argv) < 4:
    modulus = 1
    mod = 0
else:
    modulus = int(sys.argv[3])
    mod = int(sys.argv[4])

# searchfilename should contain the sorted ideal data


if modulus != 1:    
    discfilename = searchfilename+"_discs_"+str(modulus)+"_"+str(mod)
else:  
    discfilename = searchfilename+"_discs"



timefilename_ideals = discfilename+"_time"
start = time.time()
rankcheck_fromfile(p, searchfilename, discfilename, modulus, mod)
idealtime =  time.time() - start


FILE_time = open(str(timefilename_ideals)+".txt", 'a+')
FILE_time.write("%s" % idealtime)
FILE_time.write("%s" % "\n")
FILE_time.close()
    
    
print(discfilename, "done finding discriminants")
