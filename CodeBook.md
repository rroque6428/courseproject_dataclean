<p align="center"><b>Getting and Cleaning Data | Coursera</b>
<br />Course Project CodeBook<br />by Ricardo Delamar Roque</p>

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

