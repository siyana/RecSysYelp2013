preference1 = read.csv("E:\\Projects\\Workspace\\RecSysYelp2013\\RecSysYelp2013\\RecSysYelp2013\\resources\\mapped\\preferences_1.csv")

library(ggplot2)
compare = function (a, xCol, yCol) {
  qplot(data = a, y = a[yCol], x = a[xCol], geom = "jitter")
}

plot = function (a,xCol) {
   qplot(data = a, x = a[xCol], geom = "histogram")
}

compare(preference1,3,5)
plot(preference1, 6)


