# NA data 가 포함된 csv 파일
st <- read.csv('csv_exam.csv', header = F)
colnames(st) <- c('id', 'class', 'ko', 'en', 'ma')

# 전체 data에 대해 na를 확인
is.na(st)
table(is.na(st$class))

# NA가 포함된 colume의 평균 
mean(st$ko)
mean(st$ko, na.rm = T)

# 학생 정보를 조회 하시오
# 단 id, class, ko 결측치가 있는 학생은 뺀다
st[!is.na(st$ko) & !is.na(st$class), c('id', 'class', 'ko')]

# 결측치를 모두 제거하는 함수
na.omit(st[, c('id', 'class', 'ko')])

# 국어, 영어, 수학 성정의 평균을 구하여 
# vector를 만든다
v.st <- colMeans(st[!is.na(st$ko) & !is.na(st$en) & !is.na(st$ma), c(3:5)], )
# na.rm 결측치를 제외하고 평균을 구한다
# 수치 연산 함수들은 na.rm을 지원한다.
v.st <- colMeans(st[, c(3:5)], na.rm = T)

# NA값을 모두 0으로 바꾼다
st$ko <- ifelse(is.na(st$ko), 0, st$ko)
st$en <- ifelse(is.na(st$en), 0, st$en)
st$ma <- ifelse(is.na(st$ma), 0, st$ma)

st[is.na(st)] = 0
v.st2 <- colMeans(st[, c(3:5)], na.rm = T)

boxplot(st[ , c(3:5)])
hist(st$ko)
