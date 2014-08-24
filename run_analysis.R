##   This R script, called "run_analysis.R",  does the following about files and 
##   information explains at the linK:
##   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones:
##
##   1. Merges the training and the test sets to create one data set.
##   2. Extracts only the measurements on the mean and standard 
##          deviation for each measurement. 
##   3. Uses descriptive activity names to name the activities in 
##          the data set.
##   4. Appropriately labels the data set with descriptive variable
##          names. 
##   5. Creates a second, independent tidy data set with the average 
##          of each variable for each activity and each subject. 


##   Loading data to r enviroment

message("Loading files................")
activitiesLabels <- read.table("activity_labels.txt", 
			header=FALSE)
features <- read.table("features.txt", 
			header=FALSE,)
subjectTest <- read.table( "./test/subject_test.txt", 
			header=FALSE)
xTestData <- read.table("./test/X_test.txt", 
			header=FALSE)
yTestData <- read.table("./test/Y_test.txt", 
			header=FALSE)
subjectTrain <- read.table("./train/subject_train.txt", 
			header=FALSE)
xTrainData <- read.table("./train/X_train.txt", 
			header=FALSE)
yTrainData <- read.table("./train/y_train.txt", 
			header=FALSE)

## Preparing data to merge .

message("Preparing data.............")
xTestTrain <- rbind(xTestData, xTrainData)
subjectTestTrain <- rbind(subjectTest, subjectTrain)
yTestTrain <- rbind(yTestData, yTrainData)

##   Extracting only the measurements on the mean and standard 
##      deviation for each measurement 

message("Filtering data.............")
validIdFeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
validLabelFeatures <- features$V2[grep("-mean\\(\\)|-std\\(\\)", features[, 2])]
xTestTrainValid <- xTestTrain[,validIdFeatures]

##   Labeling the data set with descriptive variable  names 

message("Labeling data.............")
names(xTestTrainValid) <- features[validIdFeatures, 2]
names(xTestTrainValid) <- gsub("\\(|\\)", "", names(xTestTrainValid))
names(xTestTrainValid) <- tolower(names(xTestTrainValid))
activitiesLabels[, 2] = gsub("_", "", tolower(as.character(activitiesLabels[, 2])))
yTestTrain[,1] = activitiesLabels[yTestTrain[,1], 2]
names(yTestTrain) <- "activity"
names(subjectTestTrain ) <- "subject"

##   Merging the training and the test sets to create one data set 

message("Merging data.............")
finalData <- cbind(subjectTestTrain , yTestTrain, xTestTrainValid)


##   Creating a second, independent tidy data set with the average 
##        of each variable for each activity and each subject. 

message("Summarizing data.............")
distinctSubjects = unique(subjectTestTrain)[,1]
qtSubjects = length(unique(subjectTestTrain)[,1])
qtActivities = length(activitiesLabels[,1])
qtCols = dim(finalData)[2]
finalData1 = finalData[1:(qtActivities*qtSubjects), ]

row = 1
for (j in 1:qtSubjects) {
	for (k in 1:qtActivities) {
		finalData1[row, 1] = distinctSubjects[j]
		finalData1[row, 2] = activitiesLabels[k, 2]
		dataTemp <- finalData[finalData$subject==j & finalData$activity==activitiesLabels[k, 2], ]
		finalData1[row, 3:qtCols] <- colMeans(dataTemp[, 3:qtCols])
		row = row+1
	}
}
write.table(finalData1, file="./finalData1.txt", row.names=FALSE)

