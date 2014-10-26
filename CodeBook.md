The key-variables (data frames):
1. trainData - raw train data read from fine
2. testData - raw test dataread from file
3. activity - activity descriptor read from file
4. subject - subject descriptor read from file
5. finalSet - the final "merged" data set containing test and train data supplemented with subject and activity descriptors (the latter ones in the number and descriptive forms); column names of the quantities - like in the SAMSUNG description, columns with descriptors: ActivityIDX, SubjectIDX and ActivityDescriptive
6. relevantFeatures - the final data set containing the mean and standard deviation values; obtained by subsetting the finalSet data set; supplemented with subject and activity descriptors (the latter ones in the number and descriptive forms); column names of the quantities - like in the SAMSUNG description, columns with descriptors: ActivityIDX, SubjectIDX and ActivityDescriptive.
7. finalSetMean - the final data set with the mean values for all possible combinations of activity/subject obtained from the relevantFeatures data set (thus containing only the mean and standard deviation values); supplemented with subject and activity descriptors (the latter ones in the number and descriptive forms); column names of the quantities - like in the SAMSUNG description, columns with descriptors: ActivityIDX, SubjectIDX and ActivityDescriptive.

The other variables are of auxiliary nature, the meaning of them should be clear after analysis of run_analysis.R.