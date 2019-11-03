# pduchesne 02-11-2019
# Best Word - Coursera Capstone Project
# Global.R
set.seed=(29092015)
library(stringr);
library(data.table);


##load data.table
DT<- readRDS(file="./DT.Rds"); #  DT4 308 Mb =>6 414 377 obs. of 4 var.,DT5: 224.6 Mb => 4 743 572 obs. of 4 variables & DT freq3plus=> 486.6 Mb - 9 840 980 obs. of 4 var.
options(warn = -1)
setkey(DT,V1,ng)
setorderv(DT,c("ng","frequency"), c(-1,-1))
