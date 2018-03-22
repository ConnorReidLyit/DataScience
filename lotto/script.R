wd <- "C:/Users/Connor/Documents/MSc Computing in Big Data Analytics/Data Science/Practical/Practical 2/Lotto/"
setwd(wd)

temp <- read.csv("1999.csv")
str(temp)
head(temp, 5)


csv_file_list <- list.files(path = wd, pattern = "*.csv")
csv_file_list

#function to import each csv file and bind them together into one dataframe
combine_results <- function(file_list)
{
    lotto_data <-  NULL
    for (csv_file in file_list)
    {
        lotto_data_read <- read.csv(header = TRUE, paste(wd, csv_file, sep = ""), stringsAsFactors = FALSE)
        data_of_interest <- lotto_data_read[2:9]
        lotto_data <- rbind(lotto_data, data_of_interest)
    }
    return(lotto_data)
}

my_data <- combine_results(csv_file_list)
my_data

str(my_data)

