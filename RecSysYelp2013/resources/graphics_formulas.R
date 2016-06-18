library(ggplot2)

baseGraphicsPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\graphics\\"

compare = function (a, xCol, yCol) {
   qplot(data = a, xlab = "real", ylab = "predicted", x = a[xCol], y = a[yCol], geom = "jitter")
}

pPlot = function (a,xCol) {
   qplot(data = a, x = a[xCol], geom = "histogram")
}

rmsePlot = function(dataSet, predictedCol, rmseValue) {
## fit model
y = userPref
x = realPref
fit <- lm(x~y, data = preference1)
coefs <- coef(fit)
b0 <- round(coefs[1], 2)
b1 <- round(coefs[2],2)
r2 <- round(summary(fit)$r.squared, 2)

eqn <- bquote(italic(y) == .(b0) + .(b1)*italic(x) * "," ~~ 
                  r^2 == .(r2) * "," ~~ RMSE == .(rmseValue))
## Plot the data
plot(x ~ y, data = data.frame(userId,realPref))
abline(fit)
text(2, 10, eqn, pos = 4)
}

compareFileName = function(xName, xColumnName) {
    fileNameCompare = paste(paste(xName, "real_", sep = "_"), xColumnName, ".png", sep = "")
    fullFileName = paste(baseGraphicsPath,xColumnName,"\\", fileNameCompare, sep = "")
}

plotFileName = function(xName, xColumnName) {
    fileNamePlot = paste(xName, xColumnName, sep = "_")
    fullFileName = paste(baseGraphicsPath, xColumnName,"\\", paste(xName, "_svd.png", sep = ""), sep = "")
}

#save_png = function(x, predictedColumnNumber, xName, xColumnName) {
    
#    fullFileName = compareFileName(xName, xColumnName)
#    png(filename=fullFileName)
#        compare(x,3,predictedColumnNumber)
#    dev.off()

#    fullFileName = plotFileName(xName, xColumnName)
#    png(filename=fullFileName)
#        plot(x, predictedColumnNumber)
#     dev.off()
#}