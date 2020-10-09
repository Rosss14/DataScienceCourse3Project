# Code book
List of varibles of the data set created after running run_analysis.R  
   
1 "Subject" - subject identificator. Can take values 1 to 30  
2 "Activity" - activity (Walking, Walking_upstairs, Walking_downstairs, etc.)  
The meaning of the following variables is essentially the same as listed in **features_info.txt**,  
which can be found in **UCI HAR Dataset**. The only differences are:  
* The number of the variables is significantly lower (only *mean* and *std* variables);  
* The actual meaning of these variables is group average instead of single measure:  
  + For example *tBodyGyro.mean...X* is a mean of time-domain, angular velocity signal in direction X,  
  averaged for each group (Subject/Activity combination).
   
Description:  
* 't'/'f' - the first letter indicates the domain of signal ('t' for time-domain, 'f' for frequency domain).  
* 'Body'/'Gravity' - isolated signals for body and gravity.  
* 'Acc'/'Gyro' - 'Acc' is linear acceleration, and 'Gyro' is angular speed.  
* 'Jerk' - Jerk signals, obtained by deriving the body linear acceleration and angular velocity in time.  
* 'Mag' - magnitudes of 3-dimensional signals calculated using Euclidean norm.  
* 'mean'/'std' - denotes mean or standard deviation for the measurements.  
* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  
   
3 "tBodyAcc.mean...X"  
4 "tBodyAcc.mean...Y"  
5 "tBodyAcc.mean...Z"  
6 "tBodyAcc.std...X"  
7 "tBodyAcc.std...Y"  
8 "tBodyAcc.std...Z"  
9 "tGravityAcc.mean...X"  
10 "tGravityAcc.mean...Y"  
11 "tGravityAcc.mean...Z"  
12 "tGravityAcc.std...X"  
13 "tGravityAcc.std...Y"  
14 "tGravityAcc.std...Z"  
15 "tBodyAccJerk.mean...X"  
16 "tBodyAccJerk.mean...Y"  
17 "tBodyAccJerk.mean...Z"  
18 "tBodyAccJerk.std...X"  
19 "tBodyAccJerk.std...Y"  
20 "tBodyAccJerk.std...Z"  
21 "tBodyGyro.mean...X"  
22 "tBodyGyro.mean...Y"  
23 "tBodyGyro.mean...Z"  
24 "tBodyGyro.std...X"  
25 "tBodyGyro.std...Y"  
26 "tBodyGyro.std...Z"  
27 "tBodyGyroJerk.mean...X"  
28 "tBodyGyroJerk.mean...Y"  
29 "tBodyGyroJerk.mean...Z"  
30 "tBodyGyroJerk.std...X"  
31 "tBodyGyroJerk.std...Y"  
32 "tBodyGyroJerk.std...Z"  
33 "tBodyAccMag.mean.."  
34 "tBodyAccMag.std.."  
35 "tGravityAccMag.mean.."  
36 "tGravityAccMag.std.."       
37 "tBodyAccJerkMag.mean.."  
38 "tBodyAccJerkMag.std.."  
39 "tBodyGyroMag.mean.."  
40 "tBodyGyroMag.std.."  
41 "tBodyGyroJerkMag.mean.."  
42 "tBodyGyroJerkMag.std.."  
43 "fBodyAcc.mean...X"  
44 "fBodyAcc.mean...Y"  
45 "fBodyAcc.mean...Z"  
46 "fBodyAcc.std...X"  
47 "fBodyAcc.std...Y"  
48 "fBodyAcc.std...Z"  
49 "fBodyAccJerk.mean...X"  
50 "fBodyAccJerk.mean...Y"  
51 "fBodyAccJerk.mean...Z"  
52 "fBodyAccJerk.std...X"  
53 "fBodyAccJerk.std...Y"  
54 "fBodyAccJerk.std...Z"  
55 "fBodyGyro.mean...X"  
56 "fBodyGyro.mean...Y"  
57 "fBodyGyro.mean...Z"  
58 "fBodyGyro.std...X"  
59 "fBodyGyro.std...Y"  
60 "fBodyGyro.std...Z"  
61 "fBodyAccMag.mean.."  
62 "fBodyAccMag.std.."  
63 "fBodyBodyAccJerkMag.mean.."  
64 "fBodyBodyAccJerkMag.std.."  
65 "fBodyBodyGyroMag.mean.."  
66 "fBodyBodyGyroMag.std.."  
67 "fBodyBodyGyroJerkMag.mean.."  
68 "fBodyBodyGyroJerkMag.std.."
