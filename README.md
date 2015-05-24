# getdata-014-courseproject
Course Project for the Getting &amp; Cleaning Data Coursera course.

## Overview
The script ```run_analsysis.R``` is used to obtain the tidy data. The ```run_analysis.R``` script can be run as long as the Samsung data is the working directory. The script requires the installation of the dplyr or the plyr package, as well as the reshape2 package.

The ```run_analysis.R``` script performs the following functions:  

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

## Steps to obtain the tidy data  
1. Download the Samsung data from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Extract the .zip file to your working directory.  
2. Download the raw ```run_analysis.R``` file from this repo and save it in your working directory. The working directory must also contain the ```UCI HAR Dataset``` folder.  
3. Run ```source('run_analysis.R')``` in your R terminal. The tidy data will be written to a new file ```tidydata.txt``` in your working directory.   

The run_analysis.R file has been annotated with several comments to guide you through each of the five steps described above. 
