---
title: "Getting and Cleaning Data Project Code Book"
output: pdf_document
---
This document is a description of the variables found in the final dataset submitted for the Getting and Cleaning Data final course project. The data for this project was collected from Samsung Galaxy S phone accelerometers and was cleaned and processed as outlined in the README file found in this directory. Since we have already attached a document detailing the processing steps, we will focus on describing the variables found in the final data set below. All data other than subject id and activity are normalized and bounded between [-1,1].

* subjectid - An integer variable ranging from 1-30 representing one of the 30 participants in the study.
* activity - A factor variable representing the activity being performed during the given observation, with values (walk,walkupstairs,walkdownstairs,sit,stand,lay).
* tBodyAccXYZ - Numeric acceleration signal body component variables in the X, Y, and Z directions. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* tGravityAccXYZ - Numeric acceleration signal gravity component variables in the X, Y, and Z directions. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* tBodyAccJerkXYZ - Numeric linear acceleration jerk signal variables in the X, Y, and Z directions. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* tBodyGyroXYZ - Numeric angular velocity variable in the X, Y, and Z directions. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* tBodyGyroJerkXYZ - Numeric angular velocity jerk signal variables in the X, Y, and Z directions. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* tBodyAccMag - Numeric body component acceleration magnitude computed using Euclidean norm. Average mean and average standard deviation measurements are given for each subject and activity. 
* tGravityAccMag - Numeric gravity component acceleration magnitude computed using Euclidean norm. Average mean and average standard deviation measurements are given for each subject and activity.
* tBodyAccJerkMag - Numeric linear acceleration jerk signal magnitude variable computed using Euclidean norm. Average mean and average standard deviation measurements are given for each subject and activity.
* tBodyGyroMag - Numeric angular velocity magnitude variable computed using Euclidean norm. Average mean and average standard deviation measurements are given for each subject and activity.
* tBodyGyroJerkMag - Numeric angular velocity jerk signal magnitude computed using Euclidean norm. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* fBodyAccXYZ - Fast Fourier Transformed body component linear acceleration variable in the X, Y, and Z directions. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* fBodyAccJerkXYZ - Fast Fourier Transformed linear acceleration jerk signal variable in the X, Y, and Z directions. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* fBodyGyroXYZ - Fast Fourier Transformed angular velocity variable in the X, Y, and Z directions. Average mean and average standard deviation measurements are given for each direction, subject, and activity.
* fBodyAccMag - Fast Fourier Transformed linear acceleration magnitude variable computed using Euclidean norm. Average mean and average standard deviation measurements are given for each subject and activity.
* fBodyAccJerkMag - Fast Fourier Transformed linear acceleration jerk signal magnitude variable computed using Euclidean norm. Average mean and average standard deviation measurements are given for each subject and activity.
* fBodyGyroMag - Fast Fourier Transformed angular velocity magnitude variable computed using Euclidean norm. Average mean and average standard deviation measurements are given for each subject and activity.
* fBodyGyroJerkMag - Fast Fourier Transformed angular velocity jerk signal magnitude variable computed using Euclidean norm. Average mean and average standard deviation measurements are given for each subject and activity.