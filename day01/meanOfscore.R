
m1 <- matrix(c(80, 80, 90, 99, 90, 99, 78,89,70,78,82,78,100,72,78,90), nrow=4)
colnames(m1) <- c('ko','en','si','ma')
rownames(m1) <- c('kim', 'lee','hong','jang')

c1<-mean(m1[1,]);
c2<-mean(m1[2,]);
c3<-mean(m1[3,]);
c4<-mean(m1[4,]);

s1<-mean(m1[,1]);
s2<-mean(m1[,2]);
s3<-mean(m1[,3]);
s4<-mean(m1[,4])

m1
apply(m1,1,mean) # 행기준
apply(m1,2,mean) # 열기준

mm1 <- m1[,mean(c(1:4))]
mm2 <- m1[mean(c(1:4)),]

students <- rowMeans(m1)