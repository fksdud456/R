table(welfare$religion)

welfare$religion <- ifelse(welfare$religion == 1, 'yes', 'no')
table(welfare$religion)

qplot(welfare$religion)

# 이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage == 1, 'marriage', 
                                 ifelse(welfare$marriage == 3, 'divorce', NA))

table(is.na(welfare$group_marriage))

qplot(welfare$group_marriage)
