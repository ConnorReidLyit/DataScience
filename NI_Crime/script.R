
wd <- "c:/Users/Connor/Source/Repos/DataScience/Ni_Crime/Data/"
setwd(wd)
getwd()

#I removed 33 of the files to reduce the time taken to apply the postcode variable and to enable to upload to the Git
csv_list <- list.files(path = wd, pattern = "*.csv", full.names = FALSE,)
csv_list

#function to import each of the 3 csv file and bind them together into one dataframe

combine_results <- function(csv_list)
{
    all_ni_crime_data <- NULL
    for (csv in csv_list)
        {
        my_data <- read.csv(paste(wd, csv, sep = ""), header = TRUE, stringsAsFactors = FALSE)
        all_ni_crime_data <- rbind(all_ni_crime_data, my_data)
        }
    return(all_ni_crime_data)
}
AllNICrimeData <- combine_results(csv_list)

str(AllNICrimeData)
nrow(AllNICrimeData)
head(AllNICrimeData[1:5], 10)

attach(AllNICrimeData)
AllNICrimeData <- subset(AllNICrimeData, select = -c(Crime.ID, Reported.by, Falls.within, LSOA.code,
 LSOA.name, Last.outcome.category, Context))

str(AllNICrimeData)

table(Crime.type)
AllNICrimeData$Crime.type <- factor(Crime.type, levels = c("Anti-social behaviour", "Bicycle theft", "Burglary",
     "Criminal damage and arson", "Drugs", "Other Crime", "Other Theft", "Possession of weapons",
      "Public order", "Robbery", "Shoplifting", "Theft from the person", "Vehicle crime",
       "Violence and sexual offences"))

head(AllNICrimeData$Crime.type)


#Remove the unrequired text before the street name and convert the street names to upper case
AllNICrimeData$Location <- gsub("on or near ", "", Location, ignore.case = TRUE)
#if the street names are not upper case they will not match with the postcode data
AllNICrimeData$Location <- toupper(AllNICrimeData$Location)
head(AllNICrimeData$Location, 10)

#set our wd to the root folder againt to import the post code data file
setwd("c:/Users/Connor/Source/Repos/DataScience/Ni_Crime/")
CleanNIPostcodeData <- read.csv("CleanNIPostcodeData.csv", stringsAsFactors = FALSE)

install.packages("dplyr")
library(dplyr)

#using mappy to find the post frequest postcode for a street name and return that in the new postcode column added to the Nocrime data
AllNICrimeData$Postcode <- mapply(function(x) names(which.max(table(CleanNIPostcodeData$Postcode[x == CleanNIPostcodeData$Primary_Thorfare]))),
AllNICrimeData$Location)

head(AllNICrimeData, 10)

write.csv(AllNICrimeData, "AllNICrimeData.csv")
