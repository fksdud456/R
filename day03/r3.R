
# ggplot2 의 midwest 데이터를 데이터 프레임 형태로 불러온다
df.midwest <- as.data.frame(midwest)

# poptotal 변수를 total로, popasian 변수를 asian 으로 수정한다
df.midwest <- rename(df.midwest, 'total' = poptotal, 'asian' = popasian)

# total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 을 만든다
percent.asian <- (df.midwest$asian/df.midwest$total)*100

# Histogram 을 만들어 도시들이 어떻게 분포하는지 본다
hist(percent.asian)

# 아시아 인구 백분율 전체 평균을 구하고
# 평균을 초과하면 'large' 그 외에는 'small'을 부여한다
avg.asian <- ifelse(percent.asian > mean(percent.asian), 'large', 'small')

# 'large'와 'small'에 해당하는 지역이 얼마나 되는지 
# 빈도표와 막대 그래프를 만들어 확인
table(avg.asian)
qplot(avg.asian)