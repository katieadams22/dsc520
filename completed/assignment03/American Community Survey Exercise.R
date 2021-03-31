# Assignment: ASSIGNMENT 3
# Name: Adams, Katie
# Date: 2021-03-28


## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/kadams/OneDrive - Suncor Energy Inc/DSC Masters Program/GitHub/DSC520/Assignments/dsc520")

## Load the `data/r4ds/heights.csv` to
asc <- read.csv("C:/Users/kadams/OneDrive - Suncor Energy Inc/DSC Masters Program/GitHub/DSC520/Assignments/dsc520/data/r4ds/asc.csv")

#What are the elements in your data (including the categories and data types)? 
sapply(asc, class)

#Please provide the output from the following functions: str(); nrow(); ncol() 
str(asc)
nrow(asc)
ncol(asc)

#Create a Histogram of the HSDegree variable using the ggplot2 package
#Set a bin size for the Histogram
#Include a Title and appropriate X/Y axis labels on your Histogram Plot
ggplot(asc, aes(x=HSDegree)) + geom_histogram(aes(y=..density..), bins=10) + ggtitle("Histogram of Percentage of HS Graduation")+ylab("Percent Occured") +xlab("Percentage who graduate High School") + stat_function(
  fun = dnorm, args = with(asc, c(mean = mean(HSDegree), sd = sd(HSDegree))))

#Create a Probability Plot of the HSDegree variable
qplot(sample=HSDegree, data = asc)

#Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. 
#Include a screen capture of the results produced. 
library(pastecs)
stat.desc(asc)

library(e1071)
kurtosis(asc$HSDegree)
skewness(asc$HSDegree)
mean.normal<-0
sd.normal<-1
mean.hs<-mean(asc$HSDegree)
zscore<-(mean.hs-mean.normal)/sd.normal
zscore
