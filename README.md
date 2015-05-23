# Introduction
The script "run_analysis.R" gathers data from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The goal is to prepare tidy data that can be used for later analysis from the 
collected data from above.

Note: The files in this REPO are provided "as-is", for the Getting And Cleaning Data
project, May 2015.

# How the script works

# Step 1:
After making sure the necessary R packages are avaible, the script downloads
(if not available) the data above and unzips it.
We then have a UCI HAR Dataset directory. Under this directory, two sets of data
are available (training and test directories).
Note: The script ignores the "Inertial Signals" folders altogether.

The script loads data into memory:
Features names, activities labels and names, and then the three files of data
both in test and train folder:
X_train.txt, y_train.txt, subject_train.txt
X_test.txt, y_test.txt, subject_test.txt

## Steps 2, 3 and 4:
### Row binding the test and train data
We mix together train and test data using rows binding.

### Naming:
We need to name correspondingly the columns, in the case of the measures,
using the features names. As we need to have acceptable column names to be able
to use the select() function later on, we use "make.names()".

#### Activity names in rows
For the Activity, we need to associate the names to the activity labels, and to
do that we use a left.join() call. A few step later, we remove the
"activity label" column and keep only the names.

#### Extracting STD and MEAN
We want to extract only means and standard deviations from the data set, so we
do that now (rather than later, with more columns, although that's only a couple
of columns of difference, really not too big an optimization)

### Column binding subjects, label names and measures:
We then put it all together in a single table:
Subject, Activity names, and the corresponding measures.

At this point all columns are named (although not too readable) and all data is
together.

## Step 4 (second part):
Most column names are ugly at this point. Instead of leaving this as is, we
make it more human-readable. From the first few lines of "features_info.txt", we
can get to some conclusions:
f <-> Frecuency
t <-> Time
Acc <-> Linear Acceleration
Gyro <-> Angular Velocity
Mag <-> Magnitude
So we use that to rename the variables. As there are many, we go on using 
regular expressions.
Finally we remove the dots that were produced when calling "make.names()" earlier.

## Step 5:
This part was tricky, calculating the mean for each column by "Subject-Activity"
category. Thanks to the forum, the idea of using ddply appeared, and this became
a one-liner, using ddply() and numcolwise().

Finally, the final, tidy data set, is saved to a "resultdata.txt" file, in the
working directory.

