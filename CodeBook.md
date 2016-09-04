Title: Code Book for generating tidy data from Human Activity Recognition Using Smartphones Dataset.

Description: The document has two major sections with subsections. Two major sections are Study Design and Code Book. 
Study Design section provides details of the experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
The experiments generated datasets from the accelerometers from the Samsung Galaxy S smartphone that the subjects were wearing while engaging in 
various activities.  The codebook section describes various variables, the data, and any transformations or work that was performed to clean up the data.

Study Design:

The data source
•Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
•Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
the experiments captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments were video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) 
were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into 
body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Code Book:

The dataset includes the following files:

•'README.txt'


•'features_info.txt': Shows information about the variables used on the feature vector.


•'features.txt': List of all features.


•'activity_labels.txt': Links the class labels with their activity name.


•'train/X_train.txt': Training set.


•'train/y_train.txt': Training labels.


•'test/X_test.txt': Test set.


•'test/y_test.txt': Test labels.


The following files are available for the train and test data. Their descriptions are equivalent.

•'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


•'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.


•'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.


•'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


Transformation details

There are 5 parts:
1.Merges the training and the test sets to create one data set. 
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names.
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The run_analysis.R program implements the above steps. Please review readme file for the run_analysis script submitted. 

Major Variables of the Tidy Dataset:

Column 1: Subject: This column captures subjects 1 through 30. 

Column 2: Activity Name: This column captures the activities the subjects performed when they were wearing the Samsung Galaxy SII smartphones on their waist. 

Column 3-81: Averages of Mean and Standard Deviation of data collected by accelerometer and gyroscope sensors of the Samsung Galaxy SII smartphones that the 
subjects (Column 1) wore while performing activities listed in Activity Name (Column 2)







