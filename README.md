
# Methods for Finding Imaginary Quadratic Fields with High n-Rank

This repository contains the algorithms described in the paper titled "Improved Methods for Finding Imaginary Quadratic Fields with High n-Rank", along with several related algorithms developed by others. These are all implementations of various methods for finding discriminants of imaginary quadratic number fields whose class groups have a subgroup isomorphic to (Z/pZ)^2 (for a given prime p). 

A PDF of (a near-final draft of) the paper can be viewed in this directory. The main implementation contained here is Algorithm 3.2 from the paper. 

The repository serves two main purposes:
* For researchers and developers working on algorithms and methods for finding quadratic number fields with non-trivial p-rank, this code facilitates easy testing and comparison.
* For those in need of examples of quadratic number fields with non-trivial p-rank, the code here allows for the rapid generation of such examples.

All code is written to be run in Sage v9.2 (earlier/ later versions of Sage/Python may/ may not work perfectly). 

There are two subdirectories contained here and these are described in more detail within the directories themselves. For a quick summary:
* Individual Algorithms:
    * Contains individual implementations of several search algorithms, including a simple implementation of Algorithm 3.2. These are suitable for testing, comparison and small-scale generation of examples (small enough such that all data can be stored in memory). 
* Full Implementation
    * Contains a description of, and full implementation of, the complete search method used in the paper. This can be used for large-scale searches where data needs to be stored outside of memory, and where it needs to be broken up into multiple steps.

### TLDR
For those who want a quick implementation of Algorithm 3.2 from the paper: download this repository, run the following in Sage from within the directory containing `Individual Algorithms`, and then Algorithm 3.2 is available as the function `p_rank_allsteps()`. Asking Sage for help via `help(p_rank_allsteps)` can get you started. 

```python 
from os import walk
folder = walk("Individual Algorithms")
for file in folder:
    filename = file[2][0]
    if filename.endswith('.sage'):
        load(filename)
```

