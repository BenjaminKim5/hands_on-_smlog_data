##
## lab_00_기본환경설정.R
##
## R's 간단 실습(기본환경설정)
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

## END ##