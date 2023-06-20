This directory contains the code neccesary for a large-scale implementation of Algorithm 3.2. 

The only real difference between this, and the code contained within "Small-scale implementation" is 
  (-) implementation of the factoring sieve 
  (-) data is not stored in memory (in dictionaries) but is written to files. this means that "manual" processing of data 
      is required throughout, but this is detailed and explained below. 
 

An example of how to run this is given at the bottom of this file, but the basic instructions are as follows:

There are two neccesary files: "p_rank_search" and "p_rank_ideal_test" which should both be saved with .sage extensions. 
Throughout we suppose that Sage v9.2 can be run from the command line with the command "sage". 

"p_rank_search" 
    (-) this file carries out, essentially, lines 1-26 of Algorithm 3.2, but data is stored in .txt files instead of dictionaries. 
    (-) if executed as is, say "sage p_rank_search.sage" is executed from the command line, then the user will be prompted to 
        input a value for p, lambda1, lambda2, lower_m1, upper_m1 and a sieve_bound (the largest prime to sieve over, set to 0 
        to skip sieving). 
    (-) to run directly from the command line, one should run 
            sage p_rank_search.sage p lambda1 lambda2 lower_m1 upper_m1 sieve_bound
         with desired parameters. 
    (-) the output of this will be a .txt file 
            `p'_`lambda1'_`lambda2'_`lower_m1'_`upper_m1'_searchdata.txt
        for example, if the command ``sage p_rank_search.sage 5 1 1 3 512 0'' was run from the command line, the output file would be
            5_1_1_3_512_searchdata.txt
        each line of this file is of the form 
          ``delta, [A, B, C]''
        where delta denotes a fundamental discriminant, and A,B,C denote the coefficients of a binary quadratic form, corresponding to
        an ideal class in Q(\sqrt(delta)) of order p. 
       
 "p_rank_ideal_test"
    (-) this file carries out, essentially, lines 27-31 in Algorithm 3.2, but data is read from a file containing data output
        from ``p_rank_search''. We will call this file ``p_searchdata_sorted.txt''
    (-) THE DATA IN THE FILE READ INTO ``p_rank_ideal_test" MUST BE SORTED BY THE FIRST COLUMN/DISCRIMINANT. This is to be able to collect
        all data corresponding to a given discriminant together, without storing the entire contents of the file into memory. An example
        of how to do this is given below. 
    (-) if executed as is, say "sage p_rank_ideal_test.sage" is executed from the command line, then the user will be prompted to input
        a value for p, as well as the name of the file to be read (input without the .txt extension).
    (-) this could also be run directly from the command line, as 
            sage p_rank_ideal_test.sage p_searchdata_sorted
    (-) the output of this will be a .txt file
            p_searchdata_sorted_discs.txt
        containing discriminants whose corresponding quadratic field has a p-rank of at least 2. 
    (-) there are multiple ways to parallelize this step, but one is implemented as follows. The command 
            sage p_rank_ideal_test.sage p_searchdata_sorted a b
        can be run from the command line for integers a > b. This will simply mean that only discriminants congruent to b mod a will 
        be processed. This does cause some unnecessary work (reading lines unnecessarily), but is simple and perhaps faster than 
        sorting/ splitting the file another way. 

HOW TO RUN (an explicit example is given below)
  (i) "p_rank_search" and "p_rank_ideal_test" should be saved with .sage extensions. We suppose that Sage v9.2 can be run 
      from the command line with the command "sage". 
 (ii) from all values of quadruples of (lambda1, lambda2, lower_m1, upper_m1)  which are desired to be searched over, the command 
            sage p_rank_search.sage p lambda1 lambda2 lower_m1 upper_m1 sieve_bound
        should be run from the command line (with a desired sieve_bound). The key is that these can be run in parallel. 
 (iii) the files output from these should be combined and sorted by the first column. This can of course also be parallelized. 
       If the only files in the directory of the form p_*_searchdata.txt are the ones output by the commands above, then the commands
            cat p_*_searchdata.txt > p_searchdata.txt
            sort -n -r p_searchdata.txt -o p_searchdata_sorted.txt
        can be run from the command line to achieve this (although for a very large run, one would want to delete files once they are         copied and sorted, to save storage, and the sorting should be parallelized). 
   (v) the file from the previous step can then be called by "p_rank_ideal_test.sage" as
            sage p_rank_ideal_test.sage p p_searchdata_sorted
        to finish Algorithm 3.2. The output of this would be the file 
            p_searchdata_sorted_discs.txt
  (vi) Alternatively, one could split the final step as described above. For some integer b, the commands 
            sage p_rank_ideal_test.sage p p_searchdata_sorted b 0
            sage p_rank_ideal_test.sage p p_searchdata_sorted b 1
            ....
            sage p_rank_ideal_test.sage p p_searchdata_sorted b b-1
        could be run with the command ending in "b a" only processing discriminants congruent to a mod b. This would output files 
            p_searchdata_sorted_discs_b_0.txt
            p_searchdata_sorted_discs_b_1.txt
            ...
            p_searchdata_sorted_discs_b_b-1.txt
        with the file ending in "b_a.txt" containing the processed discriminants congruent to a mod b. 

EXAMPLE:
        
        
        
        
