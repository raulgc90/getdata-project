# used for grouping data
require(plyr)

# read test data
test_x <- read.table('UCI HAR Dataset/test/X_test.txt')
test_y <- read.table('UCI HAR Dataset/test/Y_test.txt')
test_subject <- read.table('UCI HAR Dataset/test/subject_test.txt')
# merge test data
test_data <- cbind(test_x, test_y, test_subject)
# remove temporal data
remove(test_x, test_y, test_subject)

# read train data
train_x <- read.table('UCI HAR Dataset/train/X_train.txt')
train_y <- read.table('UCI HAR Dataset/train/Y_train.txt')
train_subject <- read.table('UCI HAR Dataset/train/subject_train.txt')
# merge train data
train_data <- cbind(train_x, train_y, train_subject)
# remove temporal data
remove(train_x, train_y, train_subject)

# merge train and test data
data <- rbind(test_data, train_data)
remove(test_data, train_data)

# read column names
column_names_table <- read.table('UCI HAR Dataset/features.txt')
column_names <- c(as.character(column_names_table$V2), 'Activity', 'Subject')
# change format of the columns
column_names <- gsub("[//(|//)]", "", column_names)
column_names <- gsub("-", "_", column_names)

# set column names
names(data) <- column_names

# read activity labels
activity_labels_table <- read.table('UCI HAR Dataset/activity_labels.txt')
data$activity <- as.factor(data$activity)
levels(data$activity) <- activity_labels_table$V2

# chosen columns for tidy dataset
choosen_columns <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,
                       121,122,123,124,125,126,161,162,163,164,165,166,
                       201,202,214,215,227,228,240,241,253,254,266,267,
                       268,269,270,271,345,346,347,348,349,350,424,425,
                       426,427,428,429,503,504,516,517,529,530,542,543,
                       562,563)

# dataset using only choosen columns
dataset <- data[, choosen_columns]

# group by (subject, activity) and applies mean to all columns
tidy_dataset  <- ddply(dataset, .(Subject, Activity), numcolwise(mean))

# save result
save(tidy_dataset, file='tidy_dataset.rda')


