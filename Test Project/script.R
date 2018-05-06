add_two_numbers <- function(no1, no2)
{
    result <- no1 + no2
    return(result)
}
add_two_numbers(3, 5)

my_list <- list(a = matrix(1:9, 3), b = 1:5, c = matrix(1:4, 2), d = 2)
sapply(my_list, sum)

first_list <- list(a = matrix(1:9, 3), b = 1:5, c = matrix(1:16, 2), d = 2)
second_list <- list(a = matrix(1:9, 3), b = 1:7, c = matrix(1:16, 8), d = 2)

simple_function <- function(first_list, second_list)
{
    result <- NROW(first_list) + NROW(second_list)
    return(result)
}

mapply(simple_function, first_list, second_list)

install.packages('dplyr')

swirl::install_course()
library(swirl)


