

stats <- read.csv(file.choose())
stats


setwd("/Users/yiwenzhao/Desktop/R")
getwd()

rm(stats)

stats <- read.csv("P2-Demographic-Data.csv")

stats


# ------------------------------------------------------------------------
# Exploring data

a <- nrow(stats)
b <- ncol(stats)

top5 <- head(stats) # 5 head, n=5
top5

weak5 <- tail(stats) # 5 tail, n=5
weak5

#check data type
str(stats)
summary(stats)


#-------------------------------------- Using $ sign
stats
head(stats)
stats["China","Birth.rate"]
stats$Internet.users
stats$Country.Name
levels(stats$Income.Group)
summary(stats)
str(stats)

#-------------------------------------- Basic operation with a DF

stats[1:10,] 
head(stats,10)

is.data.frame(stats[,1, drop =F])

#-------------------------------------- Add column
stats$MyCalu <- stats$Birth.rate * stats$Internet.users
stats$MyCalu

head(stats)

#-------------------------------------- remove column

stats$MyCalu <- NULL
head(stats)

#-------------------------------------- filtering DF
head(stats)

stats$Internet.users < 2

filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Country.Name == "China",]
stats[stats$Birth.rate == "12.1",]


#-------------------------------------- Introduction of qplot()
#install.packages()

library(ggplot2)

qplot(data = stats, x = Internet.users, 
      y = Birth.rate, size = I(2), colour = Income.Group)




qplot(data = head(stats), x = Country.Name, y = Internet.users)
qplot(data = stats, x = Income.Group, y = Birth.rate, 
      size = I(2), colour = Income.Group)

#--------------------------------------  creating Df
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)

mydf


#------- changing column names

colnames(mydf) <- c("Country","Code","Region")

head(mydf)
rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#---------------- merge df
newdf <- merge(stats, mydf, by.x = "Country.Name", by.y = "Country")
head(newdf)
newdf$Code <- NULL
head(newdf)
qplot(data = newdf, x = Internet.users, y = Birth.rate, 
      size = I(3), colour = Region, shape = I(16), alpha=I(0.7))
#-------------------Title

qplot(data = newdf, x = Internet.users, y = Birth.rate, 
      size = I(3), colour = Region, shape = I(16), alpha=I(0.7),
      main = "Birth Rate vs Internet Users, created by Jack Zhao, University of San Diego")



