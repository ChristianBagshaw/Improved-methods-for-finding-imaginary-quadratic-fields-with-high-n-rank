
This subdirectory contains the code necessary for a large-scale implementation of Algorithm 3.2 - FOR p=3 ONLY. 
This avoids explicit ideal independence testing - to force this for p=3, see the other README file in ``Full Implementation''

The only real difference between this, and the code contained within "Small-scale implementation" is 
  (-) implementation of the factoring sieve 
  (-) data is not stored in memory (in dictionaries) but is written to files. this means that "manual" processing of data 
      is required throughout, but this is detailed and explained below. 
 
An example of how to run this is given at the bottom of this file, but the basic instructions are as follows:

There are two neccesary files: "3optimal_rank_search" and "3optimal_rank_ideal_test" which should both be saved with .sage extensions. 
Throughout we suppose that Sage v9.2 can be run from the command line with the command "sage". 

"3optimal_rank_search" 
    (-) this file carries out, essentially, lines 1-26 of Algorithm 3.2 fpr p=3, but data is stored in .txt files instead of                 dictionaries. 
    (-) if executed as is, say "sage 3optimal_rank_search.sage" is executed from the command line, then the user will be prompted to 
        input a value for lambda1, lambda2, lower_m1, upper_m1 and a sieve_bound (the largest prime to sieve over, set to 0 
        to skip sieving). 
    (-) to run directly from the command line, one should run 
            sage 3optimal_rank_search.sage lambda1 lambda2 lower_m1 upper_m1 sieve_bound
         with desired parameters. 
    (-) the output of this will be a .txt file 
            3optimal_`lambda1'_`lambda2'_`lower_m1'_`upper_m1'_searchdata.txt
        for example, if the command ``sage 3optimal_rank_search.sage 1 1 3 512 0'' was run from the command line, the output file             would be
            3optimal_1_1_3_512_searchdata.txt
        Each line of this file is of the form 
          ``delta, m''
        where delta denotes a fundamental discriminant, and m denotes the norm of a reduced, non-trivial ideal of order 3 in the             class group of Q(\sqrt(\delta)). 
    (-) additionally, the time taken for this computation will be output into the file 
            3optimal_`lambda1'_`lambda2'_`lower_m1'_`upper_m1'_searchdata_time.txt
       
 "3optimal_rank_ideal_test"
    (-) this file carries out, essentially, lines 27-29 in Algorithm 3.2, but data is read from a file containing data output
        from ``3optimal_rank_ideal_test''. We will call this file ``3optimal_searchdata_sorted.txt''
    (-) THE DATA IN THE FILE READ INTO ``3optimal_rank_ideal_test" MUST BE SORTED BY THE FIRST COLUMN/DISCRIMINANT. This is to be           able to collect all data corresponding to a given discriminant together, without storing the entire contents of the file into         memory. An example of how to do this is given below. 
    (-) if executed as is, say "sage 3optimal_rank_ideal_test.sage" is executed from the command line, then the user will be prompted         to input the name of the file to be read (input without the .txt extension).
    (-) this could also be run directly from the command line, as 
            sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted
    (-) the output of this will be a .txt file
            3optimal_searchdata_sorted_discs.txt
        containing discriminants whose corresponding quadratic field has a 3-rank of at least 2. 
    (-) there are multiple ways to parallelize this step, but one is implemented as follows. The command 
            sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted a b
        can be run from the command line for integers a > b. This will simply mean that only discriminants congruent to b mod a will 
        be processed. This does cause some unnecessary work (reading lines unnecessarily), but is simple and perhaps faster than 
        sorting/ splitting a very large file another way. 
    (-) similar to above, the time taken to compute the data now stored in the file X.txt will be stored in X_time.txt

