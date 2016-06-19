library(rjson)

#usersMap =data.frame(userId = users$user_id, newUserId = 1:nrow(users))
usersPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\users_mapping.csv"
#write.csv(usersMap, file = usersPath , row.names=FALSE, fileEncoding = "UTF-8") 

#busMap =data.frame(businessId = business$business_id, newBusinessId = 1:nrow(business))
busPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\business_mapping.csv"
#write.csv(busMap , file = busPath , row.names=FALSE, fileEncoding = "UTF-8") 

users = read.csv(usersPath)
business = read.csv(busPath)
path <- "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\yelp_training_set_review.json"


read <- function (path) {

    c <- file(path, "r")
    l <- readLines(c, -1L)

    jsonList <- lapply(X = l, function(j) {
        a = fromJSON(j)
        a = as.data.frame(replace(a, sapply(a, is.list), NA))
        userID = toString(a$user_id)
        busID = toString(a$business_id)
        knownUser = users[which(users$userId == userID),2]
        knownBus =  business[which(business$businessId == busID),2]

       jsonDF = NULL
       if (length(knownUser) > 0 && length(knownBus) > 0) {
          jsonDF = data.frame(userId = knownUser, businessId = knownBus, stars = a$stars)  
        } else {
        print(userID)
        print(knownBus) 
        print(length(knownUser) > 0 && length(knownBus) > 0)
        }
        jsonDF        
    })

    #df <- do.call(rbind.data.frame, jsonList)
}

#users = read(userPath)
#business = read(busPath)
jsonList = read(path)

indexes <- sample(2, length(jsonList), replace=TRUE, prob=c(0.7, 0.3)) #create a sample list ot 1/2
trainData <- jsonList[indexes == 1] # indexes == 1 returns true or false for each value
testData <- jsonList[indexes == 2]

reviewsTest = do.call(rbind.data.frame, testData)
#tt = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\test.csv"
#t = write.csv(testData , file = tt,row.names = FALSE,fileEncoding = "UTF-8") 

testPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\yelp_training_set_review_test.csv"
x = write.csv(reviewsTest , file = testPath , row.names=FALSE, fileEncoding = "UTF-8") 

reviewsTrain = do.call(rbind.data.frame, trainData)

trainPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\yelp_training_set_review_train.csv"
y = write.csv(reviewsTrain , file = trainPath, row.names=FALSE, fileEncoding = "UTF-8") 