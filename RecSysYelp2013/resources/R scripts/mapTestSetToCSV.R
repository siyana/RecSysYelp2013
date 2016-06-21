library(rjson)

#usersMap =data.frame(userId = users$user_id, newUserId = 1:nrow(users))
usersPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\users_mapping.csv"
#write.csv(usersMap, file = usersPath , row.names=FALSE, fileEncoding = "UTF-8") 

#busMap =data.frame(businessId = business$business_id, newBusinessId = 1:nrow(business))
busPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\business_mapping.csv"
#write.csv(busMap , file = busPath , row.names=FALSE, fileEncoding = "UTF-8") 

users = read.csv(usersPath)
business = read.csv(busPath)
path <- "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\final_test_set\\final_test_set_review.json"


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
        if (length(knownUser) <= 0) {
           knownUser = nrow(users) + 1
           users <<- rbind(users, data.frame(userId = userID, newUserId = knownUser))
        } 
        if(length(knownBus) <= 0){
          knownBus = nrow(business) + 1
          business <<- rbind(business, data.frame(businessId = busID, newBusinessId = knownBus))
        }
        print(userID)
        print(knownUser) 
        print(length(knownUser) > 0 && length(knownBus) > 0)
        
        if(length(knownUser) > 0 && length(knownBus) > 0) {
        jsonDF = data.frame(userId = knownUser, businessId = knownBus, reviewId = a$review_id)
        }
        jsonDF        
    })

    #df <- do.call(rbind.data.frame, jsonList)
}

#users = read(userPath)
#business = read(busPath)
jsonList = read(path)

realTestReviews = do.call(rbind.data.frame, jsonList)
tt = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\mappedTestReviews.csv"
write.csv(realTestReviews , file = tt,row.names = FALSE,fileEncoding = "UTF-8") 

testSet = data.frame(userId = realTestReviews$userId,busId = realTestReviews$businessId)
testPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\finalTestSetMapped.csv"
write.csv(testSet , file = testPath ,col.names = FALSE, row.names=FALSE, fileEncoding = "UTF-8") 

submissionPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\submission_test.csv"
submissionSet = read.csv(submissionPath )
attach(submissionSet)

submissionDF = data.frame();
for(i in 1:nrow(submissionSet)){
reviewID = toString(realTestReviews[i,]$reviewId)
stars = submissionSet$stars[i]
x = data.frame(review_id = reviewID, stars = stars)
print(x)
submissionDF = rbind(submissionDF,x)
}

finalPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\finalSubmission.csv"
write.csv(submissionDF, file = finalPath, row.names=FALSE, fileEncoding = "UTF-8") 
