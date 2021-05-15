##
## lab_04-02_Space.R
## R's 간단 실습(공간 가시화)
## 
## update: 20.05.14
## update: 20.11.12
## update: 21.05.14

## ----------------------------------------
## 기본환경 설정
  source("lab_00_기본환경설정.R")

## ----------------------------------------
##  Step 0. 
## ----------------------------------------

# install.packages("readxl")
# install.packages("ggplot2")
# install.packages("dplyr")

library(readxl)
library(ggplot2)
library(dplyr)

## ----------------------------------------
##  Step 1: 원본 데이터 가져오기
## ----------------------------------------
rm(list=ls())
getwd()

psi_master <- read_excel("./data/PSI_master.xlsx", sheet="Sheet1")
View(psi_master)

psi_data <- read_excel("data/PSI_data.xlsx")
View(psi_data)

## ----------------------------------------
##  Step 2: 데이터 편집
## ----------------------------------------
## If 데이터에 NA 값을 0 로 수정
psi_data[is.na(psi_data)] <- 0

tmp <- inner_join(psi_data, psi_master)
View(psi_data)
View(tmp)

tmp$V_보관장 <- tmp$재고량 * tmp$보관장체적

## ----------------------------------------
##  Step 3: 시각화
## ----------------------------------------
### Tree map 그리기
# install.packages("treemap")
library(treemap)

## 생산량기준 공간
treemap(tmp, index = "품목명", 
        vSize = "생산량", 
        vColor = "생산량", 
        type = "value")

## 보관장체적
treemap(tmp, index = "품목명", 
        vSize = "보관장체적", 
        vColor = "보관장체적", 
        type = "value")

## 보관장내의 상품
treemap(tmp, index = "품목명", 
        vSize = "V_보관장", 
        vColor = "V_보관장", 
        type = "value")

## END ##
