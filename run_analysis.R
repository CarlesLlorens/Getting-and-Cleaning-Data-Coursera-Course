##########################################################################################################
# Getting and Cleaning Data Course Project
# Version V1
# Date last modification: 22/11/2014

# Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##########################################################################################################


# Clean up workspace
rm(list=ls())

# Set working directory
setwd("C:/Coursera/Getting_Cleaning_Data")

# IMPORTANT: Directory that contain all original data files.
dataFolder = './UCI HAR Dataset/'

# 1. Merge the training and the test sets to create one data set.
#################################################################

# Read data from files
features       = read.table(paste(dataFolder,'features.txt',sep=""),header=F) 
activityLabels = read.table(paste(dataFolder,'activity_labels.txt',sep=""),header=F)
subjectTrain   = read.table(paste(dataFolder,'train/subject_train.txt',sep=""),header=F)
xTrain         = read.table(paste(dataFolder,'train/x_train.txt',sep=""),header=F)
yTrain         = read.table(paste(dataFolder,'train/y_train.txt',sep=""),header=F)
subjectTest    = read.table(paste(dataFolder,'test/subject_test.txt',sep=""),header=F)
xTest          = read.table(paste(dataFolder,'test/x_test.txt',sep=""),header=F)
yTest          = read.table(paste(dataFolder,'test/y_test.txt',sep=""),header=F)

# Change column names
colnames(activityLabels) = c('activityId','activityLabel');
colnames(subjectTrain)   = "subjectId";
colnames(xTrain)         = features[,2]; 
colnames(yTrain)         = "activityId";
colnames(subjectTest)    = "subjectId";
colnames(xTest)          = features[,2]; 
colnames(yTest)          = "activityId";

# Merge subjectTrain, xTrain and yTrain 
data.train = cbind(subjectTrain,xTrain,yTrain);

# Merge the subjectTest, xTest, and yTest 
data.test = cbind(subjectTest,xTest,yTest);

# Bind trainingData and testData
data.total = rbind(data.train,data.test);

# Make a vector with all the column names of data.total.
# Later this vector will be used to select and transform some column names.
columnNames  = colnames(data.total); 

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
###########################################################################################

# Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
column.seleted = (grepl("activity..",columnNames) | grepl("subject..",columnNames) | grepl("-mean..",columnNames) & !grepl("-meanFreq..",columnNames) & !grepl("mean..-",columnNames) | grepl("-std..",columnNames) & !grepl("-std()..-",columnNames));

# Subset data.total table based on the column.seleted.
# This results in a data.total table that only contains the selected columns.
data.total = data.total[column.seleted==TRUE];

# 3. Use descriptive activity names to name the activities in the data set.
###########################################################################

# Merge the data.total dataset with the acitivityLabels dataset to include Activity Labels
data.total = merge(data.total,activityLabels,by='activityId',all.x=TRUE);

# Update columnNames with the names of columns of data.total dataset
columnNames  = colnames(data.total); 

# 4. Appropriately label the data set with descriptive activity names. 
######################################################################

# Change columnNames vector for to give better descriptive names
for (i in 1:length(columnNames)) 
{
  columnNames[i] = gsub("\\()","",columnNames[i])
  columnNames[i] = gsub("-std$","StdDev",columnNames[i])
  columnNames[i] = gsub("-mean","Mean",columnNames[i])
  columnNames[i] = gsub("^(t)","time",columnNames[i])
  columnNames[i] = gsub("^(f)","freq",columnNames[i])
  columnNames[i] = gsub("AccMag","AccMagnitude",columnNames[i])
  columnNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",columnNames[i])
  columnNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",columnNames[i])
  columnNames[i] = gsub("([Gg]ravity)","Gravity",columnNames[i])
  columnNames[i] = gsub("[Gg]yro","Gyro",columnNames[i])
  columnNames[i] = gsub("GyroMag","GyroMagnitude",columnNames[i])
  columnNames[i] = gsub("JerkMag","JerkMagnitude",columnNames[i])
};

# Reassigning the new descriptive column names to the finalData set
colnames(data.total) = columnNames;

# 5. Create a second, independent tidy data set with the average of 
#    each variable for each activity and each subject. 
###################################################################

# Create dataset data.totalNoActLabels from data.total without the column activityLabel
data.totalNoActLabels = data.total[,names(data.total) != 'activityLabel'];

# Summarize dataset data.totalNoActLabels to include the mean of each variable for each activity and each subject
tidyData = aggregate(data.totalNoActLabels[,names(data.totalNoActLabels) != c('activityId','subjectId')],by=list(activityId=data.totalNoActLabels$activityId,subjectId = data.totalNoActLabels$subjectId),mean);

# Merge dataset tidyData with activityLabels table to include descriptive activity names
tidyData = merge(tidyData,activityLabels,by='activityId',all.x=TRUE);

# Export dataset tidyData and create txt file
write.table(tidyData, './tidyData.txt',row.names=F,sep='\t');
