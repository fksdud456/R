c2 <- c(1,2,3,NA,5);
# NA가 포함되어 있기 때문에 결과는 NA
sum(c2)
# NA를 제거하고 평균을 계산
mean(c2, na.rm =T);

c2 <- c(1,2,3,NULL,5);
#N
sum(c2)

mean(c2, na.rm =T);


