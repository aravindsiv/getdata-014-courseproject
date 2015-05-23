# Load the dplyr package
library(dplyr)

# Read train data
trX <- read.table('UCI HAR Dataset/train/X_train.txt')
# Read test data
teX <- read.table('UCI HAR Dataset/test/X_test.txt')
# Read ctivity labels for training data
trY <- read.table('UCI HAR Dataset/train/y_train.txt')
# Read activity labels for test data
teY <- read.table('UCI HAR Dataset/test/y_test.txt')
# Read subject labels for training data
sutr <- read.table('UCI HAR Dataset/train/subject_train.txt')
# Read subject labels for test data
sute <- read.table('UCI HAR Dataset/test/subject_test.txt')
  
# Add subject and activity labels to the training and test sets
trX <- cbind(trX,activity = trY$V1, subject = sutr$V1)
teX <- cbind(teX,activity = teY$V1, subject = sute$V1)

# Merge the training and test sets
mdata <- rbind(trX, teX)


# Find the indices of the mean and standard deviation for each measurement
measurements <- read.table('UCI HAR Dataset/features.txt')
meanstd <- grep(pattern = "mean|std",x = measurements$V2,ignore.case = TRUE)

# Select those columns in the merged data that correspond to a mean or a standard deviation of a measurement
fdata <- select(mdata,c(subject,activity,meanstd))
fnames <- as.character(measurements$V2[meanstd])
colnames(fdata) <- c("SubjectID","ActivityID",fnames)

# Add a column with the corresponding activity labels
actlabels <- read.table('UCI HAR Dataset/activity_labels.txt')
activity <- as.character(actlabels$V2)
fdata <- mutate(fdata, ActivityName = activity[fdata$ActivityID])

# Just arranging the data by SubjectIDs and ActivityIDs
fdata <- arrange(fdata, SubjectID, ActivityID)
numcols <- ncol(fdata)
fdata <- fdata[,c(1,2,numcols,4:numcols-1)]

# Label the dataset with appropriate variable names
names(fdata) <- gsub(pattern = "tBody",replacement = "TimeBody",names(fdata))
names(fdata) <- gsub(pattern = "Acc", replacement = "Accelerometer", names(fdata))
names(fdata) <- gsub("fBody|fBodyBody|f","FrequencyBody",names(fdata))
names(fdata) <- gsub("Gyro", "Gyroscope", names(fdata))
names(fdata) <- gsub("tGravity","Gravity",names(fdata))
names(fdata) <- gsub("-mean()","Mean",names(fdata))
names(fdata) <- gsub("-std()","StdDev", names(fdata))
names(fdata) <- gsub("angle","Angle", names(fdata))

# Creating the tidy data set
fdata$SubjectID <- as.factor(fdata$SubjectID)
fdata$ActivityID <- NULL
fdata$ActivityName <- as.factor(fdata$ActivityName)
write.table(x = fdata,file = "tidydata.txt",row.names = FALSE)

