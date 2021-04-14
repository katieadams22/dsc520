# Assignment: Week 4, Exercise 4.2, Data Transformation
# Name: Adams, Katie
# Date: 2021-04-06

#use readxl package to use Week 6 Housing data
library("readxl") 

#setwd("C:/Users/kadams/OneDrive - Suncor Energy Inc/DSC Masters Program/GitHub/DSC520/Assignments/dsc520")
housing_df <- read_xlsx("data/week-6-housing.xlsx") 

#Using the dplyr package, use the 6 different operations to analyze/transform the data: (Ch.12)
library(tidyverse) 

#GroupBy and #Summarize
housing_df %>% group_by(zip5) %>% summarize(AvgPrice=mean(square_feet_total_living)) 

#Mutate
housing_df %>% mutate(Total_Bath=bath_full_count+bath_half_count+bath_3qtr_count) 

#Filter
housing_df %>% filter(year_built == 2003) 

#Select
housing_df %>% select(c(building_grade, year_renovated)) 

#Arrange
housing_df %>% group_by(zip5) %>% summarize(AvgPrice=mean(square_feet_total_living)) %>% arrange(AvgPrice) 
  
  
#Using the purrr package perform 2 functions on your dataset: You could use zip_n, keep, discard, compact, etc. 
library(purrr) 
housing.list<-as.list((housing_df)) #create a list from housing dataframe

#map purrr function (none of zip_n, keep, discard, compact referenced in our weekly reading, only map functions)
divideThousand<- function(.x) {
  return(.x / 1000)
}
map(housing.list[2], .f=divideThousand)

#map_dbl purrr function (none of zip_n, keep, discard, compact referenced in our weekly reading, only map functions)
housing.list[2] %>% map_dbl(sum)

#Use the cbind and rbind function on your dataset (Ch. 14, p. 189-190)
#make two vectors and combine them as columns in a data.frame
Mailing_Address <- cbind(housing_df$addr_full, housing_df$ctyname) 
Year_Built_Renovated <- cbind(housing_df$year_built, housing_df$year_renovated) 
Property_Information_df <- rbind(Mailing_Address, Year_Built_Renovated) 
Property_Information_df 


#Split a string, then concatenate the results back together (Ch. 16, stringr package, str.split function - p 213-214)
library(stringr)

#split the string
saledatelist <- str_split(string=housing_df$`Sale Date`, pattern ="-")

#view the saledatelist list
head(saledatelist)

#combine them into one matrix
saledatematrix <- data.frame(Reduce(rbind, saledatelist))
head(saledatematrix)

#give the columns good names
names(saledatematrix) <- c("Sale_Year", "Sale_Month", "Sale_Day") 

#bind the new columns into the data.frame
housing_df <- cbind(housing_df, saledatematrix) 

#convert the Sale_Year, Sale_Month, Sale_Day columns into numeric
housing_df$Sale_Year <- as.numeric(as.character(housing_df$Sale_Year)) 
housing_df$Sale_Month <- as.numeric(as.character(housing_df$Sale_Month))
housing_df$Sale_Day <- as.numeric(as.character(housing_df$Sale_Day))

#view the changes to the housing data frame
head(housing_df)



#USED TO CLEAN UP DATASET AND EXTRA COLUMNS CREATED
housing_df <- subset(housing_df, select = -Sale_Year)
housing_df <- subset(housing_df, select = -Sale_Month)
housing_df <- subset(housing_df, select = -Sale_Day)
housing_df2 <- subset(housing_df2, select = -Sale_Year)
housing_df2 <- subset(housing_df2, select = -Sale_Month)
housing_df2 <- subset(housing_df2, select = -Sale_Day)
housing_df2 <- subset(housing_df2, select = -Sale_Year.1)
housing_df2 <- subset(housing_df2, select = -Sale_Month.1)
housing_df2 <- subset(housing_df2, select = -Sale_Day.1)
housing_df <- subset(housing_df, select = -`Sale Year`)
housing_df <- subset(housing_df, select = -`Sale Month`)
housing_df <- subset(housing_df, select = -`Sale Day`)
housing_df <- subset(housing_df, select = -`Sale Year.1`)
housing_df <- subset(housing_df, select = -`Sale Month.1`)
housing_df <- subset(housing_df, select = -`Sale Day.1`)
housing_df2 <- subset(housing_df2, select = -`Sale Year`)
housing_df2 <- subset(housing_df2, select = -`Sale Month`)
housing_df2 <- subset(housing_df2, select = -`Sale Day`)
housing_df2 <- subset(housing_df2, select = -`Sale Year.1`)
housing_df2 <- subset(housing_df2, select = -`Sale Month.1`)
housing_df2 <- subset(housing_df2, select = -`Sale Day.1`)