##
## lab_03_R데이터관리.R
##
## R's 간단 실습(R데이터관리)
##
## update: 21.05.14

## ----------------------------------------
## 기본환경 설정
  source("lab_00_기본환경설정.R")

# Step 1. R 데이터를 R 데이터로 저장하기
# Step 2. R 데이터 불러오기
# Step 3. R 데이터를 외부 데이터로 저장하기
# Step 4. R 데이터 삭제하기

## ----------------------------------------
##  Step 1. R 데이터를 R 데이터로 저장하기
## ----------------------------------------
getwd(); localeToCharset()
rm(list=ls())

### R 데이터를 R 데이터로 저장하기
### - function: save()  
# install.packages("readxl")
library(readxl)

ebook <- read_excel(path="./data/선별진료소목록.xlsx"
                    , sheet="DB입력용", col_names=TRUE)
View(ebook)
save(ebook, file="./data/ebook.RData")
save(ebook, file="./data/ebook222.RData")

## ----------------------------------------
##  Step 2. R 불러오기
## ----------------------------------------
### R 데이터 불러오기
### - function: load()
rm(list=ls())
rm(ebook)
load(file="./data/ebook.RData")
load(file="./data/ebook222.RData")
View(ebook)


## ----------------------------------------
##  Step 3. R 데이터를 외부 데이터로 저장하기
## ----------------------------------------
getwd(); localeToCharset()
rm(list=ls())

View(iris)  ## iris = R에서 제공하는 예제 데이터인 

### 텍스트 데이터로 저장하기
### - function: write.table()
write.table(iris, file="./data/iris.txt",
            sep=",", row.names=FALSE)

### CSV 데이터로 저장하기
### - function: write.csv()
write.csv(iris, file="./data/iris.csv",
            row.names=FALSE)

### Excel 데이터로 저장하기
### - function: openxlsx 패키지의 write.xlsx() 
# install.packages("oepnxlsx")
library(openxlsx)

write.xlsx(iris, file="./data/iris_sample.xlsx")

## ----------------------------------------
##  Step 4. R 데이터 삭제하기
## ----------------------------------------
A <- iris
B <- iris$Sepal.Length
C <- iris$Species

rm(B)
rm(B, C)

rm(list=ls())

## END ##