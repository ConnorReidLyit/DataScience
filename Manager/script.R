colname <- c("date", "Country", "Gender", "Age", "q1", "q2", "q3", "q4", "q5")
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

#create now column agecat to categorize the age groups
my_data$agecat[my_data$age >= 45] <- "Elder"
my_data$agecat[my_data$age >= 26 & my_data$age <= 44] <- "Middle Age"
my_data$agecat[my_data$age <= 25] <- "Young"
my_data$agecat[is.na(my_data$age)] <- "Elder"
my_data

#change the agecat columsn to an ordinal factored column 
AgeCat <- factor(my_data$agecat, order = TRUE, levels = c("Young", "Middle Age", "Elder"))
AgeCat
my_data$agecat <- AgeCat

str(my_data)

#create summary column adding the q1 - q5 values
summary_col <- my_data$q1 + my_data$q2 + my_data$q3 + my_data$q4 + my_data$q5
summary_col

my_data <- data.frame(my_data, summary_col)
my_data

#same way as doing the above
my_data$summary_col2 <- my_data$q1 + my_data$q2 + my_data$q3 + my_data$q4 + my_data$q5
my_data

date_format <- "%b %d %Y"
today <- Sys.Date()
output_date <- format(today, format = date_format)
output_date

#display differences between to dates
startdate <- as.Date("2004-02-13")
enddate <- as.Date("2018-01-22")
days <- enddate - startdate
days

? difftime
dob <- as.Date("1984-08-04")
today

diff_dates <- difftime(today, dob, unit = "secs")
diff_dates

my_data
new_data <- my_data[order(my_data$age),]
new_data

new_data2 <- my_data[order(my_data$gender, my_data$age),]
new_data2

? order

#new_data3 <- na.omit(my_data)
new_data3

complete_data <- complete.cases(my_data)
complete_data <- my_data[complete.cases(my_data),]
complete_data

missing_data <- my_data[!complete.cases(my_data),]
missing_data

my_data
my_data$date <- as.Date(my_data$date, "%d-%m-%Y")
startdate <- as.Date("01/01/2018")
enddate <- as.Date("31/01/2018")
new_data <- my_data[(my_data$date >= startdate & my_data$date <= enddate),]
new_data
my_data

attach(my_data)
new_data <- subset(my_data, gender == "M" & age > 25, select = gender:q4)
new_data
my_data