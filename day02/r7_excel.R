exdata <- function(){
  library(readxl);
  
  # 같은 workspace 에 있기 때문에 파일명만 명시해도 됌
  # data <- read_excel('excel_exam.xlsx');
  # column명 만들지 않고setting
  data <- read_excel('excel_exam_nohead.xlsx', col_names = F);
  
  data <- read_excel('excep_exam_3.xlsx', sheet =2);
  #is.data.frame(data);
  return(data);
}

data <- exdata();
colnames(data) <- c('a','b','c','d','e')
mean(data$math)

