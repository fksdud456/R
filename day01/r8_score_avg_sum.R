# name<- c('kim','lee','hong','jang')
ko<-c(80,90,70,100);
en<-c(80,99,78,72);
si<-c(90,78,82,78);
ma<-c(99,89,78,90);
dfScore<-data.frame(ko,en,si,ma);
df3 <- rbind(dfscore,c(colMeans(dfScore)))
df3 <- rbind(dfScore,c(colMeans(dfScore)))



df3$avg <- c(round(rowMeans(df3)));
df3$sum <- c(round(rowSums(df3)));

dfScore3$sum <- rowSums(dfScore3[,c(2:5)]);
dfScore<-data.frame(dfScore,rowMeans(dfScore[c(2:5),]))



m1[,]
rowMeans(m1(c(1:4)),)
dataframe<- df[1,]


rowMeans()
colMeans(m1[c(1:4),])
