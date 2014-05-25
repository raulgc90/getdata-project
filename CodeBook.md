## Code book

### Description of input data

For both folders, train and test, there are the files *X_*, *Y_* and *subject_*.

The *X_* files contains most of the variables with the corresponding mean, standard deviation, maximum, minimum, energy, etc.

The *Y_* files contains the activity type.

The *subject_* files contains the identifier of the subject for each row.

#### Description of variables

The variables are the result of several experiments of a research explained in this [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> For each record it is provided:
> 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.

### Process

All those files (train data, test data) were loaded into R using the *read.table* function. The activity type and subject column where merged within the rest of variables using the *cbind* function.

Then train and test datasets were merged  using the *rbind* function.

#### Column names

The column names were read from the *features.txt* file into a table and then set into the working dataset using the *names* function.

#### Activity labels

The labels for the activity types were read from the *activity_labels.txt* file and set into the working dataset with the *levels* function.

#### Choosen columns

Only the columns containing the strings *mean()* and *std()* were choosen, as they represent the mean and standard deviation of each variable. A subset was made using only those columns.

### Tidy dataset

A final dataset was made using the *ddply* function of the *plyr* package. The dataset was grouped by the Subject and Activity columns and all the chosen variables were aggregated by the mean.

This final dataset is saved into a file called *tidy_dataset.csv*.
