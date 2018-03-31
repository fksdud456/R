aggregate(math~class, exam, mean)
# 집단별 평균이나 집단별 빈도처럼 각 집단을
exam %>%
  group_by(class) %>%
  summarise(mean_math=mean(math),
            sum_english=sum(english),
            mean_science=mean(science),
            n=n())

# 위에서 mcty 만들었으니까 그걸로 descending 가
mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mcty = mean(cty)) %>%
  arrange(desc(mcty)) %>%
  head(5)

# class는 "suv", "compact" 등 특징에 따라 일곱 종류로 분류한 변수입니다.
# 어떤 차종의 도시 연비가 높은지 비교하려고 할 때, class별 cty 평균을 구하세요
# 평균이 높은 순으로 정렬해 출력하세요
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))

# 
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

# 어떤 회사에서 "compact" 차종을 가장 많이 생산하는지
# 각 회사별 "compact" 차종 수를 내림차순으로 정렬
# filter로 "compact" 차종만 남긴 후 회사 별 자동차 수를 구한다. 
# 데이터가 회사별로 몇 행으로 구성되는지 빈도를 구하면 알 수 있다. 
# 빈도는 n() 으로 구할 수 있
mpg %>%
  filter(class == 'compact') %>%
  group_by(manufacturer) %>%
  summarise(n=n()) %>%
  arrange(desc(n))

