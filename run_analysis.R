## Getting And Cleaning Data - Project
## Author: Nick
## 

####################

## Testing and installing required package dplyr
## used for select() function, from course notes, very fast because compiled in
## C++.
if ("dplyr" %in% (rownames(installed.packages())) == FALSE) {
    install.packages("dplyr")
}

## Forum hint here: ddply and numcolwise for the last step of the project...
## https://class.coursera.org/getdata-014/forum/thread?thread_id=282
if ("plyr" %in% (rownames(installed.packages())) == FALSE) {
    install.packages("plyr")
}
library(plyr)
library(dplyr) ## Loading order is important because of masking of objects

####################

## We will work with relative directory, from unzipped downloaded data
proj_dir <- "UCI HAR Dataset"
## Now getting the dataset
if (file.exists("ProjectDataSet.zip") == FALSE) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile="ProjectDataSet.zip", method="curl", mode="wb")
    ## Method for correct HTTPS download over MACOSX, mode also made a
    ## difference for downloading excel and seems to apply generally...
}
if (file.exists("UCI HAR Dataset") == FALSE) { unzip("ProjectDataSet.zip") }

####################
## Reading-in data: Use file.path as optimized alternative to paste0, at least
## from what doc says... Plus it's platform independent :)

## Reading in features names, read.table does not care for headers by default
features_n <- read.table(file.path(proj_dir, "features.txt"))
# Note, we'll only use second column of the table.

## Reading in labels for activities names
activities_l <- read.table(file.path(proj_dir, "activity_labels.txt"))

## Reading in Train data
# Train Set
train_set <- read.table(file.path(proj_dir, "train", "X_train.txt"))
# Train labels
train_labels <- read.table(file.path(proj_dir, "train", "y_train.txt"))
# Train Subject data
train_subjects <- read.table(file.path(proj_dir, "train", "subject_train.txt"),
                             colClasses = c("factor"))
## Note here: Factor seems the correct way to go for subject.

## Reading in Test data
# Test Set
test_set <- read.table(file.path(proj_dir, "test", "X_test.txt"))
# Train labels
test_labels <- read.table(file.path(proj_dir, "test", "y_test.txt"))
# Train Subject data
test_subjects <- read.table(file.path(proj_dir, "test", "subject_test.txt"),
                            colClasses = c("factor"))

## All the data in.

####################

## Now let's bind test and train together
mydata_set <- rbind(train_set, test_set) # 561 columns, 10299 rows
mydata_labels <- rbind(train_labels, test_labels)
mydata_subjects <- rbind(train_subjects, test_subjects)

####################

## Let's attach the names to columns
names(mydata_set) <- make.names(features_n$V2, unique=TRUE) ## needed for select
names(mydata_subjects) <- c("mysubject")

##
## Let's use the dplyr functionality a bit here...
##

## We didn't use factor colClass for labels above, for this here:
names(mydata_labels) <- c("mylabel")
names(activities_l) <- c("mylabel", "ActivityName")
mydata_labels2 <- mydata_labels %>% left_join(activities_l)

## Note: That was an alternative to "merge()"... But it was fun!

## We have feature names, that include .std.. or .mean.., which is what we want:
## Back to dplyr, let's use some columns selection with regexp and all!
mydata_set <- select(mydata_set, matches("\\.std\\.\\.|\\.mean\\.\\."))

## Now the easiest way to go, is to put it all together:
mydata <- cbind(mydata_subjects, mydata_labels2, mydata_set)

# Removing the useless column mylabel
mydata <- select(mydata, -(mylabel))

### Only some renaming is needed now, but we still have plenty of columns...
mydata <- dplyr::rename(mydata, Subject = mysubject)
## Note: There was an error of unused argument, somehow you need to specify
## Which rename function you are going to use for this above to work...


## Rename for all the 67 remaining names would be crazy...
## So we use regexp instead...
names(mydata) <- gsub("^t", "time", names(mydata))
names(mydata) <- gsub("\\.\\.\\.", "\\.", names(mydata))
names(mydata) <- gsub("Acc", "LinearAcceleration", names(mydata))
names(mydata) <- gsub("Gyro", "AngularVelocity", names(mydata))
names(mydata) <- gsub("Mag", "Magnitude", names(mydata))
names(mydata) <- gsub("^f", "Frecuency", names(mydata))
## Some weird names at the end with "bodybody"...
names(mydata) <- gsub("BodyBody", "Body", names(mydata))
## And when we replaced "-mean()" for ".mean.."...
names(mydata) <- gsub("\\.\\.$", "", names(mydata))

## Last step: Mean by subject and activity:
## Thanks to the forum, the idea of numcolwise with ddply came along...
mytidydataset <- ddply(mydata, c("Subject", "ActivityName"), numcolwise(mean))

## Ready. Let's save the results: write.table as instructed:
write.table(mytidydataset, file="resultdata.txt", row.names = FALSE)
