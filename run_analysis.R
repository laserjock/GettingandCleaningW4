library(dplyr)

# Read in all the needed data?t
act_labels <- read.table("activity_labels.txt")
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_sub <- read.table("test/subject_test.txt")
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_sub <- read.table("train/subject_train.txt")
features <- read.table("features.txt")

# Apply column labels from features.txt to the X data tables
names(test_x) <- features$V2
names(train_x) <- features$V2
names(test_y) <- "activity"
names(train_y) <- "activity"
names(test_sub) <- "subject"
names(train_sub) <- "subject"

# Select only the columns with mean() and std() in the name usind data from features.txt
test_x <- test_x[,grep("mean\\(|std\\(",features$V2)]
train_x <- train_x[,grep("mean\\(|std\\(",features$V2)]

# Combine the measurement data with the activity and subject
test <- cbind(test_x, test_y, test_sub)
train <- cbind(train_x, train_y, train_sub)

# Combine the testing and training data together into a single dataframe
df <- rbind(test,train)

# Convert the activity values into  descriptive activity names using activity_labels.txt
for (i in act_labels$V1) {
  df$activity[df$activity == i] <- as.character(act_labels$V2[i])
}
# Convert the activities and subjects into factors
df$activity <- as.factor(df$activity)
df$subject <- as.factor(df$subject)

# Calculate the means of each measurement column for each activity and subject
df2 <- df %>% group_by(df$activity, df$subject) %>%
  summarise_at(vars(-subject,-activity), funs(mean(., na.rm=TRUE)))

# Tidy up the column names
colnames(df2)[1] <- "activity"
colnames(df2)[2] <- "subject"

# Write out the table of mean values (Step 5)
write.table(df2, "week4data.txt", row.names = FALSE)