getwd()
wd <- setwd("C:/Users/Connor/Documents/MSc Computing in Big Data Analytics/Data Science/Practical/Practical 3")
list.files()

# 1. Import the data file review the structure and first 10 observations
my_data <- read.csv("NIPostcodes.csv", header = FALSE)
str(my_data)
head(my_data, 10)

#2.Show the total number and mean missing values of the NIPostcode data
?sapply
sapply(my_data, function(x) sum(is.na(x)))



# review the missing valaues from the data set
my_data[my_data == ""] <- NA
sum(is.na(my_data))
mean(is.na(my_data))

#Update column names and review the dataframe again
colnames(my_data) <- c("Orgaisation_Name", "Sub_Building_Name", "Building_Name", "Number", "Primary_Thorfare", "Alt_Thorfare", "Secondary_Thorfare", "Locality", "Townland", "Town", "County", "Postcode", "x-coordinates", "y-coordinates", "Primary_key")
head(my_data, 10)
str(my_data)