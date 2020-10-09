# DataScienceCourse3Project
Repository contains an R script required to complete Getting and Cleaning Data course

 IMPORTANT: run_analysis.R only works properly if *UCI HAR Dataset* is in the working directory and is in extracted form ( **not** in .zip).  
 Also, *dplyr* package must be installed (not necessarily attached, as the script executes *library()* command to do it).  
   
 **run_analisys.R** script contains one function *run_analysis()* that takes no parameters. Following is the description of how the script works  
 step by step.  
   
 ## Attach necessary packages  
 This function loads the *dplyr* package:  
  `library(dplyr)`  
 ## Read the data and create data sets  
 Read the files containing data for future labeling of the dataset, store the data in *features* and *activities*.  
    
  `features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "variable"))`  
  `activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("index", "activity"))`  
  ***  
 Read the test data (*Test_set* contains experiment data, *Test_labels* is a vector containing values 1:6, that is used to label the activity  
 for each experiment (Walking, Sitting, etc.), and *subject_test* is a vector that contains subject labels).  
    
  `Test_set <- read.table("UCI HAR Dataset/test/X_test.txt")`  
  `Test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")`  
  `subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")`  
  ***  
 Create the "Test" dataset containing subject labels, test labels, and the experimental test data.  
    
  `Test <- data.frame(subject_test, Test_labels, Test_set)`  
  ***  
  Read the training data (*Training_set* contains experiment data, *Training_labels* is a vector containing values 1:6, that is used to label the  
  activity for each experiment (Walking, Sitting, etc.), and *subject_train* is a vector that contains subject labels).  
     
  `Training_set <- read.table("UCI HAR Dataset/train/X_train.txt")`   
  `Training_labels <- read.table("UCI HAR Dataset/train/y_train.txt")`  
  `subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")`  
  ***  
  Create the "Training" dataset that contains subject labels, test labels, and the experimental training data.  
     
  `Training <- data.frame(subject_train, Training_labels, Training_set)`  
  ***
  Merge *Test* and *Training* sets to obtain the "Full_dataset".  
     
  `Full_dataset <- bind_rows(Test, Training)`  
  
  ## Clean the data set  
  Name the variables in the dataset, the first two columns correspond to subject and activity data, and the rest is experimental data.  
  This is where set *features* comes in handy, as it contains labels for the experimental data (i.e. names of measured variables).  
     
  `names(Full_dataset) <- c("Subject", "Activity", features$variable)`  
  ***  
  Use `select()` to extract columns that contain the mean and standard deviation for each measurement. The names applied in the  
  previous step help us do just that. Use `grep()` to find matches in variable (column) names and extract only the columns that match.  
  As variables containing 'meanFreq' are not measurements of mean, neither of standard deviation, *mean[^a-zA-Z]* is used as pattern  
  instead of *mean*, so that it could only be matched to strings that contain \*mean\* not followed by any letter.  
  "Subject" and "Activity" are also included in the pattern, as we don't want to lose those variables.  
  `value=TRUE` is included as a parameter in `grep()` call, as we need character vector returned to be used as a parameter in `select()`.  
     
  `Full_dataset <- select(Full_dataset, grep("mean[^a-zA-Z]|std()|Subject|Activity",
                                              names(Full_dataset),value=TRUE))`  
  ***  
  Use descriptive activity names to name the activities in the data set. Set *activities* is used. Function `mutate_at()` is used to  
  modify the "Activity" column, in order for it to use proper labels ("STANDING","WALKING",etc.) instead of numeric indices (5,1,etc.).  
     
  `Full_dataset <- mutate_at(Full_dataset, "Activity", function(x){ activities[x,2] })`  
  
  ## Create new independent, tidy data set  
  Group the dataset by subject and activity (to get a total of 30\*6=180 groups).  
     
  `Full_dataset <- group_by(Full_dataset, Subject, Activity)`  
  ***  
  Use `summarise_at()` to apply `mean()` to all columns (by groups established in the previous step). `vars(-group_cols())` is a  
  parameter used to exclude group columns ("Subject" and "Activity").  
     
  `New_dataset <- summarise_at(Full_dataset, vars(-group_cols()), mean)`  
  ***  
  Finally, use `write_table()` to save the new dataset in 'tidy_data_set.txt'.  
     
  `write.table(New_dataset, file="tidy_data_set.txt", row.names=FALSE)`  
  ***  
  Display the resulting data set  
     
  `New_dataset`  
