# 서울시 공공데이터에서 가져온 Wifi 정보
# KT, LGU+, SKT 회사 별 wifi 위치를 지도에 저장한다

install.packages('readxl')

wifi <- function(a) {
  library(RgoogleMaps)
  mycenter = c(37.501322, 127.039749)
  
  mymap <- GetMap(
    center = mycenter,
    zoom = 12,
    maptype = 'load',
    format = 'roadmap',
    destfile = 'mymap.jpg'
  )
  
  data<-read.csv(
    'seoul.csv', 
    stringsAsFactors = F)
  
  filename <- "wifimap.jpg"
  
  if(a == 1) {
    data <- data[c(data$manufacturer == 'KT'), ]
    filename <- "wifimapKT.jpg"
  } else if(a == 2) {
    data <- data[c(data$manufacturer == 'LGU+'), ]
    filename <- "wifimapLG.jpg"
  } else if(a == 3) {
    data <- data[c(data$manufacturer == 'SKT'), ]
    filename <- "wifimapSKT.jpg"
  }
  
  lat <- data[ , c('Y')]
  lon <- data[ , c('X')]
  
  jpeg(filename = filename, width = 680, height = 680, quality = 100)
  p <- PlotOnStaticMap(mymap,
                       lat = data$Y,
                       lon = data$X,
                       destfile = 'mymap_plot.jpg',
                       cex = 1,
                       pch = 20,
                       col = 'green')
  print(p)
  dev.off()
}

wifi(1)
wifi(2)
wifi(3)
