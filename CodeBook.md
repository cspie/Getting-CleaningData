

< Description of the data and variables >

1. Execute the "run_analysis.R" script. This script would download the "getdata-projectfiles-UCI HAR Dataset.zip" file and unzip it to "UCI HAR Dataset" folder.

2. In the "UCI HAR Dataset" folder:
- 'README.txt' : provides the details of the training and test set files for data, subject and labels.
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.


< Any transformations or work performed to clean up the data >

1. The run_analysis.R script first downloads the "getdata-projectfiles-UCI HAR Dataset.zip" file and unzips it, if not down earlier.

2. It then performs the following to clean up the data:
- Merges the training and test sets to create one data set.

3. The following files are merged:
•UCI HAR Dataset/train/y_train.txt
•UCI HAR Dataset/test/y_test.txt
•UCI HAR Dataset/train/subject_train.txt
•UCI HAR Dataset/test/subject_test.txt
•UCI HAR Dataset/train/X_train.txt
•UCI HAR Dataset/test/X_test.txt

4. It extracts only the measurements on the mean and standard deviation for each measurement. 

5. In the merged data set, the variables containing mean and standard deviation are subsetted, so that the number of variables reduce from 561 to 66

6. The script uses descriptive activity names to name the activities in the data set

7. The script also reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
•walking
•walkingupstairs
•walkingdownstairs
•sitting
•standing
•laying

8. The scripts appropriately labels the data set with descriptive variable names. 

9. From the data set in step 4, the scripts creates a second, independent tidy data set with the average of each variable for each activity and each subject.
