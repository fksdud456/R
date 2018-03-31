library('ggplot2')

# 
heaD(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
#column에 대한 summary
summary(mpg)

tf <- data.frame(x = c(1:5), y = c(6:10))
tfc <- tf
# dataframe colum명은 colnames로 변경
# vector colum 명은 names로 변경
colnames(tfc) <- c('col1','col2')

?aggregate

library(dplyr)
tfc <- rename(tf,'xx1'   = x)

mpgcp <- mpg
mpgcp <- rename(mpgcp, 'city' = cty, 'highway' =hwy)
mpgcp$total <- (mpgcp$city+mpgcp$highway)/2

#histogram 그리기
hist(mpgcp$total)
View(mpgcp)
mpgcp$test <- ifelse(mpgcp$total >=20 , 'PASS', 'FAIL')

# 특정 colum을 기준으로 데이터를 세는거?
v1 <- as.vector(table(mpgcp$test))
qplot(mpgcp$test)

mpgcp$grade <- ifelse(mpgcp$total >=30 , 'A',
                      ifelse(mpgcp$total >= 20 , 'B', 'C'))
qplot(mpgcp$grade)
