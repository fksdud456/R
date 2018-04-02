# 1. 변수 검토하기
class(welfare$income)

summary(welfare$income)

qplot(welfare$income) + xlim(0, 1000)

# 2. 전처리
summary(welfare$income)
 
# 이상치 결측 처리
# 값이 1 ~ 9998 사이에 있어야 하는데
# summary Min 값이 0이 나온다.
# 따라서 이상치가 있다는 것이므로 0이거나 9999일 경우 결측 처리를 한다
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
# 결측치 확인
table(is.na(welfare$income))

# 다음 단계 부터는 결측치를 제외하고 분석한다

# 09-2 성별에 따른 월급 차이
# 성별 월급 평균표
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()

#09-3 나이와 월급의 관계 (모름/무응답 = 9999)
qplot(welfare$birth)

# 이상치 확인
summary(welfare$birth)
# 결측치 확인
table(is.na(welfare$birth))

# 이상치 결측 처리
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))

# 파생변수 만들기 - 나이
# 태어나 연도 변수를 이용해 나이 변수를 만든다
welfare$age <- 2018 - welfare$birth + 1
summary(welfare$age)

# 나이별 월급 평균표
age_income <- welfare %>% 
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

# 그래프 만들기
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()

