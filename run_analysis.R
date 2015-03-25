# Load some libraries that we are going to use
require(dplyr)
require(tidyr)

# - - - Path to files
sDsetPath <- "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"

# activity and features
sActLabelsPath <- paste(sDsetPath, "activity_labels.txt", sep="/")
sFeaturesPath <- paste(sDsetPath, "features.txt", sep="/")

# 'train' dataset
sTrainDataPath <- paste(sDsetPath, "train/X_train.txt", sep="/")
sTrainActDataPath <- paste(sDsetPath, "train/y_train.txt", sep="/")
sTrainSubjectIDPath <- paste(sDsetPath, "train/subject_train.txt", sep="/")

# 'test' dataset
sTestDataPath  <- paste(sDsetPath, "test/X_test.txt", sep="/")
sTestActDataPath <- paste(sDsetPath, "test/y_test.txt", sep="/")
sTestSubjectIDPath <- paste(sDsetPath, "test/subject_test.txt", sep="/")

# - - - Read the needed datasets to create the tidy dataset

# Read Activity Labels
act_labels <- read.table(sActLabelsPath, sep = " ", header= FALSE)
# Read Features Labels
features <- read.table(sFeaturesPath, sep = " ", header= FALSE)

# - - - Read datasets
nrows = -1 # included for debug purposes. Change to -1 to get all rows.

x_train <- read.table(sTrainDataPath, nrows=nrows)
x_train_activity <- read.table(sTrainActDataPath, nrows=nrows)
x_train_subid <- read.table(sTrainSubjectIDPath, nrows=nrows)
# ...
x_test <- read.table(sTestDataPath, nrows=nrows)
x_test_activity <- read.table(sTestActDataPath, nrows=nrows)
x_test_subid <- read.table(sTestSubjectIDPath, nrows=nrows)

# Add 'activity' and 'subject_id' columns to the datasets
x_train <- cbind(x_train_activity, x_train_subid, x_train)
x_test <- cbind(x_test_activity, x_test_subid, x_test)

# Join 'train' and 'test' Datasets
joined_dset <- rbind(x_train, x_test)

rm(x_train) # free out some mem
rm(x_test)

# Name all columns
colnames(joined_dset) <- c('activity', 'volunteer_id', as.character((features[,2])))

# - - - Convert dataset to a data frame tbl to facilitate our life
joined_dset <- tbl_df(joined_dset)

# Columns names may contain invalid character, so convert all to valid colnames.
valid_colnames <- make.names(names=colnames(joined_dset), unique=TRUE, allow_ = TRUE)
colnames(joined_dset) <- valid_colnames # change dataset's colnames

# Apply a series commands to transform 'joined_dset' in a tidy dataset
# 1. Change 'activity' to a more descriptive name
# 2. Select only the measurements on the mean and standard deviation for each measurement
# 3. Each observation must be in row
# 4. 5. 6. Each var must be in a column
joined_dset <- joined_dset %>% 
    mutate(activity = act_labels[activity,2]) %>%
    select(activity, volunteer_id, matches("std...[XYZ]|mean...[XYZ]")) %>%
    gather(domain_signal_var_axis, measurement, -activity, -volunteer_id) %>% 
    separate(domain_signal_var_axis, c("domain_signal_var", "axis"), sep = "\\.\\.\\.") %>%
    separate(domain_signal_var, c("domain_signal", "var"), sep = "\\.") %>%
    separate(domain_signal, c("domain", "signal"), sep = 1)

# Create a new dataset with the average of 'var' grouped by 'activity',
# 'volunteer_id' and 'var'

# !! Attention !! 
# This line was altered *after* the submission period, because I made a mistake.
# I forgot to include 'domain', 'signal' and 'axis' in the group.
# I dont expect to get my score altered, but only to show that was a small error.
# group01 <- group_by(joined_dset, activity, volunteer_id, var) # WRONG
group01 <- group_by(joined_dset, activity, volunteer_id, domain, signal, var, axis)

dset_avg <- summarise(group01, var_avg = mean(measurement))
# ... and save to disk
write.table(dset_avg, file="dset_avg.txt", row.name = FALSE, quote= FALSE)
