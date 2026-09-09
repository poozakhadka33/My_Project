#libraries that are required are loaded
library(ggplot2)
library(readxl)

# Loading the given dataset
house_dt <- read_excel("C:/Users/User/Downloads/SwedishHouseholdDebt.xls")
house_dt
#summarizing the dataset
summary(house_dt)

## Performing linear regression
lm_model <- lm(debthhr ~ cpi, data = house_dt)
summary(lm_model)

# Plotting the regression line
plot(house_dt$cpi, house_dt$debthhr, main = "Relationship between CPI and Household Debt",
     xlab = "CPI", ylab = "Household Debt")
abline(lm_model, col = "red")

#recent household debt prediction (considering the recent CPI)
recent_CPI <- 3.5  # Replacing 3.5 with the recent CPI value
recent_debt <- predict(lm_model, newdata = data.frame(cpi = recent_CPI))
print(paste("Predicted recent household debt:", recent_debt))
