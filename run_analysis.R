## 1 - Merges the training and the test sets to create one data set.
## 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3 - Uses descriptive activity names to name the activities in the data set
## 4 - Appropriately labels the data set with descriptive activity names. 
## 5 - Creates a second, independent tidy data set with the average of each variable for 
## each activity and each subject.

ROOT <- 'UCI HAR Dataset'
sep <- '/'

## A. Download data files
if ( !file.exists(ROOT) ) {
  dir.create(paste(".", ROOT, sep=sep))
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "Dataset.zip", method = "curl")
  unzip("Dataset.zip", exdir=".")
}

## B. Read files: test and train sets
test.x <- read.table(paste(ROOT, "test", "X_test.txt", sep=sep))
test.y <- read.table(paste(ROOT, "test", "y_test.txt", sep=sep))
subject.test <- read.table(paste(ROOT, "test", "subject_test.txt", sep=sep))

train.x <- read.table(paste(ROOT, "train", "X_train.txt", sep=sep))
train.y <- read.table(paste(ROOT, "train", "y_train.txt", sep=sep))
subject.train <- read.table(paste(ROOT, "train", "subject_train.txt", sep=sep))

## 1. Merges the training and the test sets to create one data set.
features <- read.table(paste(ROOT, "features.txt", sep=sep), col.names=c("variable", "name"))
featureNames <- as.character(features$name)

test <- cbind(subject.test, test.y, test.x) # bind subjects, activity and test columns
names(test) <- c('subject','activity', featureNames) # subjects, activity and rest colnames

train <- cbind(subject.train, train.y, train.x) # bind subjects, activity and train columns
names(train) <- c('subject','activity', featureNames) # subjects, activity and rest colnames

bindData <- rbind(test, train) # Merge Test and Train sets

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
goodFeatures <- grep("mean\\(\\)|std\\(\\)", features$name)
features <- features[goodFeatures, ]
data <- bindData[, features$variable]

## 3. Uses descriptive activity names to name the activities in the data set
actNames <<- read.table(paste(ROOT,'activity_labels.txt', sep=sep),
                        sep=' ', col.names=c('index','name'))
## 4 - Appropriately labels the data set with descriptive activity names.
data$activity <- mapvalues(as.character(data$activity),
                           as.character(actNames$index),
                           as.character(actNames$name))

## 5 - Creates a second, independent tidy data set with the average of each variable for 
## each activity and each subject.
tabledata <- as.data.table(data) # convert data to table
tidy <- tabledata[, lapply(.SD, mean), by = list(activity, subject)]

# write table
write.table(tidy, paste('./output.txt', sep=sep), sep=' ', col.names=names(tidy))



