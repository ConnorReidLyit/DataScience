
wd <- "c:/Users/Connor/Source/Repos/DataScience/Ni_Crime/Data/"
setwd(wd)
getwd()

csv_list <- list.files(path = wd, pattern = "*.csv", full.names = FALSE,)
csv_list

filename <- paste(wd, csv_list[1], sep = "")
filename


#function to import each csv file and bind them together into one dataframe
combine_results <- function(csv_list)
{
    all_ni_crime_data <- NULL
    for (file in csv_list)
        {
        my_data <- read.csv(header = TRUE, paste(wd, csv_list[file], sep = ""), stringsAsFactors = FALSE)
        all_ni_crime_data <- rbind(all_ni_crime_data, my_data)
        }
    return(all_ni_crime_data)
}
AllNICrimeData <- combine_results(csv_list)

str(AllNICrimeData)

write.csv(AllNICrimeData, "AllNICrimeData.csv")

getwd()