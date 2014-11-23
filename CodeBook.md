#Source Data

The initial information needed in the project are taken from multiple text files included in The UCI Machine Learning Repository.
The description and original dataset are taken from the web site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Data Set Information

The dataset contains information over a series of experiments that have been carried out with a group of some volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#Attribute Information

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A vector with 561 features with time and frequency domain variables.
- Its activity label.
- An identifier of the person who who carried out the experiment.

# Brief description of job steps doing in the script

###Read data from files and name attributes

Initially the script read all file texts needed for make the job. These files are:

- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt-
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

The script read these files and assign column names to train and test datasets. 

###Merge the training and the test sets to create one data set
Next, the script merges the train and test datasets and generates one dataset saving all column names in a variable.

###Extract only the measurements on the mean and standard deviation for each measurement

The script selects the necessary attributes. For do this, search in the column names which attributes corresponds to a mean or standard deviation. Later create a dataset with only the necessary columns.

###Use descriptive activity names to name the activities in the data set

Later, the script merge the dataset obtained with the activityType dataset for include the descriptive activity names

###Appropriately label the data set with descriptive activity names
Later, the script change columnNames vector for to give better descriptive names to the columns. 

###Create a second, independent tidy data set with the average of each variable for each activity and each subject

Finally, we need to produce only a dataset with the average of each variable for each activity and subject. This dataset is written to a text file.

#Result tidy dataset

The final dataset created has the next columns:

- activityId
- subjectId	
- timeBodyAccMagnitudeMean	
- timeBodyAccMagnitudeStdDev
- timeGravityAccMagnitudeMean
- timeGravityAccMagnitudeStdDev
- timeBodyAccJerkMagnitudeMean
- timeBodyAccJerkMagnitudeStdDev
- timeBodyGyroMagnitudeMean
- timeBodyGyroMagnitudeStdDev
- timeBodyGyroJerkMagnitudeMean
- timeBodyGyroJerkMagnitudeStdDev
- freqBodyAccMagnitudeMean
- freqBodyAccMagnitudeStdDev
- freqBodyAccJerkMagnitudeMean
- freqBodyAccJerkMagnitudeStdDev
- freqBodyGyroMagnitudeMean
- freqBodyGyroMagnitudeStdDev
- freqBodyGyroJerkMagnitudeMean
- freqBodyGyroJerkMagnitudeStdDev
- activityLabel

corresponding to the identification of activity and his label, identification of the subject and the mean and the standard deviation of features extracted from the original dataset.
