library('googleVis')
head(Fruits)

#data가 어떤 타입인지
class(Fruits)

# banana들의 합
banana <- Fruits[Fruits$Fruit == 'Bananas',]
sum(banana$Sales)


# Hard Coding! 위 처럼 하면 'Bananas' 같은 문자가 바뀌면 사용할 수 없는 코드가 됌
# aggregate Group by 같은 것 ( 함수를 적용할 대상 ~ 기준,데이터 ,함수  )
  aggregate(Sales~Fruit, Fruits, sum)

# 연도별 이익 합계
  aggregate(Profit~Year, Fruits, sum)

# 과일별, 연도별 이익 합계
  aggregate(Profit~Year+Fruit, Fruits, sum)

# apply
# apply(array, margin, ...)
df2 <- Fruits[, c(4:6)]
rowSums(df2)
apply(df2,c(1,2),mean)


df <- Fruits
