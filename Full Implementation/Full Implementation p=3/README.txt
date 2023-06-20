
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


HOW TO RUN (an explicit example is given below)
  (i) "3optimal_rank_search" and "3optimal_rank_ideal_test" should be saved with .sage extensions. We suppose that Sage v9.2 can be run from the command line with the command "sage". 
 (ii) from all values of quadruples of (lambda1, lambda2, lower_m1, upper_m1)  which are desired to be searched over, the command 
            sage 3optimal_rank_search.sage lambda1 lambda2 lower_m1 upper_m1 sieve_bound
        should be run from the command line (with a desired sieve_bound). The key is that these can be run in parallel. 
 (iii) the files output from these should be combined and sorted by the first column. This can of course also be parallelized. 
       If the only files in the directory of the form 3optimal_*_searchdata.txt are the ones output by the commands above, then the commands
            cat 3optimal_*_searchdata.txt > 3optimal_searchdata.txt
            sort -n -r 3optimal_searchdata.txt -o 3optimal_searchdata_sorted.txt
        can be run from the command line to achieve this (although for a very large run, one would want to delete files once they are         copied and sorted, to save storage, and the sorting should be parallelized). Also, to ensure that commas are not           misinterpreted, one should run the command
             export LC_NUMERIC=C
   (v) the file from the previous step can then be called by "3optimal_rank_ideal_test.sage" as
            sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted
        to finish Algorithm 3.2. The output of this would be the file 
            3optimal_searchdata_sorted_discs.txt
  (vi) Alternatively, one could split the final step as described above. For some integer b, the commands 
            sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted b 0
            sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted b 1
            ....
            sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted b b-1
        could be run with the command ending in "b a" only processing discriminants congruent to a mod b. This would output files 
            3optimal_searchdata_sorted_discs_b_0.txt
            3optimal_searchdata_sorted_discs_b_1.txt
            ...
            3optimal_searchdata_sorted_discs_b_b-1.txt
        with the file ending in "b_a.txt" containing the processed discriminants congruent to a mod b. 

EXAMPLE:
    We will conduct a search for fields with a large 3-rank
          (-) without sieving
          (-) over the lambda pairs (1,1)
          (-) from lower_m1 = 512 to upper_m1 = 1023
    We will split the search into the following computations, given by the following parameters 
          (-) the lambda pair (1,1) and lower_m1 = 512 to upper_m1 = 575
          (-) the lambda pair (1,1) and lower_m1 = 576 to upper_m1 = 639
          (-) the lambda pair (1,1) and lower_m1 = 640 to upper_m1 = 703
          (-) the lambda pair (1,1) and lower_m1 = 704 to upper_m1 = 767
          (-) the lambda pair (1,1) and lower_m1 = 768 to upper_m1 = 831
          (-) the lambda pair (1,1) and lower_m1 = 832 to upper_m1 = 895
          (-) the lambda pair (1,1) and lower_m1 = 896 to upper_m1 = 959
          (-) the lambda pair (1,1) and lower_m1 = 960 to upper_m1 = 1023
    To do so, we firstly run the following from the command line
          sage 3optimal_rank_search.sage 1 1 512 575 0 &
          sage 3optimal_rank_search.sage 1 1 576 639 0 &
          sage 3optimal_rank_search.sage 1 1 640 703 0 &
          sage 3optimal_rank_search.sage 1 1 704 767 0 &
          sage 3optimal_rank_search.sage 1 1 768 831 0 &
          sage 3optimal_rank_search.sage 1 1 832 895 0 &
          sage 3optimal_rank_search.sage 1 1 896 959 0 &
          sage 3optimal_rank_search.sage 1 1 960 1023 0 &
    Then we combine this into one file and sort
          cat 3optimal_*_searchdata.txt > 3optimal_searchdata.txt
          sort -n -r 3optimal_searchdata.txt -o 3optimal_searchdata_sorted.txt
    We then process these and split them up modulo 11 (not 10, since discriminants have a bias mod 2) by running 
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 0 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 1 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 2 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 3 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 4 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 5 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 6 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 7 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 8 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 9 &
          sage 3optimal_rank_ideal_test.sage 3optimal_searchdata_sorted 11 10 &
   
        
