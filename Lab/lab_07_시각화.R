##
## lab_07_시각화.R
##
## R's 간단 실습(시각화)
##
## update: 21.05.14

## ----------------------------------------
## 기본환경 설정
  source("lab_00_기본환경설정.R")

# Step 1. 막대그래프 그리기
# Step 2. 원그래프 그리기
# Step 3. 히스토그램 그리기
# Step 4. 상자그림 그리기

## ----------------------------------------
##  Step 1. 막대그래프 그리기
## ----------------------------------------
## [0030] Plots clean: Plot  제거하기
#dev.off()
if(!is.null(dev.list())) dev.off()

library(ggplot2)

View(table(diamonds$cut))

### 막대그래프 그리기
barplot(table(diamonds$cut))

### 막대그래프색상변경하기
barplot(table(diamonds$cut),
        col="purple")

### 막대그래프 제목추가하기
barplot(table(diamonds$cut),
        col="purple", 
        main="다이아몬드의 품질 현황")

### 막대그래프y축제목추가하기
barplot(table(diamonds$cut),
        col="purple", 
        main="다이아몬드의 품질 현황",
        ylab="빈도") 

barplot(table(diamonds$cut),
        col="purple", 
        main="다이아몬드의 품질 현황",
        ylab="빈도", 
        ylim=c(0, 250000)) ## ylim(최소값, 최대값) 

### 가로막대그래프로변경하기
barplot(table(diamonds$cut), 
        col="purple", 
        main="다이아몬드의 품질 현황",
        xlab="빈도", 
        xlim=c(0, 150000), 
        horiz=TRUE)

### ggplot2 패키지활용하기
ggplot(data=diamonds, mapping=aes(x=cut)) + 
  geom_bar()


## ----------------------------------------
##  Step 2. 원그래프 그리기
## ----------------------------------------
### 원그래프
pie(table(diamonds$cut))

pie(table(diamonds$cut), radius=1)

pie(table(diamonds$cut), radius=1, 
    init.angle=-30)

### plotly패키지활용하기
library(plotly)

plot_ly(data=diamonds, values=~table(cut),
        levels=~levels(cut), type="pie")

### plotly패키지활용하기
ggplot(data=diamonds, mapping=aes(x=cut, fill=cut)) +
  geom_bar(width=1) +
  coord_polar("y")

## ----------------------------------------
##  Step 3. 히스토그램 그리기
## ----------------------------------------
### 히스토그램그리기
View(table(diamonds$price))

hist(diamonds$price)

hist(diamonds$price, 
     breaks=c(0, 5000, 10000, 15000, 20000))

hist(diamonds$price, breaks=10)

## ----------------------------------------
##  Step 4. 상자그림 그리기
## ----------------------------------------
### 상자그림그리기
View(table(diamonds$price))

boxplot(diamonds$price)

boxplot(diamonds$price, range=3)

### 집단별 상자그림
boxplot(diamonds$price ~ diamonds$cut)
boxplot(price ~ cut, data=diamonds)

## ----------------------------------------
##  Step 5. 막대 그래프
## ----------------------------------------
### 누적막대형그래프 : barplot()
View(table(diamonds$cut, diamonds$color))

barplot(table(diamonds$cut, diamonds$color),
        legend.text=levels(diamonds$cut), 
        args.legend=list(x="topright"))

### 묶은세로막대형그래프
barplot(table(diamonds$cut, diamonds$color), 
        beside=TRUE, 
        legend.text=levels(diamonds$cut), 
        args.legend=list(x="topright"))

        
        


## END ##