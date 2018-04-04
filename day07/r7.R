library(plotly)
library(ggplot2)
library(htmlwidgets)

# 배기량과 고속도로연비
p <- ggplot(data = mpg, aes(
  x = displ, # 배기량
  y = hwy,  # 
  col = drv # 4륜이냐,,? 구동방식
)) + geom_point()


pp <- ggplotly(p)

saveWidget(pp, file = "aa.html")
