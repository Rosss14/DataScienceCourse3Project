## A function that reads data from UCI HAR Dataset, creates dataframes 
## for the training set and the test set, merges them into one data set,
## extracts only the measurements on the mean and standard deviation for 
## each measurement, uses descriptive activity names to name the activities
## in the data set, appropriately labels the data set with descriptive 
## variable names.
## Finally, from the dataset obtained as the result of the steps above,
## a new, independent tidy dataset is created, with the average of each 
## variable for each activity and each subject.

run_analysis <- function(){
    
    # Load dplyr package
    library(dplyr)
    
    # Read features.txt to extract names of variables for future labelling
    features <- read.table("UCI HAR Dataset/features.txt", col.names=c("index","variable"))
    
    # Read activity_labels.txt to obtain names of activities to use as labels
    activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("index","activity"))
    
    # Read the Test set, Test labels, and subject_test labels
    Test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
    Test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    
    # Create a dataset that contains test data
    Test <- data.frame(subject_test, Test_labels, Test_set)
    
    # Read the Training set, Training labels and subject_train labels
    Training_set <- read.table("UCI HAR Dataset/train/X_train.txt")
    Training_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    
    # Create a dataset that contains training data
    Training <- data.frame(subject_train, Training_labels, Training_set)
    
    # Merge the test and training sets to create one data set Full_dataset
    Full_dataset <- bind_rows(Test, Training)
    
    # Label the data set with descriptive variable names
    names(Full_dataset) <- c("Subject", "Activity", features$variable)
    
    # Extract only the measurements on the mean and standard deviation,
    # as well as columns containing subject and activity id
    Full_dataset <- select(Full_dataset, grep("mean[^a-zA-Z]|std()|Subject|Activity",
                                              names(Full_dataset),value=TRUE))
    
    # Convert activity indices to activity names
    Full_dataset <- mutate_at(Full_dataset, "Activity", function(x){ activities[x,2] })
    
    # Create grouping by subject and activity
    Full_dataset <- group_by(Full_dataset, Subject, Activity)
    
    # Create a new tidy dataset with the average of each variable for each
    # subject and activity
    New_dataset <- summarise_at(Full_dataset, vars(-group_cols()), mean)
    
    # Save the resulting dataset in 'tidy_data_set.txt'
    write.table(New_dataset, file="tidy_data_set.txt", row.names=FALSE)
    
    # Return New_dataset
    New_dataset
    

}
