library(rjson)

#usersMap =data.frame(userId = users$user_id, newUserId = 1:nrow(users))
usersPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\users_mapping.csv"
#write.csv(usersMap, file = usersPath , row.names=FALSE, fileEncoding = "UTF-8") 

busPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\business_mapping.csv"


users = read.csv(usersPath)
business = read.csv(busPath)

uTrainingPath <- "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\yelp_training_set_user.json";
busTrainingPath <- "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\yelp_training_set_business.json";


read <- function (path) {

    c <- file(path, "r")
    l <- readLines(c, -1L)

    jsonList <- lapply(X = l, function(j) {
        a = fromJSON(j)
        a = as.data.frame(replace(a, sapply(a, is.list), NA))
        #userID = toString(a$user_id)
        busID = toString(unique(a$business_id))
        #knownUser = users[which(users$userId == userID),2]
        knownBus =  business[which(business$businessId == busID),2]

       jsonDF = NULL
       #if (length(knownUser) > 0 && length(knownBus) > 0) {
        if(length(knownBus) > 0) {
print(busID )
          #jsonDF = data.frame(userId = knownUser, avg_stars = a$average_stars)
jsonDF = data.frame(businessId = knownBus, avg_stars = a$stars)  
  
        } else {
print("Else")
        print(busID )
       # print(knownBus) 
       # print(length(knownUser) > 0 && length(knownBus) > 0)
        }
        unique(jsonDF)        
    })

    #df <- do.call(rbind.data.frame, jsonList)
}
#uMap = read(uTrainingPath )
#binded = do.call(rbind.data.frame, uMap );
#mappedPath =  "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\users_average_ratings.csv";
#write.csv(binded , file = mappedPath, row.names=FALSE, fileEncoding = "UTF-8") 

busMap = read(busTrainingPath)
binded = do.call(rbind.data.frame, busMap );
mappedPath =  "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\business_average_ratings.csv";
write.csv(binded , file = mappedPath, row.names=FALSE, fileEncoding = "UTF-8") 