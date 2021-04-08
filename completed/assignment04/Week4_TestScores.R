# Assignment: Week 4, Exercise 4.2 ,Test Scores
# Name: Adams, Katie
# Date: 2021-04-06

setwd("C:/Users/kadams/OneDrive - Suncor Energy Inc/DSC Masters Program/GitHub/DSC520/Assignments/dsc520")
scores_df <- read.csv("data/scores.csv") 

#Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section. 
library(tidyverse)
Sports <- scores %>% filter(Section == "Sports")
Regular <- scores %>% filter(Section == "Regular")

## Use Plot Function to plot each sections' scores and number of students achieving that score
plot(Count~Score, data=Sports, xlab="Scores for Class", ylab="Count of Scores", main="Sports Class")
plot(Count~Score, data=Regular, xlab="Scores for Class", ylab="Count of Scores", main="Regular Class")