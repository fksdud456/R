getcsv <- function() {
  #
  #data<-read.csv('csv_exam3.csv', header=F);
  #
  data<-read.csv('csv_exam3.csv', header=F, stringsAsFactors = F);
  # 인코딩방식
  data<-read.csv('csv_exam3.csv', header=F, stringsAsFactors = F, encoding = 'UTF-8');
  class(data$V2);
  return(data);
}


writedata<-function(df) {
  write.csv(df, file='result0328.csv');
  # rda? 
}

data <- getcsv()
data$avg <- round(rowMeans(data[,c(4:6)]),2)
writedata(data)


# 원본파일을 가져와서 복제본을 만든 후에
# 그 파일로 분석해야 됌. 원본파일 건드리지말긔
newdata <- read.csv('result0328.csv', header = F, stringsAsFactors = F, encoding='UTF-8')
load('result0328.csv')
?load

