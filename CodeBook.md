# Source dataset
The source dataset is taken from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The source dataset description is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

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

# Transformations
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

# Variables
`subject` - Subject who performed the activity

`activity` - Activity name

`avg-tBodyAcc-mean-X avg-tBodyAcc-mean-Y avg-tBodyAcc-mean-Z avg-tBodyAcc-std-X avg-tBodyAcc-std-Y avg-tBodyAcc-std-Z avg-tGravityAcc-mean-X avg-tGravityAcc-mean-Y avg-tGravityAcc-mean-Z avg-tGravityAcc-std-X avg-tGravityAcc-std-Y avg-tGravityAcc-std-Z avg-tBodyAccJerk-mean-X avg-tBodyAccJerk-mean-Y avg-tBodyAccJerk-mean-Z avg-tBodyAccJerk-std-X avg-tBodyAccJerk-std-Y avg-tBodyAccJerk-std-Z avg-tBodyGyro-mean-X avg-tBodyGyro-mean-Y avg-tBodyGyro-mean-Z avg-tBodyGyro-std-X avg-tBodyGyro-std-Y avg-tBodyGyro-std-Z avg-tBodyGyroJerk-mean-X avg-tBodyGyroJerk-mean-Y avg-tBodyGyroJerk-mean-Z avg-tBodyGyroJerk-std-X avg-tBodyGyroJerk-std-Y avg-tBodyGyroJerk-std-Z avg-tBodyAccMag-mean avg-tBodyAccMag-std avg-tGravityAccMag-mean avg-tGravityAccMag-std avg-tBodyAccJerkMag-mean avg-tBodyAccJerkMag-std avg-tBodyGyroMag-mean avg-tBodyGyroMag-std avg-tBodyGyroJerkMag-mean avg-tBodyGyroJerkMag-std avg-fBodyAcc-mean-X avg-fBodyAcc-mean-Y avg-fBodyAcc-mean-Z avg-fBodyAcc-std-X avg-fBodyAcc-std-Y avg-fBodyAcc-std-Z avg-fBodyAccJerk-mean-X avg-fBodyAccJerk-mean-Y avg-fBodyAccJerk-mean-Z avg-fBodyAccJerk-std-X avg-fBodyAccJerk-std-Y avg-fBodyAccJerk-std-Z avg-fBodyGyro-mean-X avg-fBodyGyro-mean-Y avg-fBodyGyro-mean-Z avg-fBodyGyro-std-X avg-fBodyGyro-std-Y avg-fBodyGyro-std-Z avg-fBodyAccMag-mean avg-fBodyAccMag-std avg-fBodyBodyAccJerkMag-mean avg-fBodyBodyAccJerkMag-std avg-fBodyBodyGyroMag-mean avg-fBodyBodyGyroMag-std avg-fBodyBodyGyroJerkMag-mean avg-fBodyBodyGyroJerkMag-std` - Computed averages
