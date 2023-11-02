
# Methods for Finding Imaginary Quadratic Fields with High n-Rank

This repository contains the algorithms described in the paper titled "Improved Methods for Finding Imaginary Quadratic Fields with High n-Rank", along with several related algorithms developed by others. These are all implementations of various methods for finding discriminants of imaginary quadratic number fields whose class groups have a subgroup isomorphic to $(\mathbb{Z}/p\mathbb{Z})^2$ (for a given prime $p$). 

A PDF of (a near-final draft of) the paper can be viewed in this directory. The main implementation contained here is Algorithm 3.2 from the paper. 

The repository serves two main purposes:
* For researchers and developers working on algorithms and methods for finding quadratic number fields with non-trivial p-rank, this code facilitates easy testing and comparison.
* For those in need of examples of quadratic number fields with non-trivial p-rank, the code here allows for the rapid generation of such examples.

All code is written to be run in Sage v9.2 (earlier/ later versions of Sage/Python may/ may not work perfectly). 

There are two subdirectories contained here and these are described in more detail within the directories themselves. For a quick summary:
* Individual Algorithms:
    * Contains individual implementations of several search algorithms, including an easy-to-use, all-in-one, ready-to-go implementation of Algorithm 3.2. These are suitable for testing, comparison and small-scale, rapid generation of examples (small enough such that all data can be stored in memory). 
* Full Implementation
    * Contains a description of, and full implementation of, the complete search method used in the paper. This can be used for large-scale searches where data needs to be stored outside of memory, and where it needs to be broken up into multiple steps. This requires slightly more work on the part of the user, but should still be easy to use.  

### TLDR
For those who want a quick implementation of Algorithm 3.2 from the paper, importing modules and packages in Sage can be annoying, so the following may be easier: from the command line on a system with git, run 

```
git clone https://github.com/ChristianBagshaw/Improved-methods-for-finding-imaginary-quadratic-fields-with-high-n-rank.git
```

Then open Sage, and run the following 

```python 
from os import walk
folder = next(walk("Improved-methods-for-finding-imaginary-quadratic-fields-with-high-n-rank/Individual Algorithms"))
for filename in folder[2]:
    if filename.endswith('.sage'):
        load("Improved-methods-for-finding-imaginary-quadratic-fields-with-high-n-rank/Individual Algorithms/"+filename)
```

Algorithm 3.2 is now available as the function `p_rank_allsteps()`. Asking Sage for help via `help(p_rank_allsteps)` can get you started. 

If that is too much - the file you want is in `Individual Algorithms` called `p_rank_allsteps.sage`. 
