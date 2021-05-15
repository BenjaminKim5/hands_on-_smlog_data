##
## lab_00_간단한실습.R
##
## R's 간단 실습
##
## update: 21.05.13

## ----------------------------------------
## 기본환경 설정
# getwd()
# setwd("D:/500_Lab/Lab210513_14/Lab")
# getwd()

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

  
## ----------------------------------------
##  Step 1. 
## ----------------------------------------
  
  ## 간단실습 0-1
  A_score <- c(90, 80, 75, 60, NA); A_score
  
  ## 간단실습 0-2
  B_score <- c(90, 80, 75, 60, NULL)
  B_score

  ## 간단실습 0-3
  a_score <- c('A', 'B', 'C'); a_score
  
  ## 0-4 : 산술 연산자(Arithmetic Operator)
  3 + 4
  a <- 3 + 4
  a <- 3 - 4
  a <- 3 * 4
  a <- 3 / 4
  
  a <- 3 ** 4
  b <- 3 ^ 4
  rm(a, b)
  a <- 12 %/% 4
  b <- 12 %% 4
  
  a <- 21 %/% 4
  b <- 21 %% 4
  c <- 21 / 4

## ----------------------------------------
##  Step 2. 
## ----------------------------------------
  
  ## 0-5 : 할당 연산자(Allocation Operator)
  x <- 3 
  y = 4
  5 -> z

  ## 0-6 : 비교 연산자(Relational Operator)
  3 > 4
  rm(list=ls())
  r1 <- 3 > 4
  r2 <- 3 >= 4
  r3 <- 3 < 4
  r4 <- 3 <= 4
  r5 <- 3 == 4
  r6 <- 3 != 4
  r7 <- !(3 == 4)

  ## 0-7 : 논리 연산자(Logical Operator)
  rm(list=ls())

    ## CASE 1 ; AND
    r1 <- 3 > 4
    r2 <- 3 <= 4  ## CASE 2  
    
    r3 <- (3&4) & (3>=4)
  
    r4 <- (3&4) && (3>=4)
  
    ## CASE 2 : OR
    r5 <- (3&4) | (3>=4)
    
    r6 <- (3&4) || (3>=4)
  
  ## 0-8 : 
  rm(list=ls())

    #populating variables
    a <- "NA"
    b <- "NULL"
    c <- NULL
    d <- NA
    e <- NaN
    f <- Inf
  
    ### Check if variables are same?
    identical(a,d)
    # [1] FALSE
    # NA and NaN are not identical
    identical(d,e)
    # [1] FALSE
  
    ###checking length of data types
    length(c)
    # [1] 0
    length(d)
    # [1] 1
    length(e)
    # [1] 1
    length(f)
    # [1] 1
  
  ###checking data types
    str(c); class(c); 
    #NULL
    #[1] "NULL"
    str(d); class(d); 
    #logi NA
    #[1] "logical"
    str(e); class(e); 
    #num NaN
    #[1] "numeric"
    str(f); class(f); 
    #num Inf
    #[1] "numeric"
  
    ## CASE 1 :  
    pi / 0 ## = Inf a non-zero number divided by zero creates infinity
    4  / 0
    
    ## CASE 2 :  
    0 / 0  ## =  NaN
    0 / 4  ## =  NaN
  
    ## CASE 3 :  
    x <- 1/0 + 1/0 # Inf
    y <- 1/0 - 1/0 # NaN
    
    ## Ref :  
    is.finite(x)
    is.infinite(x)
    is.nan(y)
    is.na(a)

  ## 유형 변경
    rm(list=ls())
  
    x1 <- 10
    x2 <- "A"
    
    as.numeric(x1)
    as.character(x1)
  
  ## 백터 생성
    rm(list=ls())
    
    s1 <- 10
    s2 <- "Hello"
    s3 <- FALSE
    s4 <- 1 -3i
  
    v1 <- 1   
    v1 <- c(1, 3, 5)
    v2 <- c(10, 30,50)
    v5 <- c(11, 31,51)
    
    v3 <- c(v1, v2, v5)
  
    v1[2]
    v3[9]
  
    rm(list=ls())
    v1  <- 1:5
    v2  <- 5:2
    v3  <- -3.3:5
    v4  <- 5:3.3
    
    rm(list=ls())
    v1 <- seq(from=1, to=5, by=1)
    v2 <- seq(from=1, to=5, by=0.5)  
    
    v3 <- seq(from=5, to=1, by=0.5) 
    # Error in seq.default(from = 5, to = 1, by = 0.5) : 
    #  wrong sign in 'by' argument <== by 양수이기 때문에 오류   
    v3 <- seq(from=5, to=1, by=-0.5) 
    
    rm(list=ls())
    v1 = sequence(10)
    v2 = sequence(5.5)
    v3 = sequence(1)
    
    ## 벡터는 생성되었지만 값은 없음
    ## 벡터를 초기화할 때 사용할 수 있음
    v4 = sequence(0)
    
    v5 = sequence(-3)
    # Error in FUN(X[[i]], ...) : 
    #   argument must be coercible to non-negative integer 
    #   <== 음수이기 때문에 오류
    v5 = sequence(3)
    
    ## 지정된 데이터를 복사해 주는 기능
    rm(list=ls())
    v1 <- rep("a", times=5)
    v2 <- rep("a", each=5)
    v3 <- rep(c("a", "b"), times=3)
    v5 <- rep(c("a", "b"), times=3, each=2)
    v4 <- rep(c("a", "b"), each=2, times=3)
    v6 <- rep(c("a", "b"), times=c(10,5))  
  
  
## END ##