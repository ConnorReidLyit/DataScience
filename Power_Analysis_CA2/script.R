install.packages('pwr')
install.packages('dplyr')
library(pwr)
library(dplyr)

#----------------------------------------------------------------------------------------------#

#Hypothesis
#reminder: Example 1 Variable A does not relate to Variable B,
#H0: There is no relationship between the number of assaults and the Police District
#H1: There is a relationship between the number of assaults and the Police District

#----------------------------------------------------------------------------------------------#

#-----------------------------------------CHISQUARE TEST---------------------------------------#

#calculate the effect size for the chi square analysis
#choosing a lerge effect size as this is the standard effect size when testing
effect_size <- cohen.ES(test = c('chisq'), size = c('large'))
effect_size

#calculating the number of records needed to test H0
number_of_records <- pwr.chisq.test(w = effect_size$effect.size, N = NULL, df = 9, sig.level = .05, power = 0.95)
plot(number_of_records)


#set the WD and import the data into a df
setwd("C:/Users/Connor/Documents/MSc Computing in Big Data Analytics/Data Science/CA")
list.files()
data <- read.csv("train.csv", header = TRUE)

#create a new df from only the assault data
assault_data <- subset(data, data$Category == 'ASSAULT')
str(assault_data)

#set the seed for reproducable results and add one to the number of 
#records required in the event the the number of required records gets 
#rounded down as its based on N from our analysis earlier
set.seed(1);
assault_data <- sample_n(assault_data, number_of_records$N + 1)
str(assault_data)

#create tabular view of the data to later apply the chi square test
tbl_view <- table(assault_data$Category == 'ASSAULT', assault_data$PdDistrict)
tbl_view

# review the proportion of the the data in the table by row. 
prop.table(tbl_view, 1)

#apply the chi square test to the table containing the assault and District data
stat_analysis_result <- chisq.test(tbl_view)

# fail to reject H0 based on p-value of .18
stat_analysis_result