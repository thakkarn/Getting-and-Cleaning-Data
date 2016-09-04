# Getting-and-Cleaning-Data
Repository created to submit the classwork for Getting and Cleaning Data Class
The R script run_analysis.R does the following with the raw data provided for the project. 
Step 1: Merges the training and the test sets to create one data set.
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Step 3: Uses descriptive activity names to name the activities in the data set
Step 4: Labels the data set with descriptive variable names.
Step 5: From the data set in step 4, creates a second, # independent tidy data set with the average of each variable for each 
activity and each subject.

For Step 1, The following was done with the raw data in the script. 
- The environment was set to use dplyr package and working directory where the datafiles are stored. 
- The activity labels, training and test datafiles, subjects and feature data where read into R dataframes for processing. 
- The training and test data were merged into the preliminary dataset using rbind. 
- The column names in the preliminary dataset where set to feature names from the feature dataframe.

For Step 2, The following was done. 
- Mean and std features were selected from features data frame
- Second working dataframe was created with only the Mean and std features. 

For Step 3, The following was done. 
- The third working dataframe was created and subjects and activities were added using cbind function
- The column names were labeled with descriptive names
- The activity id in the working dataframe was replaced with descriptive activity names.
- Note, the activity names were not hardoded but derived from the activity lables using dplyr packages filter function. 
  
For Step 4 and 5, the following was done
- The working dataframe c_dataset1 was prepared to calculate average of each variable for each activity and each subject. 
- The aggregate function was used to calculate the average of each variable for each activity and each subject.
- The final tidydata dataframe was created with appropriate column names.  
- The data was written to a file using the write.table function. 
