## Methods for Finding Imaginary Quadratic Fields with High n-Rank

This repository contains the algorithms described in the paper titled "Improved Methods for Finding Imaginary Quadratic Fields with High n-Rank," along with several related algorithms developed by others. In summary, it provides implementations of various methods for finding discriminants of imaginary quadratic number fields whose class groups have a subgroup isomorphic to (Z/pZ)^2 (for a given prime p). 

The repository serves two main purposes:
* For researchers and developers working on algorithms and methods for finding quadratic number fields with non-trivial p-rank, this code facilitates easy testing and comparison.
* For those in need of examples of quadratic number fields with non-trivial p-rank, the code here allows for the rapid generation of such examples.
A PDF of (a near-final draft of) the paper can be viewed in this directory.

All code is written to be run in Sage v9.2 (earlier/ later versions may/ may not work perfectly). The main code contained within this repository are implementations of Algorithm 3.2, which is the main algorithm we used to search for quadratic fields with large p-rank. 

Importing custom packages in Sage can sometimes be difficult, so the easiest way to use these algorithms is to 'load' the files here. This can be done by downloading the directory "p_rank_code" and running, in Sage from the directory containing "p_rank_code", 

```python 
from os import walk
folder = walk("p_rank_code")
for file in folder:
    filename = file[2][0]
    if filename.endswith('.sage'):
        load(filename)
```
