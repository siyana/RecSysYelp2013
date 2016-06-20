path <- "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\yelp_training_set_review_train.csv"
csv = read.csv(path,sep = ",")
attach(csv)
indexes <- sample(2, nrow(csv), replace=TRUE, prob=c(0.8, 0.2)) #create a sample list ot 1/2
testData <- csv[indexes == 2,]


trainPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\test_from_train.csv"
write.csv(testData , file = trainPath, row.names=FALSE, fileEncoding = "UTF-8") 