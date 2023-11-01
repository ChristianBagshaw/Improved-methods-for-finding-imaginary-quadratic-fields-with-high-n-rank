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
            load("Improved-methods-for-finding-imaginary-quadratic-fields-with-high-n-rank/Individual Algorithms/"+filename[2][0])
    ```

The function names (and descriptions of what they are implementations of and where to find them) are as follows:

## p_rank_allsteps(

