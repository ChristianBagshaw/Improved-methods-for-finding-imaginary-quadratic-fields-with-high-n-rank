This repository contains the algorithms contained within "Improved methods for finding imaginary quadratic fields with high n-rank". 

A PDF of (a draft of) the paper can be viewed in this directory. 

All code is written to be run in Sage v9.2 (earlier/ later versions may/ may not work perfectly). The main code contained within this repository are implementations of Algorithm 3.2, which is the main algorithm used to search for quadratic fields with large p-rank. This code here produces the output of Algorithm 3.2, but does not contain anything regarding computing the class groups of these discriminants, as we simply used a built in function to do this. 

There are three main subdirectories, and more information about these can be found within them:
  (-) Individual Algorithms - this directory contains an implementation of ``Algorithm 3.1'' and an implementation of ``Dyd Ext''.    			These are not neccesarily made for any practical use (as Dyd Ext is quite slow, and Algorithm 3.1 is not very useful on its 				own). 
	(-) Small-scale Implementation - this directory contains the code needed for a smaller run of Algorithm 3.2. These computations 				should be suitable to be carried out on one node, and the entire Algorithm is carried out in one big step. 
	(-) Full Implementation - this directory contains the code needed for a full, large scale implementation of Algorithm 3.2, to 					conduct a large search for fields with large p-rank. The algorithm here is split into multiple parts, and data is stored into 			files which need to be processed throughout. 
	
As stated previously, more information about each of these directories can be found within them!
	
