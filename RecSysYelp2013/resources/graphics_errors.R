source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\graphics_formulas.R")
source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\help_formulas.R")

errors = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_s.csv")
attach(errors)

library(ggplot2)

png(filename=plotErrorFileName (varToString(all), "errors"))
ggplot() + 
  geom_line(data = errors, aes(y = svdPref, x = 1:10, color = "red")) +
  geom_line(data = errors, aes(y = userPref, x = 1:10, color = "blue"))  +
  geom_line(data = errors, aes(y = itemPref, x = 1:10, color = "green")) +
  geom_line(data = errors, aes(y = svdPlusPlusPref, x = 1:10, color = "yellow")) +
  xlab('number of preference set') +
  ylab('rmse')

dev.off()

threshold = c(0.025,0.05,0.05,0.1,0.1, 0.1,0.1,0.2,0.25,0.5)
userBased = data.frame(userPref,threshold)
png(filename=plotErrorFileName (varToString(userBased), "threshold"))
   ggplot() + geom_line(data = userBased , aes(y = userPref, x = threshold, color = "red"))
dev.off()

lambda = c(0.025,0.05,0.05,0.05,0.05,0.1,0.1,0.1, 0.1,0.1)
svd = data.frame(svdPref,lambda)
png(filename=plotErrorFileName (varToString(svd), "lambda"))
   ggplot() + geom_line(data = svd, aes(y = svdPref, x = lambda, color = "red"))
dev.off()

numIterations = c(10,10,10,10, 10,20,20,20, 30,30)
svdPlusPlus = data.frame(svdPlusPlusPref,numIterations)
png(filename=plotErrorFileName (varToString(svdPlusPlus), "numIterations"))
   ggplot() + geom_line(data = svdPlusPlus, aes(y = svdPlusPlusPref, x = numIterations, color = "red"))
dev.off()

rows = 1:10
itemBased = data.frame(itemPref,rows)
png(filename=plotErrorFileName(varToString(itemBased), "rows"))
   ggplot() + geom_line(data = itemBased, aes(y = itemPref, x = rows, color = "red"))
dev.off()


errorsSVD = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_svd.csv")
attach(errorsSVD)
numIterationsSVD = c(50,100,100,100,100,100,100,100, 100,150)
svdNI = data.frame(errorsSVD$numIterations,numIterationsSVD)
png(filename=plotErrorFileName (varToString(svdNI), "numIterationsSVD"))
   ggplot() + geom_line(data = svdNI , aes(y = errorsSVD$numIterations, x = numIterationsSVD, color = "red"))
dev.off()

errorsSVDPl = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\rmse_results_svd++.csv")
attach(errorsSVDPl)
numFeaturesSVDPl = c(2,2,2,2,2,2,2,3,3,5)
svdPlPlNF = data.frame(errorsSVD$numIterations,numFeaturesSVDPl)
png(filename=plotErrorFileName (varToString(svdPlPlNF), "numFeaturesSVDPl"))
   ggplot() + geom_line(data = svdPlPlNF , aes(y = errorsSVDPl$numFeatures, x = numFeaturesSVDPl, color = "red"))
dev.off()
