# Downloand and unzip the data files
if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){ 
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
    download.file(fileURL, destfile = "getdata-projectfiles-UCI HAR Dataset.zip" ) 
}

if(!file.exists("UCI HAR Dataset")) {unzip(strFolderPath & "getdata-projectfiles-UCI HAR Dataset.zip")} 

# Part 1
# Merges the training and the test sets to create one data set.
labelTrain <- read.table("UCI HAR Dataset/train/y_train.txt") 
labelTest <- read.table("UCI HAR Dataset/test/y_test.txt") 
label <- rbind(labelTrain, labelTest) 
rm(labelTrain, labelTest) 

# load and merge subject train and test dataset 
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt") 
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt") 
subject <- rbind(subjectTrain, subjectTest) 
rm(subjectTrain, subjectTest) 

# load and merge train and test data 
dataTrain <- read.table("UCI HAR Dataset/train/X_train.txt") 
dataTest <- read.table("UCI HAR Dataset/test/X_test.txt") 
data <- rbind(dataTrain, dataTest) 
rm(dataTrain, dataTest)

# Part 2
# Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR Dataset/features.txt") 

meanStdFeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]) 
meanStdData <- data[, meanStdFeatures] 

# Assign names to variables 
names(meanStdData) <- features[meanStdFeatures, 2] 
names(meanStdData) <- gsub("\\(|\\)", "", names(meanStdData)) 
names(meanStdData) <- tolower(names(meanStdData)) 
rm(features) 

# Part 3
# Uses descriptive activity names to name the activities in the data set. 
activities <- read.table("UCI HAR Dataset/activity_labels.txt") 
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2]))) 
label[,1] = activities[label[,1], 2] 
names(label) <- "activity" 

# Part 4
# Appropriately labels the data set with descriptive variable names.
names(subject) <- "subject" 
mergedData <- cbind(subject, label, meanStdData) 
write.table(mergedData, "MergedDataSet.txt") 

# Part 5
# From the data set in Part 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library("plyr") 
featureMeanBySubjectActivity = ddply(mergedData, .(subject, activity), numcolwise(mean)) 
write.table(featureMeanBySubjectActivity, "FeatureMeanBySubAct.txt", row.name=FALSE) 

