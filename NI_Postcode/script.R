getwd()
wd <- setwd("C:/Users/Connor/Documents/MSc Computing in Big Data Analytics/Data Science/Practical/Practical 3")
list.files()

# 1. Import the data file review the structure and first 10 observations
my_data <- read.csv("NIPostcodes.csv", header = FALSE, stringsAsFactors = FALSE)
str(my_data)
head(my_data, 10)

#Update column names and review the dataframe again
colnames(my_data) <- c("Orgaisation_Name", "Sub_Building_Name", "Building_Name", "Number", "Primary_Thorfare", "Alt_Thorfare", "Secondary_Thorfare", "Locality", "Townland", "Town", "County", "Postcode", "x-coordinates", "y-coordinates", "Primary_key")
str(my_data)
head(my_data, 10)

# replace the empty observations in the variables with NA. Count and mean the number of missing vairables
my_data[my_data == ""] <- NA
sum(is.na(my_data))
mean(is.na(my_data))

head(my_data$County)

my_data$County <- factor(my_data$County, levels = c("ANTRIM", "ARMAGH", "DOWN", "FERMANAGH", "LONDONDERRY", "TYRONE"))
my_data <- my_data[order(decreasing = FALSE, my_data$County),]
str(my_data$County)
head(my_data$County)

#Putting the primary key variable first
my_data <- my_data[, c(15, 1:14)]
str(my_data)
head(my_data)


#Create a new dataset called Limavady_data. Store within it only information that has locality, 
#townland and town containing the name “Limavady”. 
#Store this information in an external csv file called Limavady.
limavady_data <- subset(my_data, grepl("LIMAVADY", my_data$Locality) & grepl("LIMAVADY", my_data$Townland) & grepl("LIMAVADY", my_data$Town))
str(limavady_data)
head(limavady_data)
write.csv(limavady_data, "Limavady.csv")

#CleanNIPostcodeData.
write.csv(my_data, file = "CleanNIPostcodeData.csv")