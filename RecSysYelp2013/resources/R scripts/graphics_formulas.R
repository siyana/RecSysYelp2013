library(ggplot2)

baseGraphicsPath = "E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\graphics\\"

compare = function (a, xCol, yCol) {
   qplot(data = a, xlab = "real", ylab = "predicted", x = a[xCol], y = a[yCol], geom = "jitter")
}

pPlot = function (a,xCol) {
   qplot(data = a, x = a[xCol], geom = "histogram")
}

compareFileName = function(xName, xColumnName) {
    fileNameCompare = paste(paste(xName, "real_", sep = "_"), xColumnName, ".png", sep = "")
    fullFileName = paste(baseGraphicsPath,xColumnName,"\\", fileNameCompare, sep = "")
}

plotFileName = function(xName, xColumnName) {
    fileNamePlot = paste(xName, xColumnName, sep = "_")
    fullFileName = paste(baseGraphicsPath, xColumnName,"\\", paste(xName, ".png", sep = ""), sep = "")
}

plotErrorFileName = function(xName, parameterName) {
    fileNamePlot = paste(xName, parameterName, sep = "_")
    fullFileName = paste(baseGraphicsPath, "parameter_change","\\", paste(xName,"_",parameterName, ".png", sep = ""), sep = "")
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