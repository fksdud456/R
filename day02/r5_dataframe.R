library(ggplot2)
data <- c(10,50,20,20,20,30,70)
qplot(data)

mpg

hwy

qplot(data=mpg, y = hwy, x= drv)
qplot(data=mpg, y = hwy, x= drv, geom = "boxplot")
qplot(data=mpg, y = hwy, x= drv, geom = "line", colour = drv)
?qplot
