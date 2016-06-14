
#userPath <- "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\yelp_training_set_user.json"
busPath <- "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\yelp_training_set_business.json"

read <- function (path) {

    c <- file(path, "r")
    l <- readLines(c, -1L)

    jsonList <- lapply(X = l, function(j) {
       a = fromJSON(j)
       a = as.data.frame(replace(a, sapply(a, is.list), NA))
       jsonDF = data.frame(a$business_id) 
      
       unique(jsonDF)

    })

    df <- do.call(rbind.data.frame, jsonList)
}

#users = read(userPath)
business = read(busPath)

busMap = data.frame(businessId = business$a.business_id, newBusinessId = 1:nrow(business))

bPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\business_mapping.csv"
write.csv(busMap , file = bPath, row.names=FALSE, fileEncoding = "UTF-8") 

#uPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\yelp_training_set\\users_mapping.csv"
#write.csv(users , file = uPath, row.names=FALSE, fileEncoding = "UTF-8") 
