colname <- c("Manager", "Date", "Country", "Gender", "Age", "q1", "q2", "q3", "q4", "q5")
manager <- c(1, 2, 3, 4, 5)
date <-c("2018-15-10", "2018-11-01", "2008-21-10", "2018-28-10", "2018-01-05")
country <- c("US", "US", "IRL", "IRL", "IRL")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)

my_data <- data.frame(date, country, gender, age, q1, q2, q3, q4, q5)
head(my_data)
str(my_data)

my_data$age[my_data$age == 99] <- NA
#create now column catage to categories the age groups
my_data$agecat[my_data$age >= 45] <- "Elder"
my_data$agecat[my_data$age >= 26 & my_data$age <= 44] <- "Middle Age"
my_data$agecat[my_data$age <= 25] <- "Young"
my_data$agecat[is.na(my_data$age)] <- "Elder"
my_data
AgeCat <- factor( my_data$agecat, order = TRUE, levels = c("Young", "Middle Age", "Elder"))
AgeCat


my_data$agecat[my_data$age >= 45] <- "Elder"
my_data$agecat[my_data$age >= 26 && my_data$age <= 44] <- "Middle Age"
my_data$agecat[my_data$age <= 25] <- "Young"
my_data$agecat[is.na(my_data$age)] <- "Elder"
my_data






length(AgeCat)
colnames(my_data) <- colname

