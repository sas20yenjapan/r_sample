#エクセルからの読み込み
#集計関数 aggregate
#for文

install.packages("readxl") #エクセルエクセルからのデータ読み込みデータ読み込みパッケージデータ読み込みパッケージのインストール
library(dplyr) #データ処理系パッケージの読み込み
library(magrittr) #データ処理系パッケージの読み込み

shanghaidf <- shanghai %>% data.frame() #データフレーム化
names(shanghaidf) #列名の確認

#集計関数 aggregate
aggregate.age<-
  aggregate(shanghaidf$調査フロー.購入重視点MA.外観デザイン ~ 
              shanghaidf$調査フロー.性年齢.年代 , FUN=sum, na.rm=TRUE)

write.table(aggregate.age, "hogehoge.csv", sep=",", row.names = FALSE) #出力

## for文
for (i in 1:3){
  print(i)
}

#1重ループ
for(i in 14:20){
  aggregate(shanghaidf[,i] ~ 
              shanghaidf$調査フロー.性年齢.年代, FUN=sum , na.rm=TRUE) %>%
    set_colnames(c("調査フロー.性年齢.年代", names(shanghaidf)[i])) %>%
    print()
 }

#2重ループ
for(h in 10:13){
  for(i in 14:20){
    aggregate(shanghaidf[,i] ~
                shanghaidf[,h], FUN=sum , na.rm=TRUE) %>%
      set_colnames(c(names(shanghaidf)[h], names(shanghaidf)[i])) %>%
      print()
  }
}