
library(stringi)
library(dplyr)
library(ggplot2)

# Get data From Oracle Database
getdel <- function(query) {
  library(rJava)
  library(RJDBC)
  library(DBI)

  drvName <- 'oracle.jdbc.driver.OracleDriver';
  id <- 'ruser'
  pwd <- 'ruser'
  url <- 'jdbc:oracle:thin:@70.12.114.144:1521:XE'
  
  drv <- JDBC(driverClass = drvName, 
              classPath = 'c:\\java_hive_lib\\ojdbc6.jar')
  
  conn <- dbConnect(drv, url, id, pwd)
  
  sqlstr <- query

  food <- dbGetQuery(conn, sqlstr);
  dbDisconnect(conn)
  
  return (food)
} 

# Get data From Hive 
getweather <- function(query) {
  library(rJava)
  library(RJDBC)
  library(DBI)
  
  drvName <- 'org.apache.hive.jdbc.HiveDriver';
  id <- 'root'
  pwd <- '111111'
  url <- 'jdbc:hive2://192.168.111.100:10000'
  
  hive_lib <- 'c:\\java_hive_lib'
  .jinit();
  .jaddClassPath(dir(hive_lib, full.names = T));
  .jclassPath();
  
  drv <- JDBC(driverClass = drvName, 
              classPath = 'hive-jdbc-1.0.1.jar')
  
  conn <- dbConnect(drv, url, id, pwd)
  
  sqlstr <- query
  
  weather <- dbGetQuery(conn, sqlstr);
  dbDisconnect(conn)
  
  return (weather)
} 

########################################################
# table : weather
# 
# date      date                	                    
# time      int                 	                    
# sky       int                 	                    
# rain      int 
#
#######################################################

# 날짜 별로 하늘 정보의 평균과 강수량 정보 합을 가져온다 
raw_weather <- weather

weather <- getweather(
  'SELECT date, round(AVG(sky), 0), SUM(rain) FROM weather WHERE time > 16 GROUP BY date')

# delivery data와 join을 하기 위해서 date column명을 day로 변경
weather <- rename(weather,
                  DAY = date,
                  sky = '_c1',
                  rain = '_c2')
# Day의 형태가 char형으로 들어오기 때문에 Date형태로 변경
weather$DAY <- as.Date(weather$DAY, format="%Y-%m-%d") 

# State 설정 
# 비가 8시간 이상올 때 3
# 비가 5시간 이상올 때 2
# 하늘 정보가 3 이상일 때 1
# 나머지 맑음 0

weather$sky <- round(weather$sky, 0)
weather$state <- ifelse(weather$rain >= 8, 3,
                        ifelse(weather$rain>=5, 2,
                        ifelse(weather$sky>=2, 1, 0))
)


########################################################
# table : food2
# 
#  
# 
#######################################################

delivery <- getdel('select * from food2')
raw_delivery <- delivery
colnames(raw_delivery)

delivery <- rename(delivery,
                   DAY = 癤풡AY)

delivery2 <- aggregate(CALLS~DAY+FOOD, delivery, sum)
delivery2$DAY <- as.Date(delivery2$DAY, format="%Y-%m-%d")
result <- delivery2
result <- left_join(result, weather, id = "DAY")

result2<-aggregate(CALLS~state+FOOD, result, mean)
result2$states <- ifelse(result2$state == 3, '눈/비 많이',
                         ifelse(result2$state == 2, '눈/비 조금',
                         ifelse(result2$state == 1, '흐림', '맑음')))

p <- ggplot(result2, aes(x=states, y=CALLS, col=FOOD)) + geom_point()

ggplotly(p)
