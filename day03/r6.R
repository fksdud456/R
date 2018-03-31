library(ggplot2)

exam

exam[exam$class == 1, 'english']
exam[exam$class == 2, c('english', 'math')]
tmp <- sort(exam$math)

class(exam)

sort(exam, x = exam$math)
?sort

exam[order(exam$math), ]
exam[order(exam$math, decreasing = T), ]

exam[order(exam$math,exam$class ), ]

?order

exam[order(exam$class,exam$english), ]
exam1 <- exam %>% arrange(class, math)
exam2 <- exam %>% arrange(class, desc(math))

exam3 <- exam %>% arrange(desc(math))
# 위에서 부터 5개 출력
exam4 <- head(exam3, 5)
