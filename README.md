# Methods for Finding Imaginary Quadratic Fields with High n-Rank

This repository contains the algorithms described in the paper titled "Improved Methods for Finding Imaginary Quadratic Fields with High n-Rank", along with several related algorithms developed by others. In summary, it provides implementations of various methods for finding discriminants of imaginary quadratic number fields whose class groups have a subgroup isomorphic to (Z/pZ)^2 (for a given prime p). 

A PDF of (a near-final draft of) the paper can be viewed in this directory. The main implementation contained here is Algorithm 3.2 from the paper. 

The repository serves two main purposes:
* For researchers and developers working on algorithms and methods for finding quadratic number fields with non-trivial p-rank, this code facilitates easy testing and comparison.
* For those in need of examples of quadratic number fields with non-trivial p-rank, the code here allows for the rapid generation of such examples.
A PDF of (a near-final draft of) the paper can be viewed in this directory.

All code is written to be run in Sage v9.2 (earlier/ later versions may/ may not work perfectly). 

There are two subdirectories contained here and these are described in more detail within the directories themselves. For a quick summary:
* p_rank_algorithms: this contains individual implementations of a number of search algorithms, including a simple implementation of Algorithm 3.2. These are described in more detail within the directory itself, and should be used for testing, comparison and small-scale searches. In short: these are suitable for searches where all data can be stored in memory. 
* large_scale_search: this contains a description of, and full implementation of, of the complete search method used in the paper "Improved Methods for Finding Imaginary Quadratic Fields with High n-Rank". This can be used for large-scale searches where data needs to be stored outside of memory, and where it needs to be broken up into multiple steps.

### TLDR
For those who just want a quick implementation of Algorithm 3.2 from the paper: download the directory "p_rank_algorithms", run the following from directory containing "p_rank_algorithms", and then Algorithm 3.2 is available as the function "algorithm_3_2()". Asking Sage for help via "help(algorithm_3_2)" can get you started. 

```python 
from os import walk
folder = walk("p_rank_algorithms")
for file in folder:
    filename = file[2][0]
    if filename.endswith('.sage'):
        load(filename)
```

