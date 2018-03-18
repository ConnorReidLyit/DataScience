getwd()
setwd("C:/Users/Connor/Documents/MSc Computing in Big Data Analytics/Data Science/Practical")

#Create a Dataframe of the Daibetes data and review its structure
my_data <- read.csv("Diabetes-md.csv")
str(my_data)
class(my_data)

#Create more suitable column names and update the dataframe column headers
colnames(my_data) <- c("Patient_Name", "NI_Address", "Type", "Age", "Health_Status")
str(my_data)

#Identify the structure of the Type column and refactor it  
head(my_data$Type)
my_data$Type <- factor(my_data$Type, order = TRUE,  levels = c("Type 1", "Type 2") )
str(my_data$Type)

#Identify the structure of the Health_Status column and update refactor it from poor to excellent
head(my_data$Health_Status)
my_data$Health_Status <- factor(my_data$Health_Status, order = TRUE, levels = c("Poor", "Improved", "Excellent"))
str(my_data$Health_Status)

#Review the structure of the dataframe to show all changes 
str(my_data)

# Create a copy of the names attribute into a data frame called patient_names.
# Show the first 10 names contained in patient_names.
patient_names <- data.frame(my_data$Patient_Name)
head(patient_names, 10)
class(patient_names)

#Examine how many missing values are in the data frame my_data. Count this value
nrow(my_data) #show the number of rows of data prior to removing the NA values

sum(is.na(my_data)) # returns 20 NA as it does not count cells which are "blank"
my_data[my_data == ""] <- NA #update the "blank" cells to NA
sum(is.na(my_data)) #counts the total NA values after the "blank" values have been updated to NA

str(my_data) #review the dataframe to ensure there were no unintended consequences on converting the "" cells to NA

my_data <- na.omit(my_data) # remove all records with NA values from the dataframe

#Show number of rows after the NAs have been removed from the Dataframe
nrow(my_data)