c1<-c(1:10);

sum <- 0;
# 1차원 적인 데이터의 집합인 vector 가 들어갈 수 있다
for(i in c1) {
    sum <- sum + i;
}
sum;

#sum 구하는 함수
sum(c1)
