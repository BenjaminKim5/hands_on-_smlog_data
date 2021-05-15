##
## lab_01_데이터유형관리.R
##
## R's 간단 실습(데이터 유형 관리)
##
## update: 21.05.14

## ----------------------------------------
## 기본환경 설정

  ## [0010] Check if it is a working directory.  
  Basewd <- "D:/500_Lab/Lab210513_14/Lab"
  
  BefWd <- getwd()
  if (BefWd != Basewd) {
    setwd(Basewd)
    getwd()
    cat(" Change Dir,  from=", BefWd, " to=", Basewd,  "\n")
  } else {
    print(" No changes to the working directory. ")
  }
  
  ## [0020] enviroment clean: 환경데이터 제거하기
  rm(list=ls())
  
  ## [0030] Plots clean: Plot  제거하기
  #dev.off()
  if(!is.null(dev.list())) dev.off()
  
  ## [0040] Check 한글 모드 
  # Sys.getlocale()
  ## [1] "LC_COLLATE=English_United States.1252;LC_CTYPE=English_United States.1252;LC_MONETARY=English_United States.1252;LC_NUMERIC=C;LC_TIME=English_United States.1252"
  # localeToCharset()
  ## [1] "ISO8859-1"
  
  # Sys.setlocale("LC_ALL", "korean")
  ## [1] "LC_COLLATE=Korean_Korea.949;LC_CTYPE=Korean_Korea.949;LC_MONETARY=Korean_Korea.949;LC_NUMERIC=C;LC_TIME=Korean_Korea.949"
  # localeToCharset()
  ## [1] "CP949"
  KorChr <- "CP949"
  
  CurChr <- localeToCharset()
  if (CurChr != KorChr) {
    Sys.setlocale("LC_ALL", "korean")
    cat(" Change charset ,  from=", CurChr, " to=", KorChr,  "\n")
  } else {
    print(" Korea charset ")
  }

## ----------------------------------------
##  Step 1. 벡터의 인덱싱 
## ----------------------------------------
  
  weight <- c(57, 81, 65, 49, 72)
  weight[1]
  weight[2]
  weight[c(1, 4, 5)]    ## 특정 index 만 추출
  weight[2:4]           ## ":"은 연속한 데이터만 추출
  weight[-c(1, 4, 5)]   ## 제외하고 가져오기
  weight[-c(1, 4:5)]    ## 제외하고 가져오기. 연속 데이터 표시
  
## ----------------------------------------
##  Step 2. 벡터의 연산
## ----------------------------------------
  

  
## ----------------------------------------
##  Step 3. 요인(factor)
## ----------------------------------------
  
  
  
## ----------------------------------------
##  Step 4. 행렬
## ----------------------------------------
  

  
## ----------------------------------------
##  Step 5. 배열
## ----------------------------------------
  
  
## ----------------------------------------
##  Step 6. 리스트
## ----------------------------------------
  
  
## ----------------------------------------
##  Step 7. 데이터 프레임
## ----------------------------------------
### 생성
### 속성
  
  
## ----------------------------------------
##  Step 8. 페키지
## ----------------------------------------

  
  
## END ##