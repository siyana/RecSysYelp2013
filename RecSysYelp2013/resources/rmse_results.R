source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\help_formulas.R")
source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\graphics_formulas.R")

resultsPathT = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_t.csv"
resultsPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results.csv"

preference1 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_1.csv")
preference2 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_2.csv")
preference3 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3.csv")
preference4 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_4.csv")
preference5 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_5.csv")
preference6 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_6.csv")
preference7 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_7.csv")


preference_hybrid = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3_hybrid.csv")
preference_hybrid_w = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3_hybrid_weighted.csv")


existingDF = data.frame()
calculateError = function(col){
   pr1 = pRmse(preference1,col)
   pr2 = pRmse(preference2,col)
   pr3 = pRmse(preference3,col)
   pr4 = pRmse(preference4,col)
   pr5 = pRmse(preference5,col)
   pr6 = pRmse(preference6,col)
   pr7 = pRmse(preference7,col)
   pr8 = pRmse(preference_hybrid,col)
   pr9 = pRmse(preference_hybrid_w,col)
   x = data.frame(preference_1_rmse = pr1, preference_2_rmse = pr2,
                  preference_3_rmse = pr3, preference_4_rmse = pr4,
                  preference_5_rmse = pr5, preference_6_rmse = pr6,
                  preference_7_rmse = pr7,
                  preference_3_hybrid_rmse = pr8, preference_3_hybrid_w_rmse = pr9)
}

existingDF = rbind(existingDF,calculateError(4))
existingDF = rbind(existingDF,calculateError(5))
existingDF = rbind(existingDF,calculateError(6))
existingDF = rbind(existingDF,calculateError(7))
write.csv(existingDF, file = resultsPath , row.names=TRUE, fileEncoding = "UTF-8") 

existingDFT = data.frame()

calculateErrorT = function(x){
   pr1 = pRmse(x,4)
   pr2 = pRmse(x,5)
   pr3 = pRmse(x,6)
   pr4 = pRmse(x,7)

   y = data.frame(svdPref = pr1, svdPlusPlusPref = pr2,
                  userPref = pr3, itemPref = pr4)
}

existingDFT = rbind(existingDFT,calculateErrorT(preference1))
existingDFT = rbind(existingDFT,calculateErrorT(preference2))
existingDFT = rbind(existingDFT,calculateErrorT(preference3))
existingDFT = rbind(existingDFT,calculateErrorT(preference4))
existingDFT = rbind(existingDFT,calculateErrorT(preference5))
existingDFT = rbind(existingDFT,calculateErrorT(preference6))
existingDFT = rbind(existingDFT,calculateErrorT(preference7))
existingDFT = rbind(existingDFT,calculateErrorT(preference_hybrid))
existingDFT = rbind(existingDFT,calculateErrorT(preference_hybrid_w))

row.names(existingDFT) = c("pref1","pref2","pref3","pref4","pref5","pref6","pref7","pref_h","pref_h_w")

write.csv(existingDFT, file = resultsPathT , row.names=TRUE, fileEncoding = "UTF-8") 