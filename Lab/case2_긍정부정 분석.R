##
## CASE2 : 긍정부정 분석
##
## update: 21.04.22
## update: 21.05.14

## =====================================================
## 00. 환경정보 초기화
## =====================================================
  source("lab_00_기본환경설정.R")

## =====================================================
## 01.데이터 읽어 오기
## =====================================================
## (1) rvest: Easily Harvest (Scrape) Web Pages
##
## install.packages("rvest")
  library(rvest)

## (2) Read text file line by line
  iphonetext = readLines("./data/case2_아이폰댓글수집.txt")
  iphonetext = repair_encoding(iphonetext)
  iphonetext

## =====================================================
## 02.긍정, 부정 사전 만들기
## =====================================================
## (1) 긍정, 부정 사전 읽어 오기
##  
## error ; 에서 불완전한 마지막 행이 발견되었습니다
##         ==> txt파일의 마지막 줄에서 캐리지 리턴?을 찾을 수 없어 나오는 것임
#    Kneg.txt : 부정어 사전
#    Kpos.txt : 긍정어 사전
  KposDic = readLines("./data/KposDic.txt")
  KnegDic = readLines("./data/KnegDic.txt")
  
  KposDic
  KnegDic
  
  KnegDic = repair_encoding(KnegDic)
  KposDic = repair_encoding(KposDic)

  length(KposDic)           # 2
  length(KnegDic)           # 4

## (2) 긍정어/부정어 단어 추가
##  
  KposDic.final = c(KposDic, 'test')
  KnegDic.final = c(KnegDic, '별로인듯','엉터리','불편해')

## (3) 마지막에 단어 추가
  tail(KposDic.final)
  tail(KnegDic.final)
  
  KposDic.final
  KnegDic.final

## =====================================================
## 03.감성 분석 함수 정의-sentimental
## =====================================================
## -- (1) 문자열 처리를 위한 패키지 로딩  
## install.packages("plyr")
## install.packages("stringr")
## install.packages("sos")
  library(plyr)     # laply()함수 제공       
  library(stringr)  # str_split()함수 제공

  library("sos")    # Sort by Package

#  findFn("laply")

# -- (2) 감성분석을 위한 함수 정의
sentimental = function(sentences, KposDic, KnegDic){

  scores = laply(sentences, function(sentence, KposDic, KnegDic) {
    sentence = gsub('[[:punct:]]', '', sentence) # 문장부호 제거
    sentence = gsub('[[:cntrl:]]', '', sentence) # 특수문자 제거
    sentence = gsub('\\d+', '', sentence)        # 숫자 제거
    sentence = tolower(sentence)                 # 모두 소문자로 변경
    
    word.list = str_split(sentence, '\\s+')      # 공백 기준으로 단어 생성 
    words = unlist(word.list)                    # unlist() : list를 vector 객체로 구조변경
    
    pos.matches = match(words, KposDic)         # words의 단어를 KposDic에서 matching         
    neg.matches = match(words, KnegDic)
    
    pos.matches = !is.na(pos.matches)            # NA 제거, 위치(숫자)만 추출
    neg.matches = !is.na(neg.matches)
    
    score = sum(pos.matches) - sum(neg.matches)  # 긍정 - 부정   
    
    return(score)
  }, KposDic, KnegDic)
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}

## =====================================================
## 04.감성 분석 : 두번째 변수(review) 전체 레코드 대상 감성분석
## =====================================================
  result=sentimental(iphonetext, KposDic.final, KnegDic.final)

  result
  names(result)           # "score" "text"

  dim(result)             # 10 2                                                    

  result$text             
  result$score            # 10 줄 단위로 긍정어/부정어 사전을 적용한 점수 합계                                             

## =====================================================
## 05.데이터 시각화: 감성분석 결과 차트 보기
## =====================================================  
## -- (1) score값을 대상으로 color 칼럼 추가  
  result$color[result$score >=1] = "blue"
  result$color[result$score ==0] = "green"
  result$color[result$score < 0] = "red"

## -- (2) 감성분석 결과 차트보기
  plot(result$score, col=result$color) # 산포도 색생 적용
  
  barplot(result$score, col=result$color, main ="감성분석 결과화면")   

## =====================================================
## 06.데이터 시각화: 단어의 긍정/부정 분석
## =====================================================    
## -- (1) 감성분석 빈도수
  table(result$color)

## -- (2) score 칼럼 리코딩
  result$remark[result$score >=1] = "긍정"
  result$remark[result$score ==0] = "중립"
  result$remark[result$score < 0]  = "부정"
  
  sentiment_result= table(result$remark)
  sentiment_result
  
## -- (3) 제목, 색상, 원크기
  pie(sentiment_result, main="감성분석 결과",
      col=c("blue","red","green"), radius=0.9)    

## End ##