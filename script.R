setwd("C:\\Data\\coursEra\\gettCleanData\\progAssignment\\UCI HAR Dataset")
features=read.csv(file="features.txt", sep="", header=FALSE) 
names(features)<-c("ID", "feature")

#get train data
trainData = read.csv("train\\X_train.txt", sep="", header=FALSE)
names(trainData)<-features$feature

activity = read.csv("train\\y_train.txt", sep="", header=FALSE)
names(activity)<-"Activity"
trainData<-cbind(trainData, activity)
rm(activity)

subject = read.csv("train\\subject_train.txt", sep="", header=FALSE)
names(subject)<-"Subject"
trainData<-cbind(trainData, subject)
rm(subject)

#get test data
testData = read.csv("test\\X_test.txt", sep="", header=FALSE)
names(testData)<-features$feature

activity = read.csv("test\\y_test.txt", sep="", header=FALSE)
names(activity)<-"Activity"
testData<-cbind(testData, activity)
rm(activity)

subject = read.csv("test\\subject_test.txt", sep="", header=FALSE)
names(subject)<-"Subject"
testData<-cbind(testData, subject)
rm(subject)

#merge the sets (1) and add descriptive names for activities (3)
finalSet=rbind(trainData, testData)
activityLabels<-read.csv("activity_labels.txt", sep="", header=FALSE)
descriptiveActivityNames<-activityLabels[,2][finalSet$Activity]
finalSet<-cbind(finalSet, descriptiveActivityNames)
rm(activityLabels)

rm(testData, trainData)

#get relevant columns (mean or standard deviation) (2)
relevantFeaturesLabels<-features[grep("-mean|-std",features$feature,ignore.case=T),]

#get only the mean and std quantities
relevantFeatures<-finalSet[,relevantFeaturesLabels[,1]]
nRelevantFeatures<-length(relevantFeatures)
#and supplement the data frame witht the activity and subject column
relevantFeatures<-cbind(relevantFeatures,finalSet$Activity)
relevantFeatures<-cbind(relevantFeatures,finalSet$Subject)
relevantFeatures<-cbind(relevantFeatures,finalSet$descriptiveActivityNames)

#change names of last columns (they get redicilous names by default)
nCol<-length(relevantFeatures)
colnames(relevantFeatures)[nCol-2]<-"ActivityIDX"
colnames(relevantFeatures)[nCol-1]<-"SubjectIDX"
colnames(relevantFeatures)[nCol]<-"ActivityDescriptive"
rm(nCol)

# get averages for all combinations of subject/activity for all relevant features

first<-TRUE
irow<-0
for (subjectLoop in 1:30){
  for (activityLoop in 1:6){
    irow<-irow+1
    
    #get current subset
    currSubset<-relevantFeatures[relevantFeatures$ActivityIDX == activityLoop & relevantFeatures$SubjectIDX == subjectLoop,][,1:nRelevantFeatures]
    #dimenstions of current subset
    nRows<-nrow(currSubset)
    
    if (nRows > 0) {
      if (first){
        #prepare the data frame (for first=TRUE)
        finalSet<-apply(currSubset,2,mean)
        finalSet<-data.frame(as.list(finalSet))
        finalSet<-cbind(finalSet, 1)
        finalSet<-cbind(finalSet, 1)
        colnames(finalSet)[length(finalSet)-1]<-"Subject"
        colnames(finalSet)[length(finalSet)]<-"Activity"
        first<-FALSE
      } else {
        #add next mean values (for first=FALSE)  
        finalSet<-rbind(finalSet, apply(currSubset,2,mean))
        finalSet[irow,length(finalSet)-1]<-subjectLoop
        finalSet[irow,length(finalSet)]<-activityLoop
      }
      
    }
  }
}
rm(relevantFeaturesLabels, currSubset)