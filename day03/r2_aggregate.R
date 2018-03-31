library('googleVis')

# Fruits 데이터를 기반으로 년도별 Sales와 Profit의 합을 구하시오
aggregate(Sales+Profit~Year, Fruits, sum)

# Fruits 데이터를 기반으로 년도별, 월별 Sales와 Profit의 합을 구하시오
df3 <- Fruits[, c(2,4,6,7)];
df3$Date <- substr(df3$Date,6,7)

df4 <- aggregate(Sales~Year+Date, df3, sum)
df5 <- aggregate(Profit~Year+Date, df3, sum)

# 1번의 결과를 기반으로 순이익 컬럼을 추가한다.
df4$Psales <- (df4$Sales-df5$Profit) *1.83

# 년별 월별 세금계산 총판매액 - 총수익
df4 <- aggregate(Sales~Year+Date, df3, sum)
df5 <- aggregate(Profit~Year+Date, df3, sum)
df4$Fee <- (df4$Sales-df5$Profit)*0.1

#년별 월별 세금을 계산 ( 총 판매액(Sales) - 총 수익(Profit) * 0.1 )
dfFee <- aggregate((Sales-Profit)*0.1~Year+Date,df3,sum)
dfFee <- aggregate((Sales-Profit)*0.1~substr(Date,6,7)+Year,Fruits,sum)
names(dfFee) <- c('Year','Date','Fee')

?aggregate
