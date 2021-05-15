##
## lab_05_조건_반복.R
##
## R's 간단 실습(조건_반복)
##
## update: 21.05.14

## ----------------------------------------
## 기본환경 설정
  source("lab_00_기본환경설정.R")

# Step 1. 조건문
# Step 2. 반복문

## ----------------------------------------
##  Step 1. 조건문
## ----------------------------------------
getwd(); localeToCharset()
rm(list=ls())

### if(조건){실행문} 구조
x <- 10
if(x > 5) { 
  print("x is large number.") 
}

### if(조건){실행문1}else{실행문2} 구조
x <- 4
if(x > 5) { 
  print("x is large number.") 
} else {
  print("x is not large number.")
}

### if(조건){실행문1}else if(조건2){실행문2}else{실행문3} 구조
x = 20
if (x > 10) { 
  print("x is large number.") 
} else if(x > 5) {
  print("x is medium number.")
} else {
  print("x is small number.")
}

### ifelse(조건문, 실행1, 실행2) 구조
diamonds$price.group = ifelse(diamonds$price < 5000,
                              "5000달러 미만", 
                              "5000달러 이상")
diamonds$price.group

diamonds$price.group2 = ifelse(diamonds$price < 5000, 
                               "5000달러 미만", 
                                ifelse(diamonds$price < 10000, 
                                        "5000달러 이상 ~ 10000달러 미만", 
                                        "10000달러 이상")
                              )
diamonds$price.group2                               
                               
## ----------------------------------------
##  Step 2. 반복문
## ----------------------------------------
for(i in 1:10) {
  print("Hello, world!")
}


## END ##