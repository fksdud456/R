# source를 메모리에 올린 후 사용해야됌
f1 <- function(a,b) {
  return(a+b);
}


f<- function(a,b){
  g<-function(b){
    
  }
}


# 문자로 된 변수는 연산할 수 없다
cc<-c('1','1','1','1','1','1')
mean(cc)
mean(as.numeric(cc))


# 나머지
ccc<-c(10,40,81,93,100,70,60)
ccc[ccc%%2 == 0]

str4 <- c('a', 'b', 'c', 'd')
s <- paste(str4,collapse = ' ')

