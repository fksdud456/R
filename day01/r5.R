c1 <-c(1:5);
c2 <-c(6:10)
cs <-union(c1,c2);

cs2<- setequal(c1,c2);

5*cs

cs %in% c1

result <-c(1:3) %in% cs
print(length(result))


//1 부터 1000까지 5씩 증가해라
c3 <- seq(1,1000,5) 
c3
