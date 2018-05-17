x <- 2
y <- 5
x

installed.packages("swirl")
library(swirl)
swirl()


my_list <- list(a = matrix(1:9, 3), b = 1:5, c = matrix(1:4, 2), d = 2)
sapply(my_list, sum)

first_list <- list(a = matrix(1:9, 3), b = 1:5, c = matrix(1:4, 2), d = 2)
second_list <- list(a = matrix(1:9, 3), b = 1:7, c = matrix(1:4, 2), d = 2)

simple_function <- function(first_list, second_list) {
    result <- NROW(first_list) + NROW(second_list)
    return(result)
}

mapply(simple_function, first_list, second_list)


#h0: U = 0.5
#h1: U not equal 0.5

#flip the coin and observe the porportion of heads
#record results
#perform statistical analysis
# judge significance based on the p value and fail to reject or reject the null hypothesis

install.packages('pwr')
library(pwr)

power_change <- pwr.p.test(h = ES.h(p1 = 0.65, p2 = 0.50), sig.level = 0.05, power = .80) #power = 0.95, alternative = "greater"
power_change
plot(power_change)


? pwr.p.test


effect_size <- cohen.ES(test = c('r'), size = c('medium'))
effect_size

effect_vector <- c(0.2, 0.5, 0.8)

pwr.p.test(h = effect_vector, n = 20, sig.level = .05)

? ES.h




drink <- pwr.2p.test(ES.h(p1 = .55, p2 = .50), sig.level = 0.05, power = 0.95)
plot(drink)




install.packages("dplyr")
library(dplyr)

data(diamonds, package = "ggplot2")
head(diamonds, 4)
dim(head(diamonds, 4))



install.packages("magrittr")
library(magrittr)

diamonds %>% head(4) %>% dim()

x <- c(0.109, 0.359, 0.63, 0.996, 0.515, 0.142, 0.017, 0.829, 0.907)
round(exp(diff(log(x))), 1)

x %>% log() %>% diff() %>% exp %>% round(1)

diamonds %>% head(5)
diamonds %>% class

select(diamonds, carat, price)

diamonds %>% slice(c(1:5, 8, 15:20))

set <- select(diamonds, carat, price)

?mutate

diamonds %>% select(price, carat) %>% mutate(ratio = price / carat, Double = ratio * 2)

diamonds %>% summarise(AvgPrice = mean(price), MedianPrice = median(price), AvgCarat = mean(carat))

diamonds %>% group_by(cut) %>% summarise(AvgPrice = mean(price))

diamonds %>% group_by(cut) %>% summarise(AvgPrice = mean(price), SumCarat = sum(carat)) %>% arrange(AvgPrice)

install.packages("hflights")
library(hflights)

hflights %>% head(5)

hflights_df <- tbl_df(hflights)

hflights_df

#Use the filter() function to show only data where month=1 and 
#UniqueCarrier = AA. Save the results in the data frame f_df
f_df <- hflights_df %>% filter(Month == 1, UniqueCarrier == "AA")

#Using the OR operator, filter flights for UniqueCarrier = AA OR UA
hflights_df %>% filter(UniqueCarrier == "AA" | UniqueCarrier == "UA")

#Use arrange() to reorder the data on month, dayofmonth  and airtime in descending order.
hflights_df %>% arrange(desc(Month), desc(DayofMonth), desc(AirTime)) %>% head(20)

#Use select() to choose all attributes between Year – DayOfWeek, TailNum and ActualElapsedTime
hflights_df %>% select(1:4, 9:10)

#Use mutate() to add 2 new attributes called Gain and Gain_Per_Hour. 
#Gain = ArrDelay – DepDelay. Gain_Per_Hour = Gain/(AirTime/60)
hflights_df %>% select(ArrDelay, DepDelay, AirTime) %>% mutate(Gain = ArrDelay - DepDelay,
    Gain_Per_Hour = Gain / (AirTime / 60))

hflights_df %>% str()

#Produce a summary using the summarise() function to show the mean arrival delay. 
#Call the statistic “Delay”. It is calculated using the mean function. 
#The mean function also allows you to remove NA’s. Use this in your summarise() function.

hflights_df %>% summarise(Delay = mean(!is.na(ArrDelay)))


dosage <- c(20, 30, 40, 45, 60)
Drug_A <- c(16, 20, 27, 40, 60)
Drug_B <- c(15, 18, 25, 31, 40)

drugs <- data.frame(dosage, Drug_A, Drug_B)

plot(drugs)



plot(dosage, Drug_A, type = 'b')
par(new = TRUE) # allow to add a second chart on the same plot
plot(dosage, Drug_B, type = 'b')

opar <- par(no.readonly = TRUE) #snap shot original global settings 
par <- par(lty = 2, pch = 17) #change the global chart settings
par(opar) # reset par back to original

plot(dosage, Drug_A, type = "b", lty = 3, lwd = 3, pch = 15, cex = 2)
title(main = "Drug dosage", col.main = "blue", font.main = 4)


