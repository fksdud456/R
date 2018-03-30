name <- c('김지운', '이윻진','박동현','김민지')
gender <- c('m','f','m','f')
ko <- c(90,80,70,50)
ma <- c(40,50,100,20)
si <- c(87,54,79,89)
en <- c(54,67,87,88)
add<- c('서울시','광주시','목포시','대전시')

df <- data.frame(name, gender, ko, ma, si, en, add)
df$avg  <- rowMeans(df[,c(3:6)])
df2 <- c('avg',NA ,colMeans(df[, c(3:6)]),NA ,mean(df[,8]))

df2$avg<- colMeans(df[, c(3:6)])

rbind(df,df2)

df2 <- df[, c(3:6)]
submean <- colMeans(df2)
stumean <- rowMeans(df2)
names(stumean) <- df[,1]


# '서울시' 에서 '서울'만 추출
temp <- df[,'add']
class(temp)
temp2 <- as.character(temp)
class(temp2)
df$add <- substr(temp2, 1,2)
# '서울시'에서 '시'추출해서 add2
df$add2 <- substr(temp2, 3,3)

# 남학생만 ,여학생만 추출
dfmale <- df[which(df$gender == 'm'),]
dffemale <- df[df$gender == 'f',]

# 남, 여 평균
mavg <- colMeans(dfmale[,c(3:6)])
favg <- colMeans(dffemale[,c(3:6)])

qplot(y=mavg, x=names(mavg))


#평균 이상인 학생들 중 여자만 조회
dfavg <- df[ df$avg>mean(df$avg) & df$gender == 'm',]
dfavg <- df[ df$avg>mean(df$avg) & df$gender == 'f',]
dfavg_f <- dfavg[dfavg$gender == 'f',]


# 학생 별 국어와 영어의 평균, Vector로 표현
# 단 Column 명은 학생의 이름으로 표시
dfavgkoen <- rowMeans(df[c(3,6)])
names(dfavgkoen) <- df$name
names(dfavgkoen) <- c('지운','유진','동현','민지')

# 여학생들의 과목 별 평균을 구하시오, vector로 표현
avgfemale1 <- colMeans(df[which(df$gender=='f'),c(3:6)])
avgfemale2 <-colMeans(df[df$gender=='f',][,c(3:6)])
names(avgfemale1) <- colnames(df[,c(3:6)])

#colum이름
colnames(df)

#df3 <- rbind(df[,c(3:6)], stumean)
result1 <- df[df$gender == 'm',]
avgmale1 <- colMeans(result1[,c(3:6)])

# data frame으로 만들기
result1 <- rbind(avgfemale1, avgmale1)install
result3 <- as.data.frame(result1)
