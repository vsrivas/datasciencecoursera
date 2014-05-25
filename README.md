datasciencecoursera
===================

The file run_Analysis.R works as follows:

1. sets the working directory to my local working directory

2. reads the 3 test and train files and rbinds the correspong files,(subject_test to subject_train, X_test to X_train etc)

3. cbind the merged X and Y data to get the final merged data with 563 columns and 
   10,299 observations,1st column being subject, 2nd being Activity and rest 561 are variables
   
4. extracts the columns of mean and std (66 in number)
