---
title: "CodeBook"
author: "Aravind Sivaramakrishnan"
date: "Sunday, May 24, 2015"
output: html_document
---

# Human Activity Recognition Using Smartphones Data Set

The data in ```tidydata.txt``` is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

## Attribute Information

For each record in the dataset it is provided:    
* An identifier of the subject who carried out the experiment.  
* The name of the activity carried out by the subject.  
* A 86-feature vector, which each feature is the average of the time and frequency domain   variables  for that particular subject carrying out that particular activity  

## Obtaining the tidy data

1. From the ```train``` folder, we read the files ```subject_train.txt```, ```X_train.txt``` and ```y_train.txt```. Similarly, we read the files ```subject_test.txt```, ```X_test.txt``` and ```y_test.txt``` from the ```test``` folder. We merge the training and test sets to create one data set.  

2. We identify those measurements that are the measurements on the mean and standard deviation for each measurements, and extract them.  

3. We read the activity names from ```activity_labels.txt``` and assign descriptive activity names to name the activities in the data set as a separate column.  

4. We label the data set with descriptive variable names.  

5. Using the ```reshape2``` package, we create the tidy data set with the average of each variable for each activity and each subject.  

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
