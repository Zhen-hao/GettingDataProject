---
title: "README.md"
author: "Zhenhao Li"
date: "23 Apr 2015"
output: html_document
---

## Download the dataset

Download the zip file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzip the file to the directory "UCI HAR Dataset" in the working directory where the "run_analysis.R" will be run.  

## Run the R script "run_analysis.R"
Make sure that the work directory is set to the same one in which the directory "UCI HAR Dataset" is before running "run_analysis.R".
Steps in the run_analysis.R are as follows:

###Step 0. Reads files.

```{r}
activityLab <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity_label_num","activity_label_name"))
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names=c("subject_num"))
featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
activityLabTest <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="activity_label_num")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names=c("subject_num"))
featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
activityLabTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="activity_label_num")

```

###Step 1. Merges the training and the test sets to create one data set.

```{r}
test <- cbind(subjectTest, activityLabTest, featuresTest)
train <- cbind(subjectTrain, activityLabTrain, featuresTrain)
data <- rbind(train, test)
```


###Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

After studying the "README.txt", "features.txt", "features_info.txt" in the dataset folder, we decided that "the measurements on the mean and standard deviation for each measurement" are the following "features" in the "features.txt" file: 

* 1  tBodyAcc-mean()-X
* 2  tBodyAcc-mean()-Y
* 3  tBodyAcc-mean()-Z
* 4  tBodyAcc-std()-X
* 5  tBodyAcc-std()-Y
* 6  tBodyAcc-std()-Z
* 41  tGravityAcc-mean()-X
* 42  tGravityAcc-mean()-Y
* 43  tGravityAcc-mean()-Z
* 44  tGravityAcc-std()-X
* 45  tGravityAcc-std()-Y
* 46  tGravityAcc-std()-Z
* 81  tBodyAccJerk-mean()-X
* 82  tBodyAccJerk-mean()-Y
* 83  tBodyAccJerk-mean()-Z
* 84  tBodyAccJerk-std()-X
* 85  tBodyAccJerk-std()-Y
* 86  tBodyAccJerk-std()-Z
* 121  tBodyGyro-mean()-X
* 122  tBodyGyro-mean()-Y
* 123  tBodyGyro-mean()-Z
* 124  tBodyGyro-std()-X
* 125  tBodyGyro-std()-Y
* 126  tBodyGyro-std()-Z
* 161  tBodyGyroJerk-mean()-X
* 162  tBodyGyroJerk-mean()-Y
* 163  tBodyGyroJerk-mean()-Z
* 164  tBodyGyroJerk-std()-X
* 165  tBodyGyroJerk-std()-Y
* 166  tBodyGyroJerk-std()-Z
* 201  tBodyAccMag-mean()
* 202  tBodyAccMag-std()
* 214  tGravityAccMag-mean()
* 215  tGravityAccMag-std()
* 227  tBodyAccJerkMag-mean()
* 228  tBodyAccJerkMag-std()
* 240  tBodyGyroMag-mean()
* 241  tBodyGyroMag-std()
* 253  tBodyGyroJerkMag-mean()
* 254  tBodyGyroJerkMag-std()
* 266  fBodyAcc-mean()-X
* 267  fBodyAcc-mean()-Y
* 268  fBodyAcc-mean()-Z
* 269  fBodyAcc-std()-X
* 270  fBodyAcc-std()-Y
* 271  fBodyAcc-std()-Z
* 345  fBodyAccJerk-mean()-X
* 346  fBodyAccJerk-mean()-Y
* 347  fBodyAccJerk-mean()-Z
* 348  fBodyAccJerk-std()-X
* 349  fBodyAccJerk-std()-Y
* 350  fBodyAccJerk-std()-Z
* 424  fBodyGyro-mean()-X
* 425  fBodyGyro-mean()-Y
* 426  fBodyGyro-mean()-Z
* 427  fBodyGyro-std()-X
* 428  fBodyGyro-std()-Y
* 429  fBodyGyro-std()-Z
* 503  fBodyAccMag-mean()
* 504  fBodyAccMag-std()
* 516  fBodyBodyAccJerkMag-mean()
* 517  fBodyBodyAccJerkMag-std()
* 529  fBodyBodyGyroMag-mean()
* 530  fBodyBodyGyroMag-std()
* 542  fBodyBodyGyroJerkMag-mean()
* 543  fBodyBodyGyroJerkMag-std()

The numbers of the above features correspond to the column numbers in the data frame "featuresTrain" and "featuresTest". Note that an above feature number n corespond to the column n+2 of the data frame "data".

We didn't chose features involving "meanFreq()" because it is "weighted average of the frequency components to obtain a mean frequency" and the weighted averaging process is not clear to us and should not be considered as a statistical mean.

To extract only the measurements on the mean and standard deviation for each measurement, we select the first two columns and the columns coresponding to the above features in the data frame "data" and save the result in the data frame "workData". We keep the first columns "subject_num" and "activity_label_num" to perform further steps and also to make the data better indexed. It is done by the following codes and the result is workData.

```{r}
workData <- data[, c(1,2,2+c(1:6,41:46,81:86,121:126, 161:166,201,202,214,215,227,228,240,241,253,254, 266:271, 345:350, 424:429,503,504, 516,517,529,530, 542,543))]

```

###Step3. Uses descriptive activity names to name the activities in the data set.
We replace the activity_label_num in the data frame "workData" with activity_label_name according to the way they are matched in the data frame "activityLab".
```{r}
NewData <- merge(activityLab, workData, by.x= "activity_label_num", by.y="activity_label_num", all=T)
finalData <- NewData[,names(NewData)!="activity_label_num"]
```
The effect of the above code is to replace each activity_label_num in workData with its coresponding activity_label_name, and save the result in finalData.

### Step 4. Appropriately labels the data set with descriptive variable names.

In Step 2, we explained how we chose the features. Note that a feature number n in the feature list given in Step 2 corespond to the column n+2 of the data frame "finalData". In this step, we are just to give each column that contains data of a furture its coresponding feature name. 

This is done by the Step 4 in the run_analysis.R and the result is the data frame "finalData".
```{r}
features <- read.table("./UCI HAR Dataset/features.txt")
f <- as.character(features[,2])
names(finalData) <- c("Activity","SubjectNumber", f[c(1:6,41:46,81:86,121:126, 161:166,201,202,214,215,227,228,240,241,253,254, 266:271, 345:350, 424:429,503,504, 516,517,529,530, 542,543)])
```

Then we save the dataframe "finalData" to the .csv file "tidy_data1.csv" as the tidy data after Step 4.

```{r}
write.csv(finalData,file = "tidy_data1.csv", row.names = F)
```

### Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Processes the data frame "finalData" by the following code to get the data frame "meanData".

```{r}
meltData <- melt(finalData,id=c("SubjectNumber","Activity") ,na.rm =T)
meanData <- dcast(meltData, SubjectNumber+Activity ~ variable,mean,na.rm=T)

```
Note that the names of meanData are the same as those of finalData. So we give meanData proper names by the following codes.

```{r}
names(meanData)[3:68] <- paste("the_mean_of_",names(meanData)[3:68],sep="")

```


Then we save the dataframe "meanData" to the .csv file "tidy_data2.csv" as the tidy data after Step 5.
```{r}
write.csv(meanData,file = "tidy_data2.csv", row.names = F)
```

