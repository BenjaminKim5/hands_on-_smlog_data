##
## R Oracle DB Connect
##
## R's 간단 실습(Oracle DB 연결)
##
## update: 21.05.14

## ----------------------------------------
## 기본환경 설정
  source("lab_00_기본환경설정.R")

## ----------------------------------------
##  Step 0. 
## ----------------------------------------

# install.packages('rJava')
# install.packages('DBI')
# install.packages('RJDBC')

## [010] load librarys
library(rJava)
library(DBI)
library(RJDBC)

## ----------------------------------------
##  Step 1. DB connect
## ----------------------------------------

## [100] setting driver and connection configuration
##   ※ Java 가 설치되어 있어야 합니다.
##      classPath=oracle connect에 필요한 ojdbc8.jar 파일의 위치
drv_Oracle <- JDBC(driverClass="oracle.jdbc.driver.OracleDriver", 
                   classPath="D:/Lab/R/drivers/ojdbc8.jar")

## [110] oracle DB connect 
##   ip=192.168.0.188 
##   port=1521 
##   db_name=orcl 
##   user id=aaaa password=bbb
con_Oracle <- dbConnect(drv_Oracle, 
                        "jdbc:oracle:thin:@//192.168.0.188:1521/orcl",  # ip:port
                        "aaaa", 
                        "bbbb")

## ----------------------------------------
##  Step 2. Main  
## ----------------------------------------

# [200] SQL query
#    <주의> Do not use ';' (semicolon)
query <- "SELECT * FROM tb_airp" 

# [210] executing DB connect & query
my_data <- dbGetQuery(con_Oracle, query)

# [220] query result 확인
View(my_data)

## ----------------------------------------
##  Step 3. DB disconnect 
## ----------------------------------------
# [900] DB disconnect
dbDisconnect(con_Oracle)

# [910] delete temp objects
rm(drv, con_Oracle, query)

## END ##