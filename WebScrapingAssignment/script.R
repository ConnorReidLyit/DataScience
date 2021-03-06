install.packages('rvest')
library(rvest)

url <- 'https://www.thefamouspeople.com/profiles/andrew-cunanan-5435.php'

web_page <- read_html(url)
?read_html

#scrape the Also Known As information from the website. The inspect function in chrome was used to find the element needed
AKA_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(2)')
#converting the HTML to text
AKA <- html_text(AKA_html)
head(AKA)
#Removing unrequired text from the AKA field - we will remove everything before the comma and space (inclusive of the comma and space)
AKA <- gsub('.*: ', "", AKA)
head(AKA)


#scrape the Famous As text from the web page
Famous_As_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(3)')
#convert the html to text
Famous_As <- html_text(Famous_As_html)
#remove the unrequired text from the variable
Famous_As <- gsub('.*: ', "", Famous_As)
head(Famous_As)

#scrape the Nationality of the serial killer from the website
Nationality_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(4)')
#convert the html to text and remove the unrequired text per steps above
Nationality <- html_text(Nationality_html)
#Remove the unrequired text
Nationality <- gsub('.*: ', "", Nationality)
head(Nationality)


#read the date of birth html information
DOB_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(5)')
#contert the DOB to text
DOB <- html_text(DOB_html)
head(DOB)
#remove the unrequired text
DOB <- gsub('.*: ', "", DOB)
DOB <-gsub(',', "",DOB)
DOB <- gsub(' ', '-', DOB)
#covert the Date of Birth to a Date data type
DOB <- as.Date(DOB, "%B-%d-%Y")
str(DOB)

#read the Died At html information
Died_At_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(6)')
#convert the Died at to readable text
Died_At <- html_text(Died_At_html)
head(Died_At)
#drop the unrequired text from the information and convert to a number
Died_At <- gsub('.*: ', "", Died_At)
Died_At <- as.numeric(Died_At)
str(Died_At)

#read the star sign html information
Star_Sign_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(8)')
#convert the Star Sign to readable text and remove the unrequired characters
Star_Sign <- html_text(Star_Sign_html)
head(Star_Sign)
Star_Sign <- gsub('.*: ', "", Star_Sign)

#read the Born In html information
Born_In_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(9)')
#convert the information to readable text and remove the unrequired characters
Born_In <- html_text(Born_In_html)
head(Born_In)
Born_In <- gsub('.*: ', "", Born_In)

#read the date of death html information
DOD_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(10)')
DOD <- html_text(DOD_html)
head(DOD)

#remove the unrequired text
DOD <- gsub('.*: ', "", DOD)
DOD <- gsub(',', "", DOD)
DOD <- gsub(' ', '-', DOD)

#covert the Date of Death to a Date data type
DOD <- as.Date(DOD, "%B-%d-%Y")
str(DOD)


#read the Place of Death html information
Place_of_Death_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(11)')
#convert the information to readable text and remove the unrequired characters
Place_of_Death <- html_text(Place_of_Death_html)
head(Place_of_Death)
Place_of_Death <- gsub('.*: ', "", Place_of_Death)

#read the Cause of Death html information
Cause_of_Death_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(13)')
Cause_of_Death <- html_text(Cause_of_Death_html)
head(Cause_of_Death)
Cause_of_Death <- gsub('.*: ', "", Cause_of_Death)

#Create a dataframe from the information collected 
data <- data.frame(AKA, Famous_As, Nationality, DOB, Born_In, Star_Sign, Died_At, DOD, Place_of_Death, Cause_of_Death, stringsAsFactors = FALSE)

#review the dataframe and structure
head(data)
str(data)

#import the victims table from Wiki
url <- "https://en.wikipedia.org/wiki/List_of_serial_killers_by_number_of_victims"
victims <- url %>%  #the %>% enables the input of several commands to be run at once similar to a console command line
read_html() %>%
  html_nodes(xpath = '//*[@id="mw-content-text"]/div/table[2]') %>%
  html_table()

head(victims)
str(victims)

url2 <- "https://en.wikipedia.org/wiki/List_of_serial_killers_by_number_of_victims"
table_html <- read_html(url2)

#To add a table we need to copy the xpath instead of the selector from the elements window
table_data <- html_nodes(table_html, xpath = '//*[@id = "mw-content-text"]/div/table[2]')

#html_table is used to coerce the data into a table
table_data <-html_table(table_data)

head(table_data)
str(table_data)