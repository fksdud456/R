

# 전체 과목의 평균을 계산해 colum에 추가
exam$avg <- round(rowMeans(exam[, c(3:5)]), 2)
# class별로 내림차순 정렬
order.exam <- exam %>% arrange(class, desc(avg))

