#test0321
#属性別にどのように見ているかを比較したい。
visit.count<-data1
part.att<-data3
#visit.count[is.na(visit.count)]<-0

count.sum<-apply(visit.count,1,sum)#行ごとに合計をとる。
#count.sum<-apply(visit.count,2,sum)#列ごとに合計をとる。



#男性と女性でどのように見ているかの違いを知りたい。
library(magrittr)
library(dplyr)
maleID<-part.att %>% subset(sex=="男性") %>% select(subs)
femaleID<-part.att %>% subset(sex=="女性") %>% select(subs)
boxplot(count.sum[maleID$subs],count.sum[femaleID$subs])

source("http://aoki2.si.gunma-u.ac.jp/R/src/Steel-Dwass.R", encoding="euc-jp")
group<-rep(1:2,c(length(maleID$subs),length(femaleID$subs)))
count.sum2<-c(count.sum[maleID$subs],count.sum[femaleID$subs])
Steel.Dwass(count.sum2, group)


#年代別にでどのように見ているかの違いを知りたい。
seventyID<-part.att %>% subset(gen.=="70年代") %>% select(subs)
eightyID<-part.att %>% subset(gen.=="80年代") %>% select(subs)
ninetyID<-part.att %>% subset(gen.=="90年代") %>% select(subs)
boxplot(count.sum[seventyID$subs],count.sum[eightyID$subs],count.sum[ninetyID$subs])
group<-rep(1:3,c(length(seventyID$subs),length(eightyID$subs),length(ninetyID$subs)))
count.sum2<-c(count.sum[seventyID$subs],
              count.sum[eightyID$subs],
              count.sum[ninetyID$subs])
Steel.Dwass(count.sum2, group)



#ユーザ別にでどのように見ているかの違いを知りたい。
hvID<-part.att %>% subset(use=="HVユーザー") %>% select(subs)
eusID<-part.att %>% subset(use=="欧米ユーザー") %>% select(subs)
jpID<-part.att %>% subset(use=="日系競合ユーザー") %>% select(subs)
boxplot(count.sum[hvID$subs],count.sum[eusID$subs],count.sum[jpID$subs])
group<-rep(1:3,c(length(hvID$subs),length(eusID$subs),length(jpID$subs)))
count.sum2<-c(count.sum[hvID$subs],
              count.sum[eusID$subs],
              count.sum[jpID$subs])
Steel.Dwass(count.sum2, group)


