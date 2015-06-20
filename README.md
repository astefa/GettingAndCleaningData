---
output: pdf_document
---
# Getting And Cleaning Data Course Project

This document outlines the steps taken to complete the Getting and Cleaning Data final course project and explains the accompanying R file run_analysis. The project code was broken up into seven steps, all of which are heavily commented in the R file. We will go through each step below.

## 1) Import the training and test data sets into R.

In the R code, we assume that all relevant data is already in the working directory. The code performs the following:

* Read the test data into a table tes.
* Read the subject id data into a table subt.
* Assign the single column of the subt table the name subjectid.
* Read the activity data into a table actt.
* Assign the single column of actt the name activity.
* Repeat the above steps for the training data.
* Combine the test data with its associated subjectid and activity columns.
* Repeat this for the training data.

We now have complete test and training data along with associated subject ids and activities for each observation.

## 2) Merge the two data sets to create one data set.

* Append the test data to the training data using the rbind function and call the result traintest.
* (Optional) Use the dim function to verify that traintest has the correct dimensions.

## 3) Extract only mean and standard deviation values.

* Use the documentation to identify the columns that contain the mean and standard deviation values of each measurement.
* Move the subject id and activity variables to the first two columns of the data set.
* Select only the mean and standard deviation value columns from traintest and write to a new table, traintest2.
* (Optional) Use dim to verify that traintest2 has the correct dimensions.

## 4) Assign the activities descriptive names.

* Set the activity variable as a factor with the descriptive names for the activities given in the documentation.
* (Optional) Use the head, tail, or table functions to verify success.

## 5) Rename the variables with descriptive names.

* Use the names function to assign the names given in the documentation to each selected variable.
* (Optional) Use the head function to verify success.

## 6) Average each variable over subject and activity.

* Load the dplyr package to make summarizing simpler.
* Indicate to R that we wish to group by activity and subject id.
* Apply the mean function to every column excluding activity and subject id. If there is an easier way to do this, please let me know in the comments!

## 7) Write out mean table to a text file.

* Use the write.table function to export our mean table to a text file, which is attached in the project submission.
* The file rows wrap around when viewed in Notepad, but when read back into R, the table has the correct dimensions.