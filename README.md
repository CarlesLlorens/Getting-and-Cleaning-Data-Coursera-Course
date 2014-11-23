Getting-and-Cleaning-Data-Coursera-Course
=========================================

Getting and Cleaning Data Coursera course

#Introduction

First, sorry for my English, I’m Spanish.

The objective for this project is obtain a cleaning data set that can be used for subsequent analysis. The initial information needed in the project are taken from multiple text files included in The UCI Machine Learning Repository.
The description and original dataset are taken from the web site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Project Summary

The repository contains 4 files:
- Readme.md : General information of the project
- CodeBook.md : A description of the original data, the job steps doing in the script and the description of final tidy dataset generated.
- run_analysis.R : The main script that makes the job of the course project
- tidyData.txt : The file of the tidy data obtained by the script run_analysis.R

The following is a summary description of the main project script.

The main R script (run_analysis.R) executes these tasks:
-	Read dataset from repository.
-	Produce a dataset obtained from the training and the test set.
-	From the original dataset extracts only the measurements on the mean and standard deviation for each measurement.
-	Uses descriptive activity names to name the activities in the data set 
-	Appropriately labels the data set with descriptive activity names. 
-	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Remarks on the Script submitted

To run the script you must modify the initial instructions that indicate the location of the files containing the data. Basically you need  to change the working directory and the folder that contains the original data.

#Additional Information

You can find additional information about the data and their transformations  in the file CodeBook.MD.
