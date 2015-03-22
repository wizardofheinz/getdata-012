## all data files are located in working directory

# retrieve column headers
hdrData <-  scan(file="features.txt", what="character")
hdrs <- matrix(hdrData, nrow=561, ncol=2, byrow=TRUE)
colHdrs <- hdrs[,2]

# retrieve testing data, add column headers
tstData <- read.table("X_test.txt")
colnames(tstData) <- colHdrs
# retrieve activity data, add column header
tstActData <- read.table("y_test.txt")
colnames(tstActData) <- "actID"
# add column of activities to testing data (new col 1)
testData <- cbind(tstactData, tstData)
# retrieve subjects data, add column header
tstsubjData <- read.table("subject_test.txt")
colnames(tstsubjData) <- "subjID"
# add column of subjects to testing data (this is now new col 1)
testData <- cbind(tstsubjData, testData)
# at this point testData is 2947 observations of 563 variables

# repeat steps for training data
trnData <- read.table("X_train.txt")
colnames(trnData) <- colHdrs
trnActData <- read.table("y_train.txt")
colnames(trnActData) <- "actID"
trainData <- cbind(trnactData, trnData)
trnSubjData <- read.table("subject_train.txt")
colnames(trnSubjData) <- "subjID"
trainData <- cbind(trnsubjData, trainData)
# at this point trainData is 7352 observations of 563 variables

# add new rows (trainData) to bottom of testData 
mergeData <- rbind(testData,trainData)
# mergeData is 10299 observations of 563 variables

# now select 'measurements' of mean, std for accelerometer & gyroscope data
#  accelerometer is in two parts: body & gravity
#  resulting columns: 1:8, 43:48, 268:273
projData <- mergeData([,1:8])
projData <- cbind(projData, mergeData[43:48])
projData <- cbind(projData, mergeData[268:273])
# projData is 10299 observations of 20 variables

# order data by subject & activity
projData <- projData[order(projData$"subjID",projData$"actID"),]
# size unchanged

#reshape data by first melting then casting 
meltData <- melt(projData, id=c("subjID","actID"))
# meltData is 185382 observations of 4 variables

castData <- cast(meltData, subjID + actID + variable ~ ., mean)
# castData has 3240 observations of 4 variables
# castData file has average values for each variable for each activity for each subject

# output castData for course project assignment submission.
write.table(castData, file="castData.txt", row.names = FALSE)