# 09-6 직업별 월급 차이
table(welfare$code_job)

# 테이블을 보고 직업 코드가 어떤 직업을 의미하는 지 알 수 없다
# 따라서 직업분류코드를 이용해 직업 명칭 변수를 만든다
# bit.ly/doit_rc  > data > oweps_Codebook.xlsx 를 다운로드 한다

list_job <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)

welfare <- left_join(welfare, list_job, id = "code_job")

## Joining, by = "code_job"

welfare %>%
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>%
  head(10)

job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) +
  geom_col() +
  coord_flip()


bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)

ggplot(data = bottom10, aes(x = reorder(job, -mean_income),
                            y = mean_income)) + 
  geom_col() +
  coord_flip() +
  ylim(0, 850)
