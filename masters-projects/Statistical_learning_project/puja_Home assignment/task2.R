# installing and using the required  libraries
install.packages("tidyverse")
library(tidyverse)

# Loading the given dataset
sto1 <- read.table("C:/Users/User/Downloads/92360.txt", header = TRUE)
sto1

# Checking the data structure
str(sto1)
# Checking the names of column presented in the dataset
colnames(sto1)

#Logistic Regression 2010
logit_model <- glm(Pellet_2010 ~ Distpow + Distroad + Distbig + Distgruva + Distsmall + 
                     SMDBLeav + SMDConi + SMDClear + SMDYoung + SMDMire + SMDLake + 
                     Aspect4Flat + Aspect4NE + Aspect4SE + Aspect4SW + Aspect4NW, 
                   data = sto1, family = "binomial")

# Summarizing the logistic regression model 2010
summary(logit_model)

#logistic regression 2009
logit_model2<- glm(Pellet_2009 ~ Distpow + Distroad + Distbig + Distgruva + Distsmall + 
                     SMDBLeav + SMDConi + SMDClear + SMDYoung + SMDMire + SMDLake + 
                     Aspect4Flat + Aspect4NE + Aspect4SE + Aspect4SW + Aspect4NW, 
                   data = sto1, family = "binomial")
## Summarizing the logistic regression model 2009
summary(logit_model2)


# Scatter plot for both years
ggplot(sto1, aes(x = Distpow, y = Pellet_2009, color = "2009")) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, aes(group = 1), color = "blue") +  # Add regression line for 2009
  geom_point(data = sto1, aes(x = Distpow, y = Pellet_2010, color = "2010")) +
  geom_smooth(data = sto1, method = "lm", se = FALSE, aes(group = 1), color = "red") +  # Add regression line for 2010
  labs(title = "Reindeer Habitat Usage vs. Distance from Power Grid",
       x = "Distance from Power Grid",
       y = "Pellet (Reindeer Habitat Usage)",
       color = "Year") +
  scale_color_manual(values = c("blue", "red")) +  # Setting the color for each year
  theme_minimal()
