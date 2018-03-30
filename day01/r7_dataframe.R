
name<-c('lee','kim','park','jang','hong');
age <-c(10,20,30,40,50);
weight<-c(60,50,40,30,90)
df <- data.frame(name, age,weight)
df

dim(df)
nrow(df)
ncol(df)

dataframe<- df[1,]
dataframe
vector<- df[,2]
vector

df2<-df[c(1:3),]
df2


error
mean(df[,c('age','weight')]);

colMeans(df[,c('age','weight')])

df3<-df[2,'age']


mean(df$age[1:2])
mean(df$age[c(1,2)])
max(df$age)

which(df$age == 50)
mx <- which(df$age == max(df$age))
mn <- which(df$age == min(df$age))
mean(df$age[c(-mn, -mx, -3, -2)])


which(df$age == max(df$age))

df$height <- c(180,160,150,120,190);
df

df$bmi<- df$weight/(df$height^2) *10000

# [ row , col]
df2 <- df [df$weight > 50 , ]
df2 <- df [df$weight >= 50 & df$weight <80, ]
df2 <- df [df$weight >= 50 & df$height == max(df$height), ]
df[which(df$height == max(df$height)), ]

ww <- df2$weight
hh <- df2$height

