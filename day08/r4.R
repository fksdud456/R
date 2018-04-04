library(rJava)
library(RJDBC)
library(DBI)

drvName <- 'oracle.jdbc.driver.OracleDriver';
id <- 'ruser'
pwd <- '111111'
url <- 'jdbc:oracle:thin:@localhost:1521:XE'

# 1. Driver Loading
drv <- JDBC(driverClass = drvName, 
            classPath = 'c:\\java_hive_lib\\ojdbc6.jar')

# 2. Connection
conn <- dbConnect(drv, url, id, pwd)

# 3. Statement 
sqlstr <- 'SELECT CITYNAME, MONTHS_BETWEEN(sysdate, PERMITDATE) AS month, FACILITY FROM cafe'

# CITYNAME      VARCHAR2(26) 
# NAME          VARCHAR2(27) 
# PERMITDATE    NUMBER(8)    
# FACILITY      NUMBER(5,2)  
# CATEGORY      VARCHAR2(26) 
# STREETADDR    VARCHAR2(54) 
# LAT           NUMBER(9,7)  
# LON           NUMBER(10,7) 

# 4. ResultSet
cafe <- dbGetQuery(conn, sqlstr);

# 5. Close
dbDisconnect(conn)

cafe$MONTH <- round(cafe$MONTH, -1)
cafe2 <- aggregate(FACILITY~CITYNAME+MONTH,cafe,mean)

# cafe3 <- cafe2[order(cafe2$FACILITY, decreasing = TRUE), ]
# cafe4 <- cafe3[c(1:5), ]

cafe.suwon <- cafe2[cafe2$CITYNAME == "수원시", ]
cafe.ui <- cafe2[cafe2$CITYNAME == "의정부시", ]
cafe.ui <- cafe2[cafe2$CITYNAME == "동두천", ]
library(ggplot2)

p <- ggplot(data = cafe.suwon, aes(x = MONTH, y = FACILITY)) + 
  geom_point() + 
  geom_line() + 
  geom_line(data = cafe.ui, aes(x = MONTH, y = FACILITY), colour = 'red') + 
  geom_point(data = cafe.ui, aes(x = MONTH, y = FACILITY), colour = 'red') + 
  geom_line(data = cafe.ui, aes(x = MONTH, y = FACILITY), colour = 'red') + 
  geom_point(data = cafe.ui, aes(x = MONTH, y = FACILITY), colour = 'red')

class(cafe.ui)
            
library(plotly)
ggplotly(p)

?ggplot
as.dif