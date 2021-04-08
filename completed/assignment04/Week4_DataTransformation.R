# Assignment: Week 4, Exercise 4.2, Data Transformation
# Name: Adams, Katie
# Date: 2021-04-06

library("readxl")

setwd("C:/Users/kadams/OneDrive - Suncor Energy Inc/DSC Masters Program/GitHub/DSC520/Assignments/dsc520")
housing_df <- read_xlsx("data/week-6-housing.xlsx") 

#Use the apply function on a variable in your dataset
apply(housing_df[,2:4], 2, sum)

#Use the aggregate function on a variable in your dataset
aggregate(year_built ~ square_feet_total_living, housing_df, mean)

#Use the plyr function on a variable in your dataset – 
#more specifically, I want to see you split some data, perform a modification to the data, 
#and then bring it back together
library(plyr)

housing_df$sale_warning[housing_df$year_built < 1990] <- 0

sales <- ddply(housing_df, .variables=("sale_warning"), .mean=mean(as.numeric('Sale Price')))

sales

#Check distributions of the data
hist(housing_df$`Sale Price`)

#Identify if there are any outliers
boxplot(housing_df$`Sale Price`)

#Create at least 2 new variables
housing_df$bath_total_count <- housing_df$bath_full_count+housing_df$bath_half_count+housing_df$bath_3qtr_count
housing_df$LandUse <- housing_df$square_feet_total_living/housing_df$sq_ft_lot
