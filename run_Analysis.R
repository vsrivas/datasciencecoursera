## PART 1 OF PEER ASSESSMENT --------------------------

setwd("G:/VandyCourses/Getting and Cleaning data/Peer Assessment")

## read the file "features.txt" to have all 561 features
featuresData <- read.table("features.txt", header=FALSE)[,c(2)]

# setwd("G:/VandyCourses/Getting and Cleaning data/Peer Assessment")

## reading the "test data" from the given data 
testData_X <- read.table("X_test.txt", sep="", header = FALSE)
testData_Y <- read.table("y_test.txt", sep="", header = FALSE)
testData_subject <- read.table("subject_test.txt", sep="", header = FALSE)
   
## setting the working directory to the train data
# setwd("G:/VandyCourses/Getting and Cleaning data/Peer Assessment/train")

## reading the "train data" from the given data 
trainData_X <- read.table("X_train.txt", sep="", header = FALSE)
trainData_Y <- read.table("y_train.txt", sep="", header = FALSE)
trainData_subject <- read.table("subject_train.txt", sep="", header = FALSE)

## merge the test and train data by rows for X, Y and subject
mergedXData <- rbind(testData_X, trainData_X)
mergedYData <- rbind(testData_Y, trainData_Y)
mergedSubjectData <- rbind(testData_subject, trainData_subject)

## cbind the merged X and Y data to get the final merged data with 563 columns and 
## 10,299 observations,1st column being subject, 2nd being Activity and rest 561 are 
## variables

names(mergedXData)<-featuresData ## assigning 561 variable names to 561 data points
names(mergedYData)<-c("Activity")
names(mergedSubjectData)<-c("Subject")

mergedDataFinal <- cbind(mergedXData,mergedSubjectData,mergedYData)

## PART 2 OF PEER ASSESSMENT --------------------------            

## find the index of the variables which contains the fixed string "mean()" and "std()"
matchMean <- grep("mean()", featuresData, fixed = TRUE) ## returns 33 variables
matchStd <- grep("std()", featuresData, fixed = TRUE)   ## returns 33 variables

meandata <- mergedDataFinal[, c(matchMean)]
stddata <- mergedDataFinal[ , c(matchStd)]

selectedData <- cbind(meandata, stddata)

## writes resultant data in another file :result.txt
write.table(selectedData, "result.txt")

## ## PART 3 OF PEER ASSESSMENT --------------------------   



