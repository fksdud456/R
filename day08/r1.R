library(sqldf)

str(iris)

mydata <- sqldf('SELECT * FROM iris WHERE species = "setosa"')

df <- iris[c(iris$Species == 'setosa'), ]
iris$Petal.Length
library(dplyr)

# 첫 번째부터 네 번째 줄까지 평균을 구한다
species.sum <- sqldf('SELECT AVG("Sepal.Length"), 
                     AVG("Sepal.width"), 
                     AVG("Petal.Length"),
                     AVG("Petal.width")
                     FROM iris GROUP BY Species')

species.sum1 <- aggregate(Sepal.Length~Species, iris, mean)

species.sum2 <- iris %>% 
  group_by(Species) %>% 
  summarise_all(mean)

species.sum3 <- apply(
  iris[, c(1:4)], 2, tapply, INDEX = iris$Species, mean)

library(ggplot2)
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) + geom_line()
ggplot(iris, aes(x = Sepal.Width, y = Petal.Width)) + geom_line()