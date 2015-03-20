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

    VAR
    ---
        Contains the var name.

            mean
            std

    VAR_AVG
    -------
        The average of the value grouped by 'activity', 'volunteer_id' and 'var'.

            -1..1  .Normalized value

###Descrition of tasks

1. After dowloading the raw dataset from [UCI HAR Dataset] the file was unziped in the same directory of the script. 

2.  Then the datasets needed for creating the tidy dataset was imported. They are the following:

 * **activity_labels** (friendly name of the activities) 
 * **features** (columns names of the main dataset)
 * **X_train/X_test** (main dataset for training and test) 
 * **y_train/y_test** (activity id for each observation)
 * **subject_train/subject_test** (volunteer id for each observation)

3. All columns were named appropriately. A filter was applied to columns names because some had invalid characters.

4. A series of commands (see comments inside the script for more details) were applied to create the dataset that have the 'train' and the 'test' data together in a tidy form.

5. Finally the dataset described in step 4 was grouped by 'activity', 'volunteer_id' and 'var'. Then a new column called 'avg_var' was created, it contains the average of 'var'.

[UCI HAR Dataset]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
