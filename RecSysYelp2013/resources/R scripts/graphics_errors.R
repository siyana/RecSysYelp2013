source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\R scripts\\graphics_formulas.R")
source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\R scripts\\help_formulas.R")

errors = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_s.csv")
attach(errors)

library(ggplot2)

png(filename=plotErrorFileName (varToString(all), "errors"))
ggplot() + 
  geom_line(data = errors, aes(y = svdPref, x = 1:10, color = "svd")) +
  geom_line(data = errors, aes(y = userPref, x = 1:10, color = "user based"))  +
  geom_line(data = errors, aes(y = itemPref, x = 1:10, color = "item based")) +
  geom_line(data = errors, aes(y = svdPlusPlusPref, x = 1:10, color = "svd++")) +
  xlab('number of preference set') +
  ylab('rmse')

dev.off()

threshold = c(0.025,0.05,0.05,0.1,0.1, 0.1,0.1,0.2,0.25,0.5)
userBased = data.frame(userPref,threshold)
png(filename=plotErrorFileName (varToString(userBased), "threshold"))
   ggplot() + geom_point(data = userBased , aes(y = userPref, x = threshold, color = "user based")) +
   ylab("rmse - user based") + xlab("threshold") +
   geom_text(aes(y = userPref, x = threshold, label = paste(round(userPref, 3)),
   hjust=0, vjust=-0.3, angle = 0), check_overlap = FALSE, size=rel(2.3))
dev.off()

lambda = c(0.025,0.05,0.05,0.05,0.05,0.1,0.1,0.1, 0.1,0.1)
svd = data.frame(svdPref,lambda)
png(filename=plotErrorFileName (varToString(svd), "lambda"))
   ggplot() + geom_point(data = svd, aes(y = svdPref, x = lambda, color = "svd")) +
   ylab("rmse - svd") + xlab("lambda") +
   geom_text(aes(y = svdPref, x = lambda, label = paste(round(svdPref, 2)),
   hjust=0.3, vjust=-0.3, angle = 0), check_overlap = TRUE)
dev.off()

numIterations = c(10,10,10,10, 10,20,20,20, 30,30)
svdPlusPlus = data.frame(svdPlusPlusPref,numIterations)
png(filename=plotErrorFileName (varToString(svdPlusPlus), "numIterations"))
   ggplot() + geom_point(data = svdPlusPlus, aes(y = svdPlusPlusPref, x = numIterations, color = "svd++")) +
   ylab("rmse - svd++") + xlab("num iterations") +
   geom_text(aes(y = svdPlusPlusPref, x = numIterations, label = paste(round(svdPlusPlusPref, 2)),
   hjust=0, vjust=-0.3, angle = 0), check_overlap = TRUE)
dev.off()

rows = 1:10
itemBased = data.frame(itemPref,rows)
png(filename=plotErrorFileName(varToString(itemBased), "rows"))
   ggplot() + geom_point(data = itemBased, aes(y = itemPref, x = rows, color = "item based")) + 
   ylab("rmse - item based") + xlab("") +
   geom_text(aes(y = itemPref, x = rows, label = paste(round(itemPref, 2)),
   hjust=0, vjust=-0.3, angle = 60), check_overlap = TRUE)

dev.off()


errorsSVD = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_svd.csv")
attach(errorsSVD)
numIterationsSVD = c(50,100,100,100,100,100,100,100, 100,150)
svdNI = data.frame(errorsSVD$numIterations,numIterationsSVD)
png(filename=plotErrorFileName (varToString(svdNI), "numIterationsSVD"))
   ggplot() + geom_point(data = svdNI , aes(y = errorsSVD$numIterations, x = numIterationsSVD, color = "svd")) +
   ylab("rmse - svd") + xlab("num iterations") +
   geom_text(aes(y = errorsSVD$numIterations, x = numIterationsSVD, label = paste(round(errorsSVD$numIterations, 2),",",lambda ),
   hjust=0.3, vjust=-0.3, angle = 45), check_overlap = TRUE)
dev.off()

errorsSVDPl = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_svd++.csv")
attach(errorsSVDPl)
numFeaturesSVDPl = c(2,2,2,2,2,2,2,3,3,5)
svdPlPlNF = data.frame(errorsSVD$numIterations,numFeaturesSVDPl)
png(filename=plotErrorFileName (varToString(svdPlPlNF), "numFeaturesSVDPl"))
   ggplot() + geom_point(data = svdPlPlNF , aes(y = errorsSVDPl$numFeatures, x = numFeaturesSVDPl, color = "svd++")) +
   ylab("rmse - svd++") + xlab("num features") +
   geom_text(aes(y = errorsSVDPl$numFeatures, x = numFeaturesSVDPl, label = paste(round(errorsSVDPl$numFeatures, 2),",",numIterations ),
   hjust=0, vjust=-0.3, angle = 60), check_overlap = TRUE)
dev.off()