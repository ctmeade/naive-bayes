#Package for naiveBayes
require(e1071)

#Importing the training and test data sets, and assigning variables names
train_variables <- c("age","workclass","fnlwgt","education","education-num","marital-status","occupation","relationship","race","sex","capital-gains","capital-losses","hoursweek","native-country","income")
training <- read.table("training.txt", header = FALSE, col.names = train_variables)
test <- read.table("training.txt", header = FALSE, col.names = train_variables)
#Explore Data
summary(training)
head(training)
tail(training)

#Data Preparation

#Remove education-num b/c redundant, fnlwgt b/c ananlysis not advanced enough
training[["education-num"]] = NULL
training[["fnlwgt"]] = NULL
test[["education-num"]] = NULL
test[["fnlwgt"]] = NULL

#Create Model
nb_model <- naiveBayes(income~.,data = training)
summary(nb_model)
str(nb_model)

#Model Analyitics
nb_test_predict <- predict(nb_model,testHouseVotes84[,-1])
#confusion matrix
table(pred=nb_test_predict,true=testHouseVotes84$Class)