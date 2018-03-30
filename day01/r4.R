v1<- c(70,80,90,100);
names(v1) <- c('ko','en','d','t')
names(v1)[2]
v1[names(v1)[2]]

vv<-v1[-3]
result<-sum(v1);
print(vv)
print(v1)

vv<-v1[2:3]
print(vv)
print(result)


vv2<-v1[c(-3,-1)]

vv2<-v1[c('ko','ma')]
vv2<-v1[c(1,4)]
vv2<-v1[-2:-3]
vv2<-v1[c(-2,-3)]



length(v1)
NROW(v1)
nrow(v1)
