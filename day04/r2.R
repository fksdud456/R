# p.160

# 복사본으로 작업
library(ggplot2)
cp.midwest <- midwest

# popadults : 성인 인구
# poptotal : 전체 인구
# 전체 인구 대비 미성년 인구 백분율 변수를 추가하세요.
cp.midwest$perminor <-
  (cp.midwest$poptotal - cp.midwest$popadults) / cp.midwest$poptotal * 100


# 백분율이 가장 높은 상위 5개 country의 미성년 인구 백분율을 출력
cp.midwest <-
  cp.midwest[order(cp.midwest$perminor, decreasing = T), ]
minor <- head(cp.midwest, 5)


cp.midwest$grade <-
  ifelse(
    cp.midwest$perminor >= 40,
    'large',
    ifelse(cp.midwest$perminor >= 30,
           'middle', 'small')
  )

cp.midwest$perasian <-
  cp.midwest$popasian / cp.midwest$poptotal * 100
head(cp.midwest[order(cp.midwest$perasian), c('state', 'county', 'perasian')], 10)

??dplyr
