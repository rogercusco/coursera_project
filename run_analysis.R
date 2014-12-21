
#Creates a directory for the data
if(!file.exists("UCI HAR Dataset")) {dir.create("UCI HAR Dataset")}

#Downloads the data to the directory
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
message("Downloading data sets")
destfile="UCI HAR Dataset/UCI_HAR_data.zip"
download.file(fileURL, destfile=destfile, method="curl")
unzip(destfile, exdir = "./UCI HAR Dataset")

#Merging the test and training datasets
message("Merging the test and training datasets")

#Read all the datasets into R
test_x <- read.table("./UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

train_x <- read.table("./UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

activities <- read.table("./UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/UCI HAR Dataset/features.txt")

#Merge the train and test datasets
subject <- rbind(test_subject, train_subject)
x <- rbind(test_x, train_x)
y <- rbind(test_y, train_y)

#Label the sets with descriptive variable names
colnames(subject) <- "id"
colnames(y) <- "activity"
colnames(x) <- features$V2 

#Take the measurements that are means or standard deviations 
message("Extracting mean and stardard deviation measurements")
library(plyr) 

x <- x[,grepl("mean()", features$V2, fixed=TRUE) | grepl("std()", features$V2, fixed = TRUE)]

#Merge the three datasets (subject, activity, and measurments) into one 
dataset <- cbind(subject,y,x)

#Use descriptive activity names for the activity column
dataset$activity[dataset$activity == 1] = "WALKING"
dataset$activity[dataset$activity == 2] = "WALKING_UPSTAIRS"
dataset$activity[dataset$activity == 3] = "WALKING_DOWNSTAIRS"
dataset$activity[dataset$activity == 4] = "SITTING"
dataset$activity[dataset$activity == 5] = "STANDING"
dataset$activity[dataset$activity == 6] = "LAYING"

message("Creating tidy dataset")

#Create an independent dataset with the averages of each 
# variable for each individual and activity

data_averages <- ddply(dataset, .(id,activity), numcolwise(mean))

#Create a txt file with the tidy data of variable averages
write.table(data_averages,file = "./UCI HAR Dataset/averages_dataset.txt")

message("Completed")












