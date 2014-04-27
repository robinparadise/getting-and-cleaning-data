## CodeBook
======

### Global variable

* ROOT: the working directory for the dataset
* sep: the character indicates the path delimiter

### B. Read files: test and training sets

* test.x >> features test X.
* test.y >> activity test dataset.
* subject.test >> subject test dataset.
* training.x >> features training X.
* training.y >> activity training dataset.
* subject.training >> subject training dataset.
* features >> index and names variables for the datasets.
* featureNames >> descriptives names variables for activity.

### 1. Merges the training and the test sets to create one data set

* test >> Merge the test data into one piece of data (Subject, Activity and feature test) [using cbind].
* train >> Merge the training data into one piece of data (Subject, Activity and feature training) [using cbind].
* bindData >> The test and the training combined (using rbind).

### 2. Extracts only the measurements on the mean and standard deviation for each measurement

* goodFeatures >> The columns which contained mean or std values were identified using the grep function.
* features >> the data with the subset of columns that contains mean or std values.
* data >> The subset data from the feature, equivalent to the only measurements on the mean and standard deviation.

### 3. Uses descriptive activity names to name the activities in the data set
* actNames >> It's the descriptive name for the name of activities.

### 4. Appropriately labels the data set with descriptive activity names

* data$activity >> With the method mapvalues() and as.character() we replaced by the corresponing activity name.

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each 

* tabledata >> we convert the data to a data table.
* tidy >> This is the independent tidy data set with the average of each variable.
* output.txt >> The resulting average tidy dataset were exported to this file.
