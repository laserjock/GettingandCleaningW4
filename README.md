# GettingandCleaningW4
Getting and Cleaning Data Week 4 Project

## The Code ##
run_analysis.R contains the code to:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The run_analysis.R script first reads in the measurment, activity, and subject data for both train and test data sets. It also reads in the acitivty labels and data column descriptions (features.txt) and then applies the descriptions as column names.

The script then selects out the data columns with mean() and std() in the name (not including meanFreq). Then everything is put together so that all the observations (training and test) are together into a single data set.

The script then substitutes the activity # with the activity label so that it is human readable.

Lastly we group the dataframe by activity and subject and find the mean of each column.

The output of the script is in week4data.txt

## The Code Book ##
The Code Book for this project is in codebook.md. It describes what each variable (column) is for.
