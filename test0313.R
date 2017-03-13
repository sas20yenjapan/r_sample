##元データ（Visit Countデータ）を確認。
data1
##NAを0に置換したい。
data1[is.na(data1)]<-0
#距離行列を出したい。
distance1<-as.dist(distance1)
#distance2<-scale(distance1)#標準化。平均0、分散1の正規分布。#櫻井さんよりas.distでいけるとのこと
hc.ward<-hclust(distance1, method = "ward.D")#クラスタリング実施。
plot(hc.ward)#可視化

#転置する場合はt(data1)にするとAOIベースのデータ
#応用k-means
km10<-kmeans(distance1,10)