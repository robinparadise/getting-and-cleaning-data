## Tidy Data: file run_analysis.R
======

### A. The data for the script
There are two options:
* You can download the dataset from the UCI Machine Learning Repository.
  url: [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Or, just run the script and it'll download it for you.

### B. Read files: test and train sets
* X_test.txt (data file for test dataset).
* y_test.txt (activity file for test dataset).
* subject_test.txt (subject file for test dataset).
* X_train.txt (data file for training dataset).
* y_train.txt (activity file for training dataset).
* subject_train.txt (subject file for training dataset).
* features.txt (index and names variables for the datasets).

### 1. Merges the training and the test sets to create one data set
* First, we merge the test data into one piece of dataset (Subject, Activity and feature test).
* Second, we merge the train data into one piece of dataset (Subject, Activity and feature training).
* Finally, we combine the test and the training into one piece of data.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement
With the command grep we select the columns that contains mean or std values.
Then, we subset and merge these columns into the dataset.

### 3. Uses descriptive activity names to name the activities in the data set
We load the file activity_labels.txt.
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

### 4. Appropriately labels the data set with descriptive activity names
With the activities names loaded before, we replaced by the right activity index using the function mapvalues, to perform this command, we need to change the values with as.character to compare it.
* 1 = WALKING
* 2 = WALKING_UPSTAIRS
* 3 = WALKING_DOWNSTAIRS
* 4 = SITTING
* 5 = STANDING
* 6 = LAYING

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
To perform this step, we need to store and convert the data to a data table. Then with the function lapply we calculate the mean of each variable for each activity and each subject, and with tabledata we store in tidy variable.

Finally we export the tidy data into the text file "output.txt" using the write.table function. 

