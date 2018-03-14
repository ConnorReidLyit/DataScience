#install.packages("swirl")
#library(swirl)
#install_course_zip("c:/swirl_courses-master.zip", multi = TRUE, which_course = "R Programming")
#swirl()

x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
y <- c(x, 0, x)
z <- 2 * x + y + 1
z

z <- c(1:3, NA);
result <- is.na(z)
result


vec1 <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Hurling", "Basketball", "Tennis", "Cricket", "Lacrosse")
vec2 <- c(vec1, "Hockey", "Lacrosse", "Hockey", "WaterPolo", "Hockey", "Lacrosse")
vec2_factor <- as.factor(vec2)
vec2