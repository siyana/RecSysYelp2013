source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\help_formulas.R")
resultsPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results.csv"

preference1 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_1.csv")
preference2 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_2.csv")
preference3 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3.csv")
preference4 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_4.csv")
preference5 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_5.csv")
preference6 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_6.csv")

preference_hybrid = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3_hybrid.csv")


existingDF = data.frame()
calculateError = function(col){
   pr1 = pRmse(preference1,col)
   pr2 = pRmse(preference2,col)
   pr3 = pRmse(preference3,col)
   pr4 = pRmse(preference4,col)
   pr5 = pRmse(preference5,col)
   pr6 = pRmse(preference6,col)
   pr7 = pRmse(preference_hybrid,col)
   x = data.frame(preference_1_rmse = pr1, preference_2_rmse = pr2,
                  preference_3_rmse = pr3, preference_4_rmse = pr4,
                  preference_5_rmse = pr5, preference_6_rmse = pr6,
                  preference_3_hybrid_rmse = pr7)
}
existingDF = rbind(existingDF,calculateError(4))
existingDF = rbind(existingDF,calculateError(5))
existingDF = rbind(existingDF,calculateError(6))
existingDF = rbind(existingDF,calculateError(7))

write.csv(existingDF, file = resultsPath , row.names=TRUE, fileEncoding = "UTF-8") 