getwd()
wd <- "C:/Users/Connor/Documents/MSc Computing in Big Data Analytics/Data Science/Practical/Practical 4/NI Crime Data/"
setwd(wd)

folder_list <- list.dirs(path = wd, full.names = FALSE)
folder_list <- folder_list[2:length(folder_list)]

#function to import each csv file and bind them together into one dataframe
combine_results <- function(folder_list) {
    all_ni_crime_data <- NULL
    open_folder <- NULL
    for (folder  in folder_list) {
        open_folder <- paste(wd, folder, sep = "")
        setwd(open_folder)
        my_data <- read.csv(file = list.files(), header = TRUE, stringsAsFactors = FALSE)
        all_ni_crime_data <- rbind(all_ni_crime_data, my_data)
    }
    setwd(wd)
    return(all_ni_crime_data)
}

AllNICrimeData <- combine_results(folder_list)
str(AllNICrimeData)
write.csv(AllNICrimeData, "AllNICrimeData.csv")