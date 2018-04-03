
# g1 함수는 그래프를 그리고, 저장하는 함수
g1<- function(a) {
  # 그래프를 그리기 위해 필요한 라이브러리 로드
  library(ggplot2)
  
  
  if(a == 1) {
    # jpeg 명령어 아래에 시작되는 이미지들을 jpeg에 저장하라는함수
    jpeg(filename = "c:\\R\\mychart1.jpg", width = 680,
         height = 680, quality = 100)
    
    p = ggplot(data = midwest, aes(x = poptotal, y = popasian)) +
      geom_point() + xlim(0, 500000) + ylim(0, 10000)
    
  } else {
    jpeg(filename = "c:\\R\\mychart2.jpg", width = 680,
         height = 680, quality = 100)
    
    p = ggplot(data = midwest, aes(x = popasian, y = poptotal)) +
      geom_point() + xlim(0, 500000) + ylim(0, 10000)
  }
  
  print(p)
  dev.off()  
}



g1(1)
g1(2)
# Source : ctrl + shift + s
# 메모리에 올린다

?Source
?dev.off
