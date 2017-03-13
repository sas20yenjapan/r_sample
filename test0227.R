#カウントデータをdata1として読み込み
data1<-read.csv("sampledata1(0227).txt", sep="\t", row.names = 1)

#属性データをdata3として読み込み
data3<-read.csv("sampledata2(0227)3.txt", sep="\t", header = FALSE)

#data1の1行目だけを出力したい。
data1[1,]

#data1の1列目だけを出力したい。
data1[,1]

#data1の1列目から5列目までを出力したい。
data1[,c(1:5)]

#data1のsub003の人のデータだけを出力したい。
data1["sub003",]

colnames(data3)<-c("subs","sex","gen.","use")
colnames(data3)

data3$sex

#install.packages("dplyr")
#install.packages("magrittr")
library(dplyr)
library(magrittr)

male <- data3 %>% filter(sex=="男性")
#HVuser <- data3 %>% filter(use=="HVユーザー")
#male_HVuser <- data3 %>% filter(sex=="男性" & use=="HVユーザー")
row.names(data1)
male$subs
row.names(data1) %in% male$subs
maledata <- data1[row.names(data1) %in% male$subs,]
maledata[is.na(maledata)] <- 0
maledata
sumdata<-apply(maledata,2,sum)#各aoi別の集計 1は行方向　2は列方向
plot(sumdata)

sumdata_sub<-apply(maledata,1,sum)#各被験者別の集計 1は行方向　2は列方向

plot(sumdata_sub)
