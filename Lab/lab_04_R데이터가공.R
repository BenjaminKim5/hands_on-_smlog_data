##
## lab_04_R데이터가공.R
##
## R's 간단 실습(R데이터가공)
##
## update: 21.05.14

## ----------------------------------------
## 기본환경 설정
  source("lab_00_기본환경설정.R")

# Step 1. 데이터에서 일부 추출하기
# Step 2. 새로운 변수 만들기
# Step 3. 데이터 수정하기
# Step 4. 데이터 삭제하기
# Step 5. 데이터 정렬하기

## ----------------------------------------
##  Step 0. 실습 데이터 준비
## ----------------------------------------
## diamonds : ggplot2 패키지에서 제공하는 diamonds를 사용
# install.packages("ggplot2")
library(ggplot2)
View(diamonds)
head(diamonds, n=10)
tail(diamonds, n=10)

## ----------------------------------------
##  Step 1. 데이터에서 일부 추출하기
## ----------------------------------------
getwd(); localeToCharset()
rm(list=ls())

### 열추출하기
A <- diamonds[ , 2]
B <- diamonds[ , 2, drop=FALSE]
C <- diamonds[ , c(2, 3, 7)]
D <- diamonds[ , 7:10]
E <- diamonds[ , seq(from=2, to=10, by=2)]

### 행추출하기
diamonds[diamonds$cut == "Fair", ]
diamonds[diamonds$price >= 18000, ]
diamonds[(diamonds$cut == "Fair") & (diamonds$price >= 18000), ]
diamonds[(diamonds$cut == "Fair") | (diamonds$price >= 18000), ]

## ----------------------------------------
##  Step 2. 새로운 변수 만들기
## ----------------------------------------
### 합계: xyz.sum = x + y + z
diamonds$xyz.sum <- (diamonds$x + diamonds$y + diamonds$z)
diamonds$xyz.sum <- rowSums(diamonds[ , c("x", "y", "z")])

### 평균깂: xyz.mean = (x + y + z)/3 
diamonds$xyz.mean <- (diamonds$x + diamonds$y + diamonds$z) / 3
diamonds$xyz.mean <- rowMeans(diamonds[ , c("x", "y", "z")])
t1 <- c(10,20,30)
t2 <- mean(t1)
                                                        
## ----------------------------------------
##  Step 3. 데이터 수정하기
## ----------------------------------------
A <- diamonds[diamonds$price >= 18000, "price"]
View(A)

diamonds[diamonds$price >= 18000, "price"] <- 18000
B <- diamonds[diamonds$price >= 18000, "price"]
View(B)

t1 <- diamonds[(diamonds$cut == "Fair"), c("cut", "x")]
C <- diamonds[(diamonds$cut == "Fair")&(diamonds$price), "x"]
View(C)

diamonds[(diamonds$cut == "Fair")&(diamonds$price), "x"] = NA
diamonds[(diamonds$cut == "Fair")&(diamonds$price), "x"]
View(diamonds)

## ----------------------------------------
##  Step 4. 데이터 삭제하기
## ----------------------------------------
### 행삭제하기
diamonds[-c(10, 20, 30), ]  ## 행삭제; 10,20.30 행
diamonds[-(100:200), ]      ## 행삭제: 100~200 행
length(diamonds)
diamonds[-seq(from=1, to=length(diamonds), by=10), ]  ## 첫 번째 행부터 시작해서 10행씩 삭제

### 열삭제하기
diamonds$table = NULL
subset(diamonds, select=-c(2, 3))
subset(diamonds, select=-c(cut, color))


## ----------------------------------------
##  Step 5. 데이터 정렬하기
## ----------------------------------------
diamonds[order(diamonds$price), ]  ## 오름차순
diamonds[order(diamonds$price, decreasing=TRUE), ] ## 내림차순
diamonds[order(diamonds$cut, diamonds$color), ]
diamonds[order(diamonds$cut, diamonds$color, decreasing=TRUE), ]
View(diamonds)

## END ##