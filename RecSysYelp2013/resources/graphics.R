preference1 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_1.csv")
preference2 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_2.csv")

library(ggplot2)
library(hydroGOF)

compare = function (a, xCol, yCol) {
  qplot(data = a, y = a[yCol], x = a[xCol], geom = "jitter", xlab = "real",ylab = "predicted")
}

plot = function (a,xCol) {
   qplot(data = a, x = a[xCol], geom = "histogram")
}

compare(preference1,3,5)
plot(preference1, 6)

compare(preference2,3,5)
plot(preference1, 6)

rmse(preference1[4],preference1[3])
rmse(preference2[4],preference2[3])

unownuser = length(which(preference1[6]==-2))
unknownitem = length(which(preference1[7]==-2))
