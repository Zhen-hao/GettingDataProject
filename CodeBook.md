---
title: "CodeBook.md"
author: "Zhenhao Li"
date: "24 Apr 2015"
output: html_document
---
## Data Source

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### About the study
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Feature Selection 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Notes:
Features are normalized and bounded within [-1,1].
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The gyroscope units are rad/seg.
A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: http://www.youtube.com/watch?v=XOEN9W05_4A

##Data Collection
The file README.md contains details about how the dataset "tidy_data1.csv" is obtained.

##Code Book 

### Variables in tidy_data1.csv and tidy_data_1.txt
#### IMPORTANT! The details of the meanings of the following variable names can be found in the session "Data Source". We provide the details of the unit and the range in this code book. We explain the meaning of tBodyAcc-mean()-X and hope that the reader can obtain the meanings of other variables from this example and the session "Data Source".  

#### Activity
Identifies activity performed by the subject for each window sample.
Its values are "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

####SubjectNumber
Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

####tBodyAcc-mean()-X
Indicates the mean of the body acceleration along the X axial for each window sample.
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAcc-mean()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].


####tBodyAcc-mean()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].


####tBodyAcc-std()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].


####tBodyAcc-std()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].


####tBodyAcc-std()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].


####tGravityAcc-mean()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].


####tGravityAcc-mean()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].


####tGravityAcc-mean()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tGravityAcc-std()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tGravityAcc-std()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tGravityAcc-std()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccJerk-mean()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccJerk-mean()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccJerk-mean()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccJerk-std()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccJerk-std()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccJerk-std()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyGyro-mean()-X
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyro-mean()-Y
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyro-mean()-Z
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyro-std()-X
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyro-std()-Y
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyro-std()-Z
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroJerk-mean()-X
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroJerk-mean()-Y
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroJerk-mean()-Z
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroJerk-std()-X
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroJerk-std()-Y
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroJerk-std()-Z
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyAccMag-mean()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccMag-std()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tGravityAccMag-mean()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tGravityAccMag-std()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccJerkMag-mean()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyAccJerkMag-std()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####tBodyGyroMag-mean()
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroMag-std()
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroJerkMag-mean()
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####tBodyGyroJerkMag-std()
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyAcc-mean()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAcc-mean()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAcc-mean()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAcc-std()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAcc-std()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAcc-std()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAccJerk-mean()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAccJerk-mean()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAccJerk-mean()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAccJerk-std()-X
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAccJerk-std()-Y
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAccJerk-std()-Z
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyGyro-mean()-X
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyGyro-mean()-Y
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyGyro-mean()-Z
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyGyro-std()-X
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyGyro-std()-Y
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyGyro-std()-Z
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyAccMag-mean()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyAccMag-std()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyBodyAccJerkMag-mean()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyBodyAccJerkMag-std()
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####fBodyBodyGyroMag-mean()
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyBodyGyroMag-std()
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyBodyGyroJerkMag-mean()
The units are rad/seg.
The values are normalized and bounded within [-1,1].

####fBodyBodyGyroJerkMag-std()
The units are rad/seg.
The values are normalized and bounded within [-1,1].


### Variables in tidy_data2.csv and tidy_data_2.txt
#### IMPORTANT! The details of the meanings of the following variable names can be found in the session "Data Source". We provide the details of the unit and the range in this code book. We explain the meaning of the_mean_of_tBodyAcc-mean()-X and hope that the reader can obtain the meanings of other variables from this example and previous sessions.  

####SubjectNumber
Identifies activity performed by the subject for each window sample.
Its values are "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

####Activity
Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

####the_mean_of_tBodyAcc-mean()-X
Identifies the mean of the values of the variable tBodyAcc-mean()-X in the tidy_data1.csv for each activity and each subject.
The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
The values are normalized and bounded within [-1,1].

####the_mean_of_tBodyAcc-mean()-Y
####the_mean_of_tBodyAcc-mean()-Z
####the_mean_of_tBodyAcc-std()-X
####the_mean_of_tBodyAcc-std()-Y
####the_mean_of_tBodyAcc-std()-Z
####the_mean_of_tGravityAcc-mean()-X
####the_mean_of_tGravityAcc-mean()-Y
####the_mean_of_tGravityAcc-mean()-Z
####the_mean_of_tGravityAcc-std()-X
####the_mean_of_tGravityAcc-std()-Y
####the_mean_of_tGravityAcc-std()-Z
####the_mean_of_tBodyAccJerk-mean()-X
####the_mean_of_tBodyAccJerk-mean()-Y
####the_mean_of_tBodyAccJerk-mean()-Z
####the_mean_of_tBodyAccJerk-std()-X
####the_mean_of_tBodyAccJerk-std()-Y
####the_mean_of_tBodyAccJerk-std()-Z
####the_mean_of_tBodyGyro-mean()-X
####the_mean_of_tBodyGyro-mean()-Y
####the_mean_of_tBodyGyro-mean()-Z
####the_mean_of_tBodyGyro-std()-X
####the_mean_of_tBodyGyro-std()-Y
####the_mean_of_tBodyGyro-std()-Z
####the_mean_of_tBodyGyroJerk-mean()-X
####the_mean_of_tBodyGyroJerk-mean()-Y
####the_mean_of_tBodyGyroJerk-mean()-Z
####the_mean_of_tBodyGyroJerk-std()-X
####the_mean_of_tBodyGyroJerk-std()-Y
####the_mean_of_tBodyGyroJerk-std()-Z
####the_mean_of_tBodyAccMag-mean()
####the_mean_of_tBodyAccMag-std()
####the_mean_of_tGravityAccMag-mean()
####the_mean_of_tGravityAccMag-std()
####the_mean_of_tBodyAccJerkMag-mean()
####the_mean_of_tBodyAccJerkMag-std()
####the_mean_of_tBodyGyroMag-mean()
####the_mean_of_tBodyGyroMag-std()
####the_mean_of_tBodyGyroJerkMag-mean()
####the_mean_of_tBodyGyroJerkMag-std()
####the_mean_of_fBodyAcc-mean()-X
####the_mean_of_fBodyAcc-mean()-Y
####the_mean_of_fBodyAcc-mean()-Z
####the_mean_of_fBodyAcc-std()-X
####the_mean_of_fBodyAcc-std()-Y
####the_mean_of_fBodyAcc-std()-Z
####the_mean_of_fBodyAccJerk-mean()-X
####the_mean_of_fBodyAccJerk-mean()-Y
####the_mean_of_fBodyAccJerk-mean()-Z
####the_mean_of_fBodyAccJerk-std()-X
####the_mean_of_fBodyAccJerk-std()-Y
####the_mean_of_fBodyAccJerk-std()-Z
####the_mean_of_fBodyGyro-mean()-X
####the_mean_of_fBodyGyro-mean()-Y
####the_mean_of_fBodyGyro-mean()-Z
####the_mean_of_fBodyGyro-std()-X
####the_mean_of_fBodyGyro-std()-Y
####the_mean_of_fBodyGyro-std()-Z
####the_mean_of_fBodyAccMag-mean()
####the_mean_of_fBodyAccMag-std()
####the_mean_of_fBodyBodyAccJerkMag-mean()
####the_mean_of_fBodyBodyAccJerkMag-std()
####the_mean_of_fBodyBodyGyroMag-mean()
####the_mean_of_fBodyBodyGyroMag-std()
####the_mean_of_fBodyBodyGyroJerkMag-mean()
####the_mean_of_fBodyBodyGyroJerkMag-std()
