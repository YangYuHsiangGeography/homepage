rm(list=ls()) #clear all
setwd("~/Desktop/110_visualize")
#install.packages("readxl")
library(readxl)
s1=read_excel("2019s1.xls")
s2=read_excel("2019s2.xls")
s3=read_excel("2019s3.xls")
s4=read_excel("2019s4.xls")
s5=read_excel("2020s1.xlsx")
s6=read_excel("2020s2.xlsx")
d=rbind(s1,s2,s3,s4,s5,s6)
d
library(dplyr)
colnames(d)
d1=d %>% filter(主要用途=="住家用")
d2=d1 %>% filter(建物型態=="公寓(5樓含以下無電梯)")
d3=d2 %>% select(交易年月日)
d4=as.data.frame(table(d3))
d4
colnames(d4)=c("time","count")
d4$time=as.numeric(as.character(d4$time))
d4$time
d5=d4 %>% filter(time >= 1090101)
d5$time=as.character(d5$time)
post=substr(d5$time,4,7)
prior=as.character(as.numeric(substr(d5$time,1,3))+1911)
prior
d5$date=paste0(prior,post)
d6=d5 %>% select(date,count)
d6$date= as.Date(d6$date,"%Y%m%d")
d6

Sys.setlocale("LC_TIME","English United States")
library(zoo)
#轉換成weekday 
d6$quarter = as.yearqtr(d6$date)
d6

#轉換成quarter
library(lubridate)
d6$weekday = wday(d6$date, label = TRUE,locale=Sys.setlocale("LC_TIME", "C"))
d6

library(xts)

# 轉換成 ts 檔案格式
my_ts <- xts(d6$count , order.by = d6$date)
my_ts

ts_plot(my_ts, Xtitle = "Month", Ytitle = "Value", slider = T)
ts_heatmap(my_ts, last = NULL, wday = F, color = "Blues",
           title = NULL, padding = TRUE)


ts1=ts_seasonal(my_ts,type="all")
ts_heatmap(ts1)
ts1

ep3 <- endpoints(my_ts,on = "week")
my_ts1 <-period.apply(my_ts,INDEX = ep3,FUN = sum)
my_ts1

#install.packages("lubridate")
library(lubridate)
my_tsdf <- as.data.frame(my_ts)
colnames(my_tsdf) <- "price"
date1 <- time(my_ts) %>% as.Date()
my_tsdf <- my_tsdf %>% mutate(yr = year(date1)) %>%
  mutate(quarter = quarters(date1)) %>% group_by(yr, quarter) %>% summarise(meanprice = mean(price))



#繪圖
ts_plot(my_ts1, Xtitle = "Month", Ytitle = "Transaction count", slider = T,title="Transaction count time series in 2020 in Taipei City")
ts_seasonal(my_ts1,type="all")
ts_heatmap(my_ts1)
ts_surface((my_ts1))


?ts_heatmap


#install.packages("tseries")
#install.packages("forecast")
library(tseries)
library(forecast)
data(Airpessengers)

library(ts)
install.packages("TSstudio")
library(TSstudio)
my_ts=ts(d4$count)
ts_seasonal(my_ts)

#creating ts object (ts=time series)
#install.packages("xts")
library(xts)
my_ts=ts()



table(d$建物型態)


#Creating a time-series plot for comparing 
#weekly average transaction prices between 大安區 and 文山區


r1=d %>% filter(d$鄉鎮市區==c("大安區","文山區"))
r2=r1 %>% select(鄉鎮市區,交易年月日,總價元)
r2$總價元=as.numeric(as.character(r2$總價元))/(10^6)
r3=r2 %>% group_by(交易年月日,鄉鎮市區) %>% summarise_all(mean)
e=as.character(r3$交易年月日)
post=substr(e,4,7)
prior=as.character(as.numeric(substr(e,1,3))+1911)
r3$date=paste0(prior,post)
r3$date= as.Date(r3$date,"%Y%m%d")
r3=na.omit(r3)
r3

area1=r3 %>% filter(鄉鎮市區=="大安區")
area2=r3 %>% filter(鄉鎮市區=="文山區")

#weekly average
#大安
my_ts <- xts(area1 , order.by = area1$date)
ep3 <- endpoints(my_ts,on = "weeks")
my_ts1 <-period.apply(my_ts,INDEX = ep3,FUN = mean)

#文湖
my_ts <- xts(area2 , order.by = area2$date)
ep3 <- endpoints(my_ts,on = "weeks")
my_ts2 <-period.apply(my_ts,INDEX = ep3,FUN = mean)

x <- cbind(coredata(my_ts1),coredata(my_ts2))
x



my_tsf <- xts(x , order.by = as.Date(index(my_ts2)))
ts_plot(my_tsf,slider = TRUE,title="Time-Series of transaction count in Taipei in 2020",Xtitle="time",Ytitle="transaction count")

my_ts2


?period.apply













