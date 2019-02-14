## Merge Training and Test
## extract mean and std for each measurement
## Uses descriptive activity names to name the activities
## labels the data set w/ descriptive variable names
## create independent tidy data set w/ mean of each variable for each act. and each subject

## SOurce of datasets= https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

x_train <- read.table("C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\train\\X_train.txt")
x_test <- read.table("C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\test\\X_test.txt")

y_train <- read.table("C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\train\\y_train.txt")
y_test <- read.table("C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\test\\y_test.txt")
  
subject_train <- read.table("C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\train\\subject_train.txt")
subject_test <- read.table("C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\test\\subject_test.txt")

ftrs <- read.table("C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\features.txt")

act_lbls <-read.table("C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\activity_labels.txt")

subj <- rbind(subject_train,subject_test)

x_data <- rbind(x_train,x_test)

y_data <- rbind(y_train,y_test)

colnames(subj) <- "subject"
colnames(x_data) <- ftrs[,2]
colnames(y_data) <- "activity"

Merge1 <- cbind(subj,y_data)
Merge2 <- cbind(x_data,Merge1)

cols <- grep(".*mean.*|.*std.*", names(Merge2))|grep("subject", names(Merge2))|grep("activity",names(Merge2))

Extract <- Merge2[,cols==TRUE]

colnames(act_lbls) <- c('activity','activityCat')

Act_Extract <- merge(Extract,act_lbls,by="activity")

Avg_calc <- aggregate(. ~subject + activityCat, Act_Extract,mean)
Tidy <- Avg_calc[order(Avg_calc$subject,Avg_calc$activity),]
write.table(Tidy,"C:\\Users\\aabdulkhalek\\Documents\\Test\\Data Cleaning\\UCI HAR Dataset\\train\\Tidy.txt",row.names=FALSE)