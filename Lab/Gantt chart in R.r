##
## Gantt chart in R.R : Gantt chart with R 
##
## update: 21.05.11

## ----------------------------------------
## 기본환경 설정
    source("lab_00_기본환경설정.R")


## --------------------------------------------------
## Step 1: Using Candela
##
## https://github.com/Kitware/candela/tree/master/R/candela
##
#install.packages('devtools')
#devtools::install_github('Kitware/candela', subdir='R/candela')
library(candela)

data <- list(
    list(name='Do this', level=1, start=0, end=5),
    list(name='This part 1', level=2, start=0, end=3),
    list(name='This part 2', level=2, start=3, end=5),
    list(name='Then that', level=1, start=5, end=15),
    list(name='That part 1', level=2, start=5, end=10),
    list(name='That part 2', level=2, start=10, end=15))

candela('GanttChart',
    data=data, label='name',
    start='start', end='end', level='level',
    width=700, height=200)

## --------------------------------------------------
## Step 2: Using DiagrammeR
##
#install.packages("DiagrammeR")
library(DiagrammeR)

mermaid("
gantt
dateFormat  YYYY-MM-DD
title A Very Nice Gantt Diagram

section Basic Tasks
This is completed             :done,          first_1,    2021-05-06, 2021-05-08
This is active                :active,        first_2,    2021-05-09, 3d
Do this later                 :               first_3,    after first_2, 5d
Do this after that            :               first_4,    after first_3, 5d

section Important Things
Completed, critical task      :crit, done,    import_1,   2021-05-06,24h
Also done, also critical      :crit, done,    import_2,   after import_1, 2d
Doing this important task now :crit, active,  import_3,   after import_2, 3d
Next critical task            :crit,          import_4,   after import_3, 5d

section The Extras
First extras                  :active,        extras_1,   after import_4,  3d
Second helping                :               extras_2,   after extras_1, 20h
More of the extras            :               extras_3,   after extras_1, 48h

section Operation
System operation              :active,        operetion_1,   after import_4,  3d
IT Help deak                  :active,        operetion_2,   after extras_1, 20h
")	


## --------------------------------------------------
## Step 3: Using timevis
##
##install.packages("timevis")

#install.packages("remotes")
#remotes::install_github("daattali/timevis")

library(timevis)

data <- data.frame(
    id      = 1:4,
    content = c("Item one"  , "Item two"  ,"Ranged item", "Item four"),
    start   = c("2021-05-10", "2021-05-11", "2021-05-20", "2021-06-14 15:00:00"),
    end     = c(NA          ,  NA         , "2021-06-04", NA)
)

timevis(data)


## END ##