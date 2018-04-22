install.packages('rvest')
library(rvest)

url <- 'https://www.thefamouspeople.com/profiles/andrew-cunanan-5435.php'

web_page <- read_html(url)

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

Died_At_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(6)')
Died_At <- html_text(Died_At_html)
head(Died_At)
Died_At <- gsub('.*: ', "", Died_At)
Died_At <- as.numeric(Died_At)
str(Died_At)

Star_Sign_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(8)')
Star_Sign <- html_text(Star_Sign_html)
head(Star_Sign)
Star_Sign <- gsub('.*: ', "", Star_Sign)

Born_In_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(9)')
Born_In <- html_text(Born_In_html)
head(Born_In)
Born_In <- gsub('.*: ', "", Born_In)

DOD_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(10)')
DOD <- html_text(DOD_html)
head(DOD)

DOD <- gsub('.*: ', "", DOD)
DOD <- gsub(',', "", DOD)
DOD <- gsub(' ', '-', DOD)

#covert the Date of Birth to a Date data type
DOD <- as.Date(DOD, "%B-%d-%Y")
str(DOD)

Place_of_Death_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(11)')
Place_of_Death <- html_text(Place_of_Death_html)
head(Place_of_Death)
Place_of_Death <- gsub('.*: ', "", Place_of_Death)


Cause_of_Death_html <- html_nodes(web_page, '#idolize > div > div.fps-desc.fpf-block > p:nth-child(13)')
Cause_of_Death <- html_text(Cause_of_Death_html)
head(Cause_of_Death)
Cause_of_Death <- gsub('.*: ', "", Cause_of_Death)


data <- data.frame(AKA, Famous_As, Nationality, DOB, Born_In, Star_Sign, Died_At, DOD, Place_of_Death, Cause_of_Death, stringsAsFactors = FALSE)

head(data)
str(data)

#import the victims table from Wiki
url <- "https://en.wikipedia.org/wiki/List_of_serial_killers_by_number_of_victims"
victims <- url %>% #the %>% enables the input of several commands to be run at once
read_html() %>%
  html_nodes(xpath = '//*[@id="mw-content-text"]/div/table[2]') %>%
  html_table()

head(Victims)
str(Victims)










