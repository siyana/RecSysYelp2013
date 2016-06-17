source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\graphics_formulas.R")
source("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\help_formulas.R")


preference1 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_1.csv")
preference2 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_2.csv")
preference3 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_3.csv")
preference4 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_4.csv")
preference5 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_5.csv")
preference6 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_6.csv")



#svd
realCol = 3
xName = "svd"
xCol = 4
png(filename=compareFileName(varToString(preference1), xName))
   compare(preference1,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference1), xName))
   pPlot(preference1, xCol )
dev.off()

##preferences 2
png(filename=compareFileName(varToString(preference2), xName))
   compare(preference2,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference2), xName))
   pPlot(preference2, xCol )
dev.off()

##preferences3
png(filename=compareFileName(varToString(preference3), xName))
   compare(preference3,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference3), xName))
   pPlot(preference3, xCol )
dev.off()

##preferences4
png(filename=compareFileName(varToString(preference4), xName))
   compare(preference4,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference4), xName))
   pPlot(preference4, xCol)
dev.off()

##preferences5
png(filename=compareFileName(varToString(preference5), xName))
   compare(preference5,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference5), xName))
   pPlot(preference5, xCol)
dev.off()

##preferences6
png(filename=compareFileName(varToString(preference6), xName))
   compare(preference5,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference6), xName))
   pPlot(preference6, xCol)
dev.off()




#svd++
realCol = 3
xName = "svd++"
xCol = 5
png(filename=compareFileName(varToString(preference1), xName))
   compare(preference1,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference1), xName))
   pPlot(preference1, xCol )
dev.off()

##preferences 2
png(filename=compareFileName(varToString(preference2), xName))
   compare(preference2,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference2), xName))
   pPlot(preference2, xCol )
dev.off()

##preferences3
png(filename=compareFileName(varToString(preference3), xName))
   compare(preference3,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference3), xName))
   pPlot(preference3, xCol )
dev.off()

##preferences4
png(filename=compareFileName(varToString(preference4), xName))
   compare(preference4,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference4), xName))
   pPlot(preference4, xCol)
dev.off()

##preferences5
png(filename=compareFileName(varToString(preference5), xName))
   compare(preference5,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference5), xName))
   pPlot(preference5, xCol)
dev.off()

##preferences6
png(filename=compareFileName(varToString(preference6), xName))
   compare(preference5,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference6), xName))
   pPlot(preference6, xCol)
dev.off()



#userBased
realCol = 3
xName = "userBased"
xCol = 6
png(filename=compareFileName(varToString(preference1), xName))
   compare(preference1,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference1), xName))
   pPlot(preference1, xCol )
dev.off()

##preferences 2
png(filename=compareFileName(varToString(preference2), xName))
   compare(preference2,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference2), xName))
   pPlot(preference2, xCol )
dev.off()

##preferences3
png(filename=compareFileName(varToString(preference3), xName))
   compare(preference3,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference3), xName))
   pPlot(preference3, xCol )
dev.off()

##preferences4
png(filename=compareFileName(varToString(preference4), xName))
   compare(preference4,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference4), xName))
   pPlot(preference4, xCol)
dev.off()

##preferences5
png(filename=compareFileName(varToString(preference5), xName))
   compare(preference5,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference5), xName))
   pPlot(preference5, xCol)
dev.off()

##preferences6
png(filename=compareFileName(varToString(preference6), xName))
   compare(preference5,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference6), xName))
   pPlot(preference6, xCol)
dev.off()


#itemBased
realCol = 3
xName = "itemBased"
xCol = 7
png(filename=compareFileName(varToString(preference1), xName))
   compare(preference1,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference1), xName))
   pPlot(preference1, xCol )
dev.off()

##preferences 2
png(filename=compareFileName(varToString(preference2), xName))
   compare(preference2,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference2), xName))
   pPlot(preference2, xCol )
dev.off()

##preferences3
png(filename=compareFileName(varToString(preference3), xName))
   compare(preference3,realCol ,xCol )
dev.off()

png(filename=plotFileName(varToString(preference3), xName))
   pPlot(preference3, xCol )
dev.off()

##preferences4
png(filename=compareFileName(varToString(preference4), xName))
   compare(preference4,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference4), xName))
   pPlot(preference4, xCol)
dev.off()

##preferences5
png(filename=compareFileName(varToString(preference5), xName))
   compare(preference5,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference5), xName))
   pPlot(preference5, xCol)
dev.off()

##preferences6
png(filename=compareFileName(varToString(preference6), xName))
   compare(preference5,realCol ,xCol)
dev.off()

png(filename=plotFileName(varToString(preference6), xName))
   pPlot(preference6, xCol)
dev.off()



