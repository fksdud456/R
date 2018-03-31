library(ggplot2)
library(sqldf)

mympg <- sqldf('SELECT *, (cty+hwy)/2 AS total FROM mpg')

mympg2 <- sqldf('SELECT total, 
                CASE 
                WHEN total > 20 
                THEN "PASS" 
                ELSE "FAIL" 
                END AS "total2" 
                FROM mympg')

mympg2 <- sqldf('SELECT total, 
                CASE 
                WHEN total > 20 
                THEN "PASS" 
                ELSE "FAIL" 
                END AS "total2" 
                FROM mympg')

mympg3 <- sqldf('SELECT total,
                CASE 
                WHEN total > 30
                THEN "A"
                WHEN total > 20 
                THEN "B"
                ELSE "C"
                END AS "Grade" FROM mympg')
