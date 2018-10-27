# load the data
library(data.table)
library(reshape2)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "dataFiles.zip")
unzip("dataFiles.zip")

# load activity labels and features
activitylabels <- fread("UCI HAR Dataset/activity_labels.txt", col.names = c("index", "activityname"))
features <- fread("UCI HAR Dataset/features.txt", col.names = c("index", "featurenames"))
featuresmsd <- grep("(mean|std)\\(\\)", features[, featurenames])
measurements <- features[featuresmsd, featurenames]
measurements <- gsub('[()]', '', measurements)

# load train datasets
train <- fread("UCI HAR Dataset/train/X_train.txt")[, featuresmsd, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
trainactivities <- fread("UCI HAR Dataset/train/y_train.txt", col.names = c("activity"))
trainsubjects <- fread("UCI HAR Dataset/train/subject_train.txt", col.names = c("subjectnum"))
train <- cbind(trainsubjects, trainactivities, train)

# load test datasets
test <- fread( "UCI HAR Dataset/test/X_test.txt")[, featuresmsd, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
testactivities <- fread("UCI HAR Dataset/test/y_test.txt", col.names = c("activity"))
testsubjects <- fread("UCI HAR Dataset/test/subject_test.txt", col.names = c("subjectnum"))
test <- cbind(testsubjects, testactivities, test)

# merge datasets and add labels
combined <- rbind(train, test)

combined[["activity"]] <- factor(combined[, activity], levels = activitylabels[["index"]], 
                             labels = activitylabels[["activityname"]])

# descriptive names

names(combined) <- gsub("Acc", "Accelerometer", names(combined))
names(combined)<-gsub("Gyro", "Gyroscope", names(combined))
names(combined)<-gsub("BodyBody", "Body", names(combined))
names(combined)<-gsub("Mag", "Magnitude", names(combined))
names(combined)<-gsub("^t", "Time", names(combined))
names(combined)<-gsub("^f", "Frequency", names(combined))
names(combined)<-gsub("tBody", "TimeBody", names(combined))
names(combined)<-gsub("-mean()", "Mean", names(combined), ignore.case = TRUE)
names(combined)<-gsub("-std()", "STD", names(combined), ignore.case = TRUE)
names(combined)<-gsub("-freq()", "Frequency", names(combined), ignore.case = TRUE)
names(combined)<-gsub("angle", "Angle", names(combined))
names(combined)<-gsub("gravity", "Gravity", names(combined))

combined[["subjectnum"]] <- as.factor(combined[, subjectnum])
combined <- reshape2::melt(data = combined, id = c("subjectnum", "activity"))
combined <- reshape2::dcast(data = combined, subjectnum + activity ~ variable, fun.aggregate = mean)

data.table::fwrite(x = combined, file = "tidyData.txt", quote = FALSE)
