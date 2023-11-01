# Individual Algorithms 

Here we have included implementations of several search methods discussed in the paper. The best way to understand these would be to read the relevant sections of the paper, as well as the references therein. 

Importing modules and packages in Sage can be annoying at times, so the simplest way to access these implementations is to load the files in this directory into Sage. Each of the search methods will then be available as a function (names, locations, and descriptions of these functions are given below). To load these into Sage, there are two options:
1. Download the files contained here, and to load a file `x.txt` simply run in Sage, `load('x.txt')`.
2. To load them all simultaneously, from the command line on a system with git, run 

    ```
    git clone https://github.com/ChristianBagshaw/Improved-methods-for-finding-imaginary-quadratic-fields-with-high-n-rank.git
    ```

    Then open Sage, and run the following 

    ```python 
    from os import walk
    folder = walk("Improved-methods-for-finding-imaginary-quadratic-fields-with-high-n-rank/Individual Algorithms")
    for file in folder:
        filename = file[2][0]
        if filename.endswith('.sage'):
            load("Improved-methods-for-finding-imaginary-quadratic-fields-with-high-n-rank/Individual Algorithms/"+filename)
    ```

The function names (and descriptions of what they are implementations of and where to find them) are as follows:

## p_rank_allsteps()
This function runs a full implementation of Algorithm 3.2 from the paper, and is found in `p_rank_allsteps.sage`.  This is definitively the most successful and efficient algorithm for generating fields with p-rank at least 2, and should be used if one is interested in quickly generating examples. This will run the entire algorithm on one node, in one computation. Thus, it is suitable for smaller computations, where all data can be stored in dictionaries. The best source for understanding this would be to read the paper, or one can ask Sage for help via `help(p_rank_allsteps)`. 



The function will take as input an odd prime p, a list of integer tuples [(lambda1, lambda2), ...], a value for lower\_m1 and a value for upper\_m1, and run the entirety of Algorithm 3.2 on these parameters. 

