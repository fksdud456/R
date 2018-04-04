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
sqlstr <- 'SELECT MONTHS_BETWEEN(sysdate,hiredate) AS day, sal FROM emp'

# 4. ResultSet
emp <- dbGetQuery(conn, sqlstr);

# 5. Close
dbDisconnect(conn)


library(ggplot2)
p <- ggplot(emp, aes(x = DAY, y = SAL)) + geom_line()

library(plotly)
ggplotly(p)


?seq
?apply
f <-as.array(emp[, c(1)])
class(f)
apply(f, 1, function(x) seq.Date(as.Date(x), Sys.Date(),"month"))


