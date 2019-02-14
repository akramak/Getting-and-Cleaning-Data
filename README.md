## Getting and Cleaning Data

This repostiory contains CodeBook.md, run_analysis.R, and tidy.txt files.

CodeBook.md describes the variables and the data in this repository.

The output tidy data set is tidy.txt.

The run_analysis.R script does the following to create the tidy.txt file:

Reads in raw data provided.
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
Creates a tidy data set with the average of each variable for each activity and each subject.

run_analysis.R can be opened in R or RStudio.
