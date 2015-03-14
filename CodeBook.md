###Course Project - Getting and Cleaning Data
by Ricardo Delamar Roque
###CodeBook

    ACTIVITY
    --------
        Activity performed by the Volunteer

            WALKING
            WALKING_UPSTAIRS
            WALKING_DOWNSTAIRS
            SITTING
            STANDING
            LAYING

    VOLUNTEER_ID
    ------------
        The ID attributed to the volunteer. There were 30 volunteers. Also called 'subject_id' in some places.

            0..30  .Unique identifier

    DOMAIN
    ------

            t  .time domain (captured at a constant rate of 50 Hz)
            f  .frequency domain (found after the application of Fast Fourier Transform algorithm)

    SIGNAL
    ------
        Signal collected from the accelerometer and gyroscope

            BodyAcc
            GravityAcc
            BodyAccJerk
            BodyGyro
            BodyGyroJerk

    VAR
    ---
        Estimated variable

            mean
            std

    MEASUREMENT
    -----------

            -1..1  .Normalized value

###Descrition of tasks

1. After dowloading the raw dataset from [UCI HAR Dataset] the file was unziped in the same directory of the script. 

2.  Then the datasets needed for creating the Tidy dataset was imported. They are the following:

* **activity_labels** (friendly name of the activities) 
**features** (columns names of the main dataset)
**X_train/X_test** (main dataset for training and test) 
**y_train/y_test** (activity id)
**subject_train/subject_test** (volunteer id for each observation)

3. All columns were named appropriately. A filter was applied to columns names because some had invalid characters.

4. A series commands were applied to create dataset that have the training and the tests data together in a tidy form.

5. Finally the dataset described in step 4 was grouped by 'activity', 'volunteer_id' and 'var'. Then a new column called 'avg_var' was created, it contains the average of 'var'.

[UCI HAR Dataset]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip