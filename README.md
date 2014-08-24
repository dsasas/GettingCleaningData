# Coursera - Getting and Cleaning Data Course Project

## Project description:

This repository contains solution files for the following course project:

    The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
    

    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
    
    Here are the data for the project: 
    

    You should create one R script called run_analysis.R that does the following. 
    1.Merges the training and the test sets to create one data set.
    2.Extracts only the measurements on the mean and standard deviation for each measurement. 
    3.Uses descriptive activity names to name the activities in the data set
    4.Appropriately labels the data set with descriptive variable names. 

    Please submit a link to a Github repo with the code for performing your analysis. The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory. The output should be the tidy data set you submitted for part 1. You should include a README.md in the repo describing how the script works and the code book describing the variables.



The script needs data from the following dataset:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

The file "UCI HAR Dataset.zip" should  downloaded and extracted into the project directory and it subfolder setting Working Directory in R.


## How the script works 

Initially, the script loads data to r enviroment (files activity_labels.txt, features.txt,subject_test.txt, X_test.txt, Y_test.txt, subject_train.txt, X_train.txt and y_train.txt).

After that, data related to teste are combined with data related to training.

Then, it extracted only data related the measurements on the mean and standard deviation for each measurement. In this step, the files features.txt is used to extract required by the project .

 In the next step, it labels the data set with descriptive variable  names  and it merges the training and test sets to create one data set.

In the last step,  it creates a second and independent tidy data set with the average of each variable for each activity and each subject, summarizing data.

the output produced is the file finalData1.txt.


##Steps to reproduce the script

 1. Save all files produced by file "getdata-projectfiles-UCI HAR Dataset.zip" at the folder "UCI HAR Dataset" and set it Working Directory in R enviroment:
 2. Open the R"run_analysis.r"  script and run it.
 3. Get the outupt (file finalData1.txt)


