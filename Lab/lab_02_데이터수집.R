##
## lab_02_데이터수집.R
##
## R's 간단 실습(데이터 수집)
##
## update: 21.05.14

## ----------------------------------------
## 기본환경 설정
  source("lab_00_기본환경설정.R")

# Step 1. 텍스트 데이터 읽어오기
# Step 2. CSV 데이터 읽어오기
# Step 3. 엑셀 데이터 읽어오기

## ----------------------------------------
##  Step 1. 데이터 수집 : 텍스트 데이터 읽어오기
## ----------------------------------------
getwd(); localeToCharset()
rm(list=ls())

### 텍스트 데이터 읽어오기 
### - 구분자(separator): 공백(blank), 콤마(comma), 탭(tab)
### - function: read.table()

### (1) 구분자: 공백(blank)
survey_rblank <- read.table("./data/rule_blank.txt"
              , header=TRUE, sep = " ")
View(survey_rblank)

### (2) 구분자:콤마(comma)
survey_comma <- read.table("./data/rule_comma.txt"
                            , header=TRUE, sep = ",")
View(survey_comma)

### (3) 구분자: 탭(tab)
survey_tab <- read.table("./data/rule_tab.txt"
                            , header=TRUE, sep = "\t")
View(survey_tab)

## ----------------------------------------
##  Step 2. 데이터 수집 : CSV 데이터 읽어오기
## ----------------------------------------
getwd(); localeToCharset()
rm(list=ls())

### CSV 데이터 읽어오기 
### - function: read.csv() 
survey = read.csv(file="./data/101_DT_1IN0001_F_2010.csv"
                  , header=TRUE)
View(survey)
  

## ----------------------------------------
##  Step 3. 데이터 수집 : Excel 데이터 읽어오기
## ----------------------------------------
getwd(); localeToCharset()
rm(list=ls())

### Excel 데이터 읽어오기 
### - function: read_excel()  
# install.packages("readxl")
library(readxl)

ebook <- read_excel(path="./data/선별진료소목록.xlsx"
                    , sheet="DB입력용", col_names=TRUE)
View(ebook)


## END ##