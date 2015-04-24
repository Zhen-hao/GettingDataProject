## run_analysis.R


library (plyr)
library(reshape2)

# Step 0
## Reads files

## activity_labels.txt
## Rename the columns:  Set the first column name to be "activity_label_num", and the second "activity_label_name"
activityLab <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity_label_num","activity_label_name"))

## subject_test.txt
## Rename the columns: set the only column name to be subject_num
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names=c("subject_num"))


## X_test.txt

featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt")


## y_test.txt
## Set the only column name to be "activity_label_num", 
activityLabTest <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="activity_label_num")

## subject_train.txt
## Rename the columns: set the only column name to be subject_num
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names=c("subject_num"))


## X_train.txt

featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")


## y_train.txt
## Set the only column name to be "activity_label_num", 
activityLabTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="activity_label_num")

# Step 1
## Merges the training and the test sets to create one data set.

## merge the test data sets into one
## The column names will be subject_num, activity_label_num, V1, V2,...,
test <- cbind(subjectTest, activityLabTest, featuresTest)

## merge the train data sets into one
## The column names will be subject_num, activity_label_num, V1, V2,...,
train <- cbind(subjectTrain, activityLabTrain, featuresTrain)

##merge the test and train data sets into one
## The column names will be subject_num, activity_label_num, V1, V2,...,
data <- rbind(train, test)

# Step 2
## Extracts only the measurements on the mean and standard deviation for each measurement.

workData <- data[, c(1,2,2+c(1:6,41:46,81:86,121:126, 161:166,201,202,214,215,227,228,240,241,253,254, 266:271, 345:350, 424:429,503,504, 516,517,529,530, 542,543))]

# Step 3
## Uses descriptive activity names to name the activities in the data set
## to do so, we replace the activity_label_num in workData with activity_label_name according to the way they are matched in the data frame activityLab.

NewData <- merge(activityLab, workData, by.x= "activity_label_num", by.y="activity_label_num", all=T)
finalData <- NewData[,names(NewData)!="activity_label_num"]
## The effect of the above code is to replace each activity_label_num in workData with its coresponding activity_label_name, and save the result in finalData.

# Step 4
## Appropriately labels the data set with descriptive variable names. 

names(finalData) <- c("Activity","SubjectNumber","tBodyAcc-mean()-X","tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z",           "tBodyAcc-std()-X",           
                       "tBodyAcc-std()-Y","tBodyAcc-std()-Z",           
                       "tGravityAcc-mean()-X",  "tGravityAcc-mean()-Y",       
                     "tGravityAcc-mean()-Z","tGravityAcc-std()-X",        
                      "tGravityAcc-std()-Y","tGravityAcc-std()-Z",        
                       "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y",      
                       "tBodyAccJerk-mean()-Z",  "tBodyAccJerk-std()-X",       
                       "tBodyAccJerk-std()-Y"   ,     "tBodyAccJerk-std()-Z",      
                       "tBodyGyro-mean()-X"     ,     "tBodyGyro-mean()-Y" ,      
                       "tBodyGyro-mean()-Z"      ,    "tBodyGyro-std()-X"   ,       
                       "tBodyGyro-std()-Y"        ,   "tBodyGyro-std()-Z"    ,      
                       "tBodyGyroJerk-mean()-X"    ,  "tBodyGyroJerk-mean()-Y",     
                       "tBodyGyroJerk-mean()-Z"     , "tBodyGyroJerk-std()-X"  ,    
                       "tBodyGyroJerk-std()-Y"  ,     "tBodyGyroJerk-std()-Z"   ,   
                       "tBodyAccMag-mean()"      ,    "tBodyAccMag-std()",
                       "tGravityAccMag-mean()"    ,   "tGravityAccMag-std()",       
                       "tBodyAccJerkMag-mean()"    ,  "tBodyAccJerkMag-std()",      
                       "tBodyGyroMag-mean()"        , "tBodyGyroMag-std()"    ,     
                       "tBodyGyroJerkMag-mean()",     "tBodyGyroJerkMag-std()" ,    
                        "fBodyAcc-mean()-X"       ,    "fBodyAcc-mean()-Y"       ,   
                        "fBodyAcc-mean()-Z"        ,   "fBodyAcc-std()-X"         ,  
                        "fBodyAcc-std()-Y"          ,  "fBodyAcc-std()-Z"          , 
                        "fBodyAccJerk-mean()-X"  ,     "fBodyAccJerk-mean()-Y"      ,
                        "fBodyAccJerk-mean()-Z"   ,    "fBodyAccJerk-std()-X"       ,
                     "fBodyAccJerk-std()-Y"    ,    "fBodyAccJerk-std()-Z"       ,
                    "fBodyGyro-mean()-X"      ,    "fBodyGyro-mean()-Y"         ,
                    "fBodyGyro-mean()-Z"      ,    "fBodyGyro-std()-X"          ,
                    "fBodyGyro-std()-Y"       ,    "fBodyGyro-std()-Z"          ,
                    "fBodyAccMag-mean()"      ,    "fBodyAccMag-std()"          ,
                    "fBodyBodyAccJerkMag-mean()",  "fBodyBodyAccJerkMag-std()"  ,
                    "fBodyBodyGyroMag-mean()",     "fBodyBodyGyroMag-std()",
                     "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()")

##Note that this can be done by the following code as well.
##features <- read.table("./UCI HAR Dataset/features.txt")
## f <- as.character(features[,2])
## names(finalData) <- c("Activity","SubjectNumber", f[c(1:6,41:46,81:86,121:126, 161:166,201,202,214,215,227,228,240,241,253,254, 266:271, 345:350, 424:429,503,504, 516,517,529,530, 542,543)])

## save finalData to the .csv file "tidy_data1.csv"
write.csv(finalData,file = "tidy_data1.csv", row.names = F)
write.table(finalData, "tidy_data_1.txt", row.name=F,quote=F)


#Step 5
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

###Step 5.1 get the data set
meltData <- melt(finalData,id=c("SubjectNumber","Activity") ,na.rm =T)
meanData <- dcast(meltData, SubjectNumber+Activity ~ variable,mean,na.rm=T)

###Step 5.2 rename the variables
names(meanData)[3:68] <- paste("the_mean_of_",names(meanData)[3:68],sep="")

###Step 5.3 save the dataset to tidy_data2.csv and tidy_data_2.txt
write.csv(meanData,file = "tidy_data2.csv", row.names = F)
write.table(meanData, "tidy_data_2.txt", row.name=F,quote=F)
