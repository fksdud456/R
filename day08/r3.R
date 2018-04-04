# 2개 데이터 1개의 그래프에 표현
pressure<-pressure
pressure2<-pressure*2

ggplot(pressure,aes(x=temperature, y=pressure)) + 
  geom_line() + 
  geom_point() + 
  geom_line(data=pressure2,aes(x=temperature, y=pressure/2),colour="red") + 
  geom_point(data=pressure2,aes(x = temperature, y = pressure/2),colour="red")