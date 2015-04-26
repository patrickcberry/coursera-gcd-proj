# Analysis script for Coursera, Getting and Cleaning Data course project
#

# library(plyr)
library(dplyr)

# Clean up envoirnment
rm(list=ls())

# Load raw data files
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Set the feature names
names(x_test) <- features$V2
names(x_train) <- features$V2

# Determine the features required - mean and std. Subset based on required features

required_features <- features[c(grep( "-mean", features$V2 ),grep( "-std", features$V2 )),]
req_x_test <- x_test[,required_features$V1]
names(req_x_test) <- required_features$V2

req_x_train <- x_train[,required_features$V1]
names(req_x_train) <- required_features$V2

merge_test <- req_x_test
merge_train <- req_x_train

# Merge activites

merge_test$Activity_Index <- merge( activity_labels, y_test, by = "V1" )$V1
#merge_test$Activity_Label <- merge( activity_labels, y_test, by = "V1" )$V2

merge_train$Activity_Index <- merge( activity_labels, y_train, by = "V1" )$V1
#merge_train$Activity_Label <- merge( activity_labels, y_train, by = "V1" )$V2

# Merge Subject

merge_test$Subject_ID <- subject_test$V1
merge_train$Subject_ID <- subject_train$V1

# Merge test and train

merge_all <- rbind( merge_test, merge_train )

# Part 5. 

#melted <- melt( merge_all, id.vars=c("Subject_ID", "Activity_Index"))
#tds <- dcast(melted, Activity_Index + Subject_ID ~ variable , mean)

tds <-  merge_all %>% 
        group_by(Activity_Index,Subject_ID) %>%     
        summarise_each(funs(mean))

write.table( tds, "tidy_data_set.txt", row.name=FALSE )


