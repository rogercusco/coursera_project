

#Getting and cleaning data - coursera project

#Introduction:

This repository contains R code ("run_analysis.R") that downloads and processes a dataset on Human Activity Recognition Using Smartphones.

It also contains a CodeBook.md that provides detailed information on the variables being analyzed and a txt file (averages_dataset.txt) containing the data set that results from the analysis.  

#What the script does:

run_analysis.R is a script containing R code that does the following: 
1. downloads the data from UCI Machine Learning Repository (for further information on this data visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
7. Creates a txt file with the tidy data set from step 6 called "averages_dataset.txt".

#How to run the analysis:

1. Set as your working directory in R or RStudio the directory where you have the script "run_analysis.R". 
2. Source de script "run_analysis.R" using source("run_analysis.R").

