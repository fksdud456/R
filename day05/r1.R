library(ggplot2)

?ggplot
# x축, y축 설정
# ggplot2는 + 기호로 함수들을 연결한다

# geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

#
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + geom_line() + ylim(10, 50) + xlim(2, 7)



# x 축은 cty(도시 연비), y 축은 hwy(고속도로 연비)로 된 산점도를 만든다
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000)
