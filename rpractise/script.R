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













