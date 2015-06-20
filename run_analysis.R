# R SCRIPT FOR GETTING AND CLEANING DATA FINAL PROJECT.

# 1) IMPORT THE TRAINING AND TEST DATA SETS INTO R.

# For the purposes of the project, I have changed this portion of code as well as the
# write out portion assuming all data is in the working directory.

tes = read.table("X_test.txt")
subt = read.table("subject_test.txt")
names(subt) = c("subjectid")
actt = read.table("y_test.txt")
names(actt) = c("activity")

trai = read.table("X_train.txt")
subtr = read.table("subject_train.txt")
names(subtr) = c("subjectid")
acttr = read.table("y_train.txt")
names(acttr) = c("activity")

# We combine the data and labels below.

test = cbind(tes,subt,actt)
train = cbind(trai,subtr,acttr)

# 2) MERGE THE TWO DATA SETS TO CREATE ONE DATA SET. 

# The training and test data sets contain the same variables, so we can just 
# append the rows of the training data to the test data as follows.

traintest = rbind(train,test)

# To check that the data set was formed correctly and is the correct size, we can
# run the following code:
#
# dim(train)    
# 7352 563
# dim(test)     
# 2947 563
# dim(traintest)
# 10299 563
#
# Based on the above results, we can conclude that appending the test data to the
# training data successfully created a new merged data set with the correct
# dimensions.

# 3) EXTRACT ONLY MEAN AND STANDARD DEVIATION VALUES.

# Using the documentation, we identify the variable numbers that represent the mean
# and standard deviation measurements for each activity in the training and test
# data sets. We then narrow the data set below by selecting only these measurements.

traintest2 = traintest[,c(562,563,1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,
                          241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,
                          542,543)]

# We can now check the dimension of the new data set to ensure that the selection
# process above was successful.
#
# dim(traintest2)
# 10299 68
#
# Based on the results above, our selection produced a data frame of the desired
# dimensions. A basic exploration of the dataset using head(traintest2) shows that
# this data set contains the desired information in the desired order.

# 4) ASSIGN THE ACTIVITIES DESCRIPTIVE NAMES

# We will now use the factor function to assign descriptive labels to the activities
# performed by participants in this study.

traintest2$activity = factor(traintest2$activity,
                             levels = c(1,2,3,4,5,6),
                             labels = c("walk","walkupstairs","walkdownstairs","sit",
                                        "stand","lay"))

# The code above assigns the activity labels found in the documentation to the 
# activities in the data set as a factor. Using tail(traintest2), we can see that the
# code was successful in assigning descriptive names to the activities.

# 5) RENAME THE VARIABLES WITH DESCRIPTIVE NAMES

# We will now assign names very simply to the variables using the names function built
# into R. We refer to the features file in the documentation for the names to assign
# to each variable.

names(traintest2) = c("subjectid","activity","tBodyAccMeanX","tBodyAccMeanY","tBodyAccMeanZ",
                      "tBodyAccStdX","tBodyAccStdY","tBodyAccStdZ","tGravityAccMeanX",
                      "tGravityAccMeanY","tGravityAccMeanZ","tGravityAccStdX","tGravityAccStdY",
                      "tGravityAccStdZ","tBodyAccJerkMeanX","tBodyAccJerkMeanY",
                      "tBodyAccJerkMeanZ","tBodyAccJerkStdX","tBodyAccJerkStdY",
                      "tBodyAccJerkStdZ","tBodyGyroMeanX","tBodyGyroMeanY","tBodyGyroMeanZ",
                      "tBodyGyroStdX","tBodyGyroStdY","tBodyGyroStdZ","tBodyGyroJerkMeanX",
                      "tBodyGyroJerkMeanY","tBodyGyroJerkMeanZ","tBodyGyroJerkStdX",
                      "tBodyGyroJerkStdY","tBodyGyroJerkStdZ","tBodyAccMagMean",
                      "tBodyAccMagStd","tGravityAccMagMean","tGravityAccMagStd",
                      "tBodyAccJerkMagMean","tBodyAccJerkMagStd","tBodyGyroMagMean",
                      "tBodyGyroMagStd","tBodyGyroJerkMagMean","tBodyGyroJerkMagStd",
                      "fBodyAccMeanX","fBodyAccMeanY","fBodyAccMeanZ","fBodyAccStdX",
                      "fBodyAccStdY","fBodyAccStdZ","fBodyAccJerkMeanX","fBodyAccJerkMeanY",
                      "fBodyAccJerkMeanZ","fBodyAccJerkStdX","fBodyAccJerkStdY",
                      "fBodyAccJerkStdZ","fBodyGyroMeanX","fBodyGyroMeanY","fBodyGyroMeanZ",
                      "fBodyGyroStdX","fBodyGyroStdY","fBodyGyroStdZ","fBodyAccMagMean",
                      "fBodyAccMagStd","fBodyBodyAccJerkMagMean","fBodyBodyAccJerkMagStd",
                      "fBodyBodyGyroMagMean","fBodyBodyGyroMagStd","fBodyBodyGyroJerkMagMean",
                      "fBodyBodyGyroJerkMagStd")

# The above code successfully assigns the descriptive names given in the documentation to the 
# variables in the dataset. We can verify this with a call to head(traintest2).

# 6) AVERAGE EACH VARIABLE OVER SUBJECT AND ACTIVITY

# Now that we have a clean data set, we can find the averages of the variables grouped by activity
# and subject. We can do this very simply using the dplyr package, so we load it here.

library(dplyr)

# We first provide the grouping variables to R using the group_by function.

traintest3 = group_by(traintest2,activity,subjectid)

# We then use the summarize function on the grouped data to obtain the mean values of each variable
# broken down by activity and subject.

meantable = summarize(traintest3,
                      tBodyAccMeanX = mean(tBodyAccMeanX),
                      tBodyAccMeanY = mean(tBodyAccMeanY),
                      tBodyAccMeanZ = mean(tBodyAccMeanZ),
                      tBodyAccStdX = mean(tBodyAccStdX),
                      tBodyAccStdY = mean(tBodyAccStdY),
                      tBodyAccStdZ = mean(tBodyAccStdZ),
                      tGravityAccMeanX = mean(tGravityAccMeanX),
                      tGravityAccMeanY = mean(tGravityAccMeanY),
                      tGravityAccMeanZ = mean(tGravityAccMeanZ),
                      tGravityAccStdX = mean(tGravityAccStdX),
                      tGravityAccStdY = mean(tGravityAccStdY),
                      tGravityAccStdZ = mean(tGravityAccStdZ),
                      tBodyAccJerkMeanX = mean(tBodyAccJerkMeanX),
                      tBodyAccJerkMeanY = mean(tBodyAccJerkMeanY),
                      tBodyAccJerkMeanZ = mean(tBodyAccJerkMeanZ),
                      tBodyAccJerkStdX = mean(tBodyAccJerkStdX),
                      tBodyAccJerkStdY = mean(tBodyAccJerkStdY),
                      tBodyAccJerkStdZ = mean(tBodyAccJerkStdZ),
                      tBodyGyroMeanX = mean(tBodyGyroMeanX),
                      tBodyGyroMeanY = mean(tBodyGyroMeanY),
                      tBodyGyroMeanZ = mean(tBodyGyroMeanZ),
                      tBodyGyroStdX = mean(tBodyGyroStdX),
                      tBodyGyroStdY = mean(tBodyGyroStdY),
                      tBodyGyroStdZ = mean(tBodyGyroStdZ),
                      tBodyGyroJerkMeanX = mean(tBodyGyroJerkMeanX),
                      tBodyGyroJerkMeanY = mean(tBodyGyroJerkMeanY),
                      tBodyGyroJerkMeanZ = mean(tBodyGyroJerkMeanZ),
                      tBodyGyroJerkStdX = mean(tBodyGyroJerkStdX),
                      tBodyGyroJerkStdY = mean(tBodyGyroJerkStdY),
                      tBodyGyroJerkStdZ = mean(tBodyGyroJerkStdZ),
                      tBodyAccMagMean = mean(tBodyAccMagMean),
                      tBodyAccMagStd = mean(tBodyAccMagStd),
                      tGravityAccMagMean = mean(tGravityAccMagMean),
                      tGravityAccMagStd = mean(tGravityAccMagStd),
                      tBodyAccJerkMagMean = mean(tBodyAccJerkMagMean),
                      tBodyAccJerkMagStd = mean(tBodyAccJerkMagStd),
                      tBodyGyroMagMean = mean(tBodyGyroMagMean),
                      tBodyGyroMagStd = mean(tBodyGyroMagStd),
                      tBodyGyroJerkMagMean = mean(tBodyGyroJerkMagMean),
                      tBodyGyroJerkMagStd = mean(tBodyGyroJerkMagStd),
                      fBodyAccMeanX = mean(fBodyAccMeanX),
                      fBodyAccMeanY = mean(fBodyAccMeanY),
                      fBodyAccMeanZ = mean(fBodyAccMeanZ),
                      fBodyAccStdX = mean(fBodyAccStdX),
                      fBodyAccStdY = mean(fBodyAccStdY),
                      fBodyAccStdZ = mean(fBodyAccStdZ),
                      fBodyAccJerkMeanX = mean(fBodyAccJerkMeanX),
                      fBodyAccJerkMeanY = mean(fBodyAccJerkMeanY),
                      fBodyAccJerkMeanZ = mean(fBodyAccJerkMeanZ),
                      fBodyAccJerkStdX = mean(fBodyAccJerkStdX),
                      fBodyAccJerkStdY = mean(fBodyAccJerkStdY),
                      fBodyAccJerkStdZ = mean(fBodyAccJerkStdZ),
                      fBodyGyroMeanX = mean(fBodyGyroMeanX),
                      fBodyGyroMeanY = mean(fBodyGyroMeanY),
                      fBodyGyroMeanZ = mean(fBodyGyroMeanZ),
                      fBodyGyroStdX = mean(fBodyGyroStdX),
                      fBodyGyroStdY = mean(fBodyGyroStdY),
                      fBodyGyroStdZ = mean(fBodyGyroStdZ),
                      fBodyAccMagMean = mean(fBodyAccMagMean),
                      fBodyAccMagStd = mean(fBodyAccMagStd),
                      fBodyBodyAccJerkMagMean = mean(fBodyBodyAccJerkMagMean),
                      fBodyBodyAccJerkMagStd = mean(fBodyBodyAccJerkMagStd),
                      fBodyBodyGyroMagMean = mean(fBodyBodyGyroMagMean),
                      fBodyBodyGyroMagStd = mean(fBodyBodyGyroMagStd),
                      fBodyBodyGyroJerkMagMean = mean(fBodyBodyGyroJerkMagMean),
                      fBodyBodyGyroJerkMagStd = mean(fBodyBodyGyroJerkMagStd))

# The code above is bulky, but a call to head(meantable) shows that it successfully
# summarized the data in the desired manner. There has to be a better, more efficient 
# way of doing this in dplyr. I did not know about this package prior to the course,
# so if anyone knows a better way, a comment in the peer grading would be much
# appreciated!

# 7) WRITE OUT MEAN TABLE TO A TEXT FILE

# We export our mean table to a text file using the write.table function below.

write.table(meantable, "meantable.txt", row.names = FALSE)

# The resulting table includes all of the requested information in the requested 
# format and satisfies the tidy data principles. Due to a large number of digits
# for each variable, if you open it in Notepad, the rows will wrap around, but
# reading it back in to R and calling the dim function shows that it has the 
# correct dimensions.