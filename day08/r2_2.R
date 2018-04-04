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
sqlstr <- 'SELECT hiredate, sal FROM emp'

# 4. ResultSet
emp <- dbGetQuery(conn, sqlstr);

f <-as.array(emp[, c(1)])
f<- apply(f, 1, function(x) length(seq.Date(as.Date(x), Sys.Date(),"month")))

# 5. Close
dbDisconnect(conn)


library(ggplot2)
p <- ggplot(emp, aes(x = DAY, y = SAL)) + geom_line()

library(plotly)
ggplotly(p)

?as.difftime
as.dif