
library(dplyr)

exam <- read.csv('csv_exam.csv')
colnames(exam) <- c('id','class','math','english', 'science')

c1 <- exam %>% filter(class==1)
c1 <- exam[exam$class == 1, ]

# 수학점수가 50점 이상인 사람
math.overfifty <- exam[exam$math > 50, ]
math.overfiftySQL <- sqldf('SELET * FROM exam WHERE math >= 50 AND english >= 30')

# matching 확인 class에 1,3,이 속해있는 것을 가져와라?
c3 <- exam[exam$class %in% c(1,3), ]


# p.133 복습하
library(ggplot2)
tmp <- aggregate(hwy~displ <= 4, mpg, mean)
qplot(tmp$hwy, x = c('5 <= ', '4 >= '))
result1 <- aggregate(cty~manufacturer, mpg, mean)
result2 <- rewult1[result1$manufacturer %in% c('audi', 'toyota'), ]

result3 <- aggregate(hwy~manufacturer, mpg, mean)
result4 <- result1[result3$manufacturer %in% c('chevroltet', 'ford', 'honda'), ]


# 실습
car1<-mpg %>% filter(displ<=4)
car2<-mpg %>% filter(displ>5)
avg <- mean(car1$hwy)
avg2 <- mean(car2$hwy)
avg3 <- aggregate(hwy~displ,mpg,mean)
class(avg3)
avg4 <- colMeans(avg3[avg3$displ<=4,])
avg5 <- colMeans(avg3[avg3$displ>5,])


car3<-mpg %>% filter(manufacturer=='audi')
car4<-mpg %>% filter(manufacturer=='toyota')
cty_avg1 <- mean(car3$cty)
cty_avg2 <- mean(car4$cty)
aggregate(cty~manufacturer,mpg,mean)

car5<-mpg %>% filter(manufacturer %in% c('chevrolet','ford','honda'))
hwy_avg <- mean(car5$hwy)