# Source dataset
The source dataset is taken from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The source dataset description is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## The experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Recorded data

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Source files

The following source files were used to create the tidy dataset:
* `features_info.txt`: Information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.
* `test/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample.

Notes:
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

# Tidy dataset

## Transformations

The following transformations were performed on the source dataset:

1. Read and join training and test measurement data.
2. Read and join training and test activities.
3. Read activyty names.
4. Label activities using descriptive names.
5. Discard everything but means and standard deviations.
6. Read and join training and test subjects.
7. Join subjects, activities and measurement data.
8. Fix column names (remove '()', add names for subject and activity columns).
9. Group and compute averages.
10. Fix column names (add 'avg' suffix).
11. Write data into a file.

## Variables

`subject` - Subject who performed the activity as a number from 1 to 30.

`activity` - Activity name, one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

`avg-tBodyAcc-mean-X avg-tBodyAcc-mean-Y avg-tBodyAcc-mean-Z avg-tBodyAcc-std-X avg-tBodyAcc-std-Y avg-tBodyAcc-std-Z avg-tGravityAcc-mean-X avg-tGravityAcc-mean-Y avg-tGravityAcc-mean-Z avg-tGravityAcc-std-X avg-tGravityAcc-std-Y avg-tGravityAcc-std-Z avg-tBodyAccJerk-mean-X avg-tBodyAccJerk-mean-Y avg-tBodyAccJerk-mean-Z avg-tBodyAccJerk-std-X avg-tBodyAccJerk-std-Y avg-tBodyAccJerk-std-Z avg-tBodyGyro-mean-X avg-tBodyGyro-mean-Y avg-tBodyGyro-mean-Z avg-tBodyGyro-std-X avg-tBodyGyro-std-Y avg-tBodyGyro-std-Z avg-tBodyGyroJerk-mean-X avg-tBodyGyroJerk-mean-Y avg-tBodyGyroJerk-mean-Z avg-tBodyGyroJerk-std-X avg-tBodyGyroJerk-std-Y avg-tBodyGyroJerk-std-Z avg-tBodyAccMag-mean avg-tBodyAccMag-std avg-tGravityAccMag-mean avg-tGravityAccMag-std avg-tBodyAccJerkMag-mean avg-tBodyAccJerkMag-std avg-tBodyGyroMag-mean avg-tBodyGyroMag-std avg-tBodyGyroJerkMag-mean avg-tBodyGyroJerkMag-std avg-fBodyAcc-mean-X avg-fBodyAcc-mean-Y avg-fBodyAcc-mean-Z avg-fBodyAcc-std-X avg-fBodyAcc-std-Y avg-fBodyAcc-std-Z avg-fBodyAccJerk-mean-X avg-fBodyAccJerk-mean-Y avg-fBodyAccJerk-mean-Z avg-fBodyAccJerk-std-X avg-fBodyAccJerk-std-Y avg-fBodyAccJerk-std-Z avg-fBodyGyro-mean-X avg-fBodyGyro-mean-Y avg-fBodyGyro-mean-Z avg-fBodyGyro-std-X avg-fBodyGyro-std-Y avg-fBodyGyro-std-Z avg-fBodyAccMag-mean avg-fBodyAccMag-std avg-fBodyBodyAccJerkMag-mean avg-fBodyBodyAccJerkMag-std avg-fBodyBodyGyroMag-mean avg-fBodyBodyGyroMag-std avg-fBodyBodyGyroJerkMag-mean avg-fBodyBodyGyroJerkMag-std` - Computed averages of means and standard deviations of each measurement for each subject and activity.
