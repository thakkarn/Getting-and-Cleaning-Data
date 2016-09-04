# This R Script does the following
# Step 1: Merges the training and the test sets to create one data set.
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# Step 3: Uses descriptive activity names to name the activities in the data set
# Step 4: Labels the data set with descriptive variable names.
# Step 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.

#Set environment
library(dplyr)

setwd("C:/Users/Naimish/Documents/Navitech/ProfessionalDevelopment/DataScienceRelated/R_Programming")

# Read activity lables, data, subjects and feature data
file1 <- "./UCI HAR Dataset/activity_labels.txt"
activity_label <- read.table(file1, sep = " ") 
names(activity_label) <- c("Activity_Id", "Activity_Name")

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_activity_labels <- read.table("./UCI HAR Dataset/test/Y_test.txt")
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_activity_labels <- read.table("./UCI HAR Dataset/train/Y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#bind test_data and train_data into combined dataset in a variable c_dataset. C_ denotes
#combined dataset. 

c_dataset <- rbind(train_data, test_data)

# name columns of the dataset according to features
for (i in 1:ncol(c_dataset)) {
  names(c_dataset)[i] <- as.character(features[i,2])
}

#find mean and std features from features data frame
#meanStdColumns <- grep("mean|std", features$V2, value = FALSE)

meanStdColumnsNames <- grep("mean|std", features$V2, value = TRUE)

c_dataset0 <- c_dataset[,meanStdColumnsNames]

# prepare subjects and activities data with appropriate labels
  
c_subjects <- rbind(train_subjects, test_subjects)

c_activities <- rbind(train_activity_labels, test_activity_labels)

c_subj_activities <- cbind(c_subjects, c_activities)

names(c_subj_activities) <- c("Subject", "Activity_Id")

# create datatset1 with subject_activities, and feature values captured in dataset0

c_dataset1 <- cbind(c_subj_activities, c_dataset0)

# Replace activity_ids with descriptive activity names derived from the activity_labels file

c_dataset1$Activity_Id[c_dataset1$Activity_Id == "1"] <- as.character(filter(activity_label, activity_label$Activity_Id == "1")$Activity_Name)

c_dataset1$Activity_Id[c_dataset1$Activity_Id == "2"] <- as.character(filter(activity_label, activity_label$Activity_Id == "2")$Activity_Name)

c_dataset1$Activity_Id[c_dataset1$Activity_Id == "3"] <- as.character(filter(activity_label, activity_label$Activity_Id == "3")$Activity_Name)

c_dataset1$Activity_Id[c_dataset1$Activity_Id == "4"] <- as.character(filter(activity_label, activity_label$Activity_Id == "4")$Activity_Name)

c_dataset1$Activity_Id[c_dataset1$Activity_Id == "5"] <- as.character(filter(activity_label, activity_label$Activity_Id == "5")$Activity_Name)

c_dataset1$Activity_Id[c_dataset1$Activity_Id == "6"] <- as.character(filter(activity_label, activity_label$Activity_Id == "6")$Activity_Name)

names(c_dataset1)[names(c_dataset1) == "Activity_Id"] <- "Activity_Name"

# prepare data frame c_dataset1 to calculate average of each variable for 
# each activity and each subject. Use aggregate to calculate mean. Create a tidydata dataframe. 
c_dataset1["SubjectActivity"]<-paste(c_dataset1[,"Subject"],c_dataset1[,"Activity_Name"],"")

meanval_subject<-aggregate(c_dataset1[,3:81],by=list(c_dataset1$SubjectActivity),mean)

n_columns<-t(data.frame(strsplit(meanval_subject[,1]," ")))

# Create a final tidy data set. 
tidydata<-cbind(n_columns,meanval_subject[,2:80]) 

colnames(tidydata)[1:2]<-c("Subject", "Activity_Name") 

#Write the tidydata to a text file.  
write.table(tidydata,file="tidydata.txt",sep=",",row.names=F) 