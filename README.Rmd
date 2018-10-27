---
title: "ReadMe"
output: html_document
---

# Human Activity Recognition Using Smartphones Dataset  

## Getting and cleaning data course project 

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

    Download the dataset 
    Load the activity and feature info
    Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
    Loads the activity and subject data for each dataset, and merges those columns with the dataset
    Merges the two datasets
    Converts the activity and subject columns into factors
    Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file tidyData.txt.

======================================    
The dataset includes the following files:
  
README.html  
tidyData.txt: tidy dataset  
CodeBook.html: explanations of the variables in the tidy dataset  
run_analysis.R: the R-code run on the data set  
   
=========================================  
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
  
For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


