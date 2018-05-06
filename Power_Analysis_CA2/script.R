install.packages('pwr')
library(pwr)

#Hypothesis
#reminder: Example 1 Variable A does not relate to Variable B,
#H0: The number of assualts committed is independent of the day of the week
#H1: The number of assaults committed is dependent on the day of the week.


#----------------------------------------------------------------------------------------------#
#chisqr test#

effect_size <- cohen.ES(test = c('chisq'), size = c('small'))
effect_size

number_of_records <- pwr.chisq.test(w = effect_size$effect.size, N = NULL, df = 6, sig.level = .05, power = 0.95)
plot(number_of_records)

install.packages('dplyr')
library(dplyr)


setwd("C:/Users/Connor/Documents/MSc Computing in Big Data Analytics/Data Science/CA")
list.files()
data <- read.csv("train.csv", header = TRUE)
assault_data <- subset(data, subset = data$Category == 'ASSAULT')
head(assault_data)
str(assault_data)

#set the seed for reproducable results and add one to the number of 
#records required in the event the the number of required records gets 
#rounded down as its based on N from our analysis earlier
set.seed(1); assault_data <- sample_n(assault_data, number_of_records$N + 1)


str(assault_data)
# the Day of the week from Monday to Sunday
levels(assault_data$DayOfWeek) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")


tbl_view <- table(assault_data$DayOfWeek, assault_data$Category == 'ASSAULT')
tbl_view


prop.table(tbl_view, 2)

stat_analysis_result <- chisq.test(tbl_view)
stat_analysis_result

plot(stat_analysis_result)



