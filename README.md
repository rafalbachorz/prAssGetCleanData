The script "run_analysis.R" makes the following steps to accomplish the tasks in the programming assignment.

1. Reads the data "train" data, the "train activity" descriptors and the "train subject" descriptors; puts all in the "trainData" data frame.
2. Reads the data "test" data, the "test activity" descriptors and the "test subject" descriptors; puts all in the "testData" data frame.
3. Merges above data frames into the final one - finalSet - and "translates" the activity number descriptors into the human-readable descriptive ones (by using the activity labels read from the file).
4. Extracts the mean and standard deviation columns from the finalSet (resulting data frame: relevantFeatures).
5. Supplement the resulting data frame - relevantFeatures - with subject and activity descriptors (the latter ones in the number and descriptive forms).
6. Calculates the mean values of all possible combinations activity/subject for the data in the relevantFeatures; resulting data frame: finalSetMean.
7. Cleans up the environment.
8. Writes the finalSetMean data frame on the file according to the remarks.

Read "CodeBook.md" for further information.