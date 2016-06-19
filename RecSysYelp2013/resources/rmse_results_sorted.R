source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\help_formulas.R")
source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\graphics_formulas.R")

resultsPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_s.csv"

preference1 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_1.csv")
preference2 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_2.csv")
preference3 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3.csv")
preference4 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_4.csv")
preference5 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_5.csv")
preference6 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_6.csv")
preference7 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_7.csv")
preference8 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_8.csv")
preference_hybrid = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3_hybrid.csv")
preference_hybrid_w = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3_hybrid_weighted.csv")

existingDFS = data.frame()

calculateErrorS = function(x,y,z,k){
   pr1 = pRmse(y,4)
   pr2 = pRmse(z,5)
   pr3 = pRmse(x,6)
   pr4 = pRmse(k,7)

   y = data.frame(svdPref = pr1, svdPlusPlusPref = pr2,
                  userPref = pr3, itemPref = pr4)
}
#threshold,lambda, numIter,
existingDFS = rbind(existingDFS,calculateErrorS(preference4, preference4, preference3, preference1))
existingDFS = rbind(existingDFS,calculateErrorS(preference1, preference1, preference_hybrid, preference2))
existingDFS = rbind(existingDFS,calculateErrorS(preference2, preference2, preference_hybrid_w, preference3))
existingDFS = rbind(existingDFS,calculateErrorS(preference3, preference5, preference7, preference4))
existingDFS = rbind(existingDFS,calculateErrorS(preference_hybrid, preference6, preference8, preference5))
existingDFS = rbind(existingDFS,calculateErrorS(preference_hybrid_w, preference3, preference1, preference6))
existingDFS = rbind(existingDFS,calculateErrorS(preference8, preference8,preference2, preference8))
existingDFS = rbind(existingDFS,calculateErrorS(preference5, preference_hybrid, preference5,preference7))
existingDFS = rbind(existingDFS,calculateErrorS(preference6, preference_hybrid_w, preference4,preference_hybrid))
existingDFS = rbind(existingDFS,calculateErrorS(preference7, preference7, preference6, preference_hybrid_w))

row.names(existingDFS ) = c("1","2","3","4","5","6","7","8","9")

write.csv(existingDFS , file = resultsPath , row.names=TRUE, fileEncoding = "UTF-8") 


svdPar = data.frame()

calculateSVDErr = function(x,y,z) {
	pr1 = pRmse(x,4)
	pr2 = pRmse(y,4)
	pr3 = pRmse(z,4)
	
	y = data.frame(numFeatures = pr1, lambda = pr2,
                  numIterations = pr3)	
}

svdPar = rbind(svdPar,calculateSVDErr(preference1, preference4, preference5))
svdPar = rbind(svdPar,calculateSVDErr(preference2, preference1, preference1))
svdPar = rbind(svdPar,calculateSVDErr(preference3, preference2, preference2))
svdPar = rbind(svdPar,calculateSVDErr(preference4, preference5, preference3))
svdPar = rbind(svdPar,calculateSVDErr(preference5, preference6, preference4))
svdPar = rbind(svdPar,calculateSVDErr(preference6, preference3, preference7))
svdPar = rbind(svdPar,calculateSVDErr(preference7, preference_hybrid, preference_hybrid))
svdPar = rbind(svdPar,calculateSVDErr(preference_hybrid, preference_hybrid_w, preference_hybrid_w))
svdPar = rbind(svdPar,calculateSVDErr(preference_hybrid_w, preference7, preference6))
svdPar = rbind(svdPar,calculateSVDErr(preference8, preference8, preference8))

row.names(svdPar ) = c("1","2","3","4","5","6","7","8","9","10")
resultsPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_svd.csv"

write.csv(svdPar , file = resultsPath , row.names=TRUE, fileEncoding = "UTF-8") 

svdPlPlPar = data.frame()

calculateSVDErr = function(x,y,z) {
	pr1 = pRmse(x,5)
	pr2 = pRmse(y,5)
	
	y = data.frame(numFeatures = pr1,
                  numIterations = pr2)	
}

svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference1, preference3))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference2, preference_hybrid))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference3, preference_hybrid_w))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference4, preference7))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference_hybrid, preference8))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference_hybrid_w, preference1))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference7, preference2))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference5, preference5))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference6, preference4))
svdPlPlPar = rbind(svdPlPlPar,calculateSVDErr(preference8, preference6))

row.names(svdPlPlPar ) = c("1","2","3","4","5","6","7","8","9","10")
resultsPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_svd++.csv"

write.csv(svdPlPlPar , file = resultsPath , row.names=TRUE, fileEncoding = "UTF-8") 