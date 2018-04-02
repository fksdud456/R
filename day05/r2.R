library(dplyr)

mpg2 <- mpg[ , c('drv', 'hwy')]

result <- aggregate(hwy~drv, mpg2, mean)

# reorder : 많은순, - 적은순
ggplot(data = result, aes(x = reorder(drv, -hwy), y=hwy)) + geom_col()
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# 어떤 회사에서 생산한 "suv" 차종의 도시 연비가 높은지 알아보려고 한다.
# "suv" 차종을 대상으로 
# 평균 cty 가 가장 높은 회사 다섯 곳을 막대 그래프로 표현
# 막대는 연비가 높은 순으로 정렬
mpg.suv <- mpg[ mpg$class == "suv", c('cty', 'manufacturer', )]
result2 <- aggregate(cty~manufacturer, mpg.suv, mean)
result2 <- head(result2[order(result2$cty, decreasing = T), ], 5)
ggplot(data = result2, aes(x = manufacturer, y = cty)) + geom_col()

# 빈도 막대 그래프는 값의 빈도(개수)로 막대의 길이를 표현한다
# 따라서 y 축 없이 x 축만 지정하고, geom_bar()를 사용하면 된다.
# x 축 변수의 항목별 빈도 막대 그래프가 출력된다
ggplot(data = mpg, aes(x = class, fill = manufacturer)) + geom_bar()

# drv(구동 방식) 별 hwy(고속도로 연비)
ggplot(data = mpg, aes(x = drv, y = hwy, fill = drv)) + geom_boxplot()

?ggplot2
