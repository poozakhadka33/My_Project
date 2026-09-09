

#importing the data set freedman
library(read.csv)
Freedman <- read.csv("C:/Users/User/OneDrive/Desktop/Freedman.csv")
#viewing the data set
View(Freedman)

#task1:

# a) Creating a vector vec1
vec1 <- c(0, 2, 3, 0, 2, 11, 0, 7, NA)

# b) Creating a logical vector which incicates elements  that is equal to zero
logical_vector <- vec1 == 0

# c) Picking non-zero values and storing them in a  no_zero vector 
no_zero <- vec1[!logical_vector]

# d) Checking the number of non-zero values in vec1
non_zero_count <- length(no_zero)

# Printing the results
print(no_zero)
print(non_zero_count)
 


#task2: a)
# Defining the data that are present in the table
wage_data <- matrix(c(120, 122, 124, 130, 136, 140, 143, 150, 155,
                      109, 112, 115, 121, 128, 132, 135, 140, 148), 
                    ncol = 9, byrow = TRUE)

# Transposing the matrix to display the rows and columns as years and gender respectively
wage_data <- t(wage_data)

# Year and  GENDER vectors creation
YEAR <- rep(2003:2011, 2)
GENDER <- rep(c("Male", "Female"), each = 9)

# Creating  the data frame
df <- data.frame(W = as.vector(wage_data), YEAR = YEAR, GENDER = GENDER)

# Printing out the data frame
print(df)


#b)
# Exporting the .csv file for data frame 
write.csv(df, "wage_data.csv", row.names = FALSE)


#task 3: a)
# considering the Freedman.csv file is in my working directory
Freedman <- read.csv("C:/Users/User/OneDrive/Desktop/Freedman.csv")
Freedman <- read.csv("Freedman.csv")


# viewing the the structure of the imported data
str(Freedman)


#b)

# Summaring the data
summary(Freedman)

# viewing the Structure of the data
str(Freedman)

#c)
# Converting the numeric variables to numeric type
Freedman$population <- as.numeric(Freedman$population)
Freedman$nonwhite <- as.numeric(Freedman$nonwhite)
Freedman$density <- as.numeric(Freedman$density)
Freedman$crime <- as.numeric(Freedman$crime)


#d)


# Summary of the data
summary(Freedman)

# each cpulumn's Mean values without including City
mean_values <- sapply(Freedman[, -1], function(x) mean(x, na.rm = TRUE))
print(mean_values)


#e)
# Retrieving the rows with a non-white population larger than 30%
non_white_above_30 <- Freedman[Freedman$nonwhite > 30, ]
print(non_white_above_30)


#task 4: a)
# Installing the package 'car'if not installed
if (!requireNamespace("car", quietly = TRUE)) {
  install.packages("car")
}

# Loading the package  'car'
library(car)

# Loading the Prestige data frame
data("Prestige")

# Reading data through the help file 
?Prestige

#b)
# Selecting the data's subset a with more than 50% women
sub_prestige_women <- Prestige[Prestige$women > 50, ]

#c)
# Computing the average score of prestige for occupations with more than 50% women
avg_prestige_women <- mean(sub_prestige_women$prestige)
print(avg_prestige_women)

#d)
# choosing the data subset with less than 50% women
sub_prestige_men <- Prestige[Prestige$women < 50, ]

# Computing the average score of  prestige for occupations with less than 50% women
avg_prestige_men <- mean(sub_prestige_men$prestige)
print(avg_prestige_men)

#e)
# Getting unique types of occupations
occupation_types <- unique(Prestige$type)

# Vector for storing the means
mean_prestige <- numeric(length(occupation_types))

# using For-loop to compute mean prestige for every types of occupation
for (i in 1:length(occupation_types)) {
  occupation <- occupation_types[i]
  mean_prestige[i] <- mean(Prestige$prestige[Prestige$type == occupation])
}

# Printing out the means for every type of occupation 
print(mean_prestige)
