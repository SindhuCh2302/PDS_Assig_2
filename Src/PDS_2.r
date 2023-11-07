data <- read_csv("C:/Users/chsin/Downloads/train.csv")
head(data)
is.na(data)
#Here by the output we can see that the new price column has null values
is.na(data$New_Price)


#a) Replacing with mean value
data$New_Price = ifelse(is.na(data$New_Price),mean(data$New_Price,na.rm = TRUE),data$New_Price)
View(data)
summary(data)
#b)Removing kmpl from “Mileage”
data$Mileage <- sub(" kmpl", "", data$Mileage)
View(data)
#CC from “Engine
data$Engine <- sub(" CC", "", data$Engine)
View(data)
#bhp from “Power”
data$Power <- sub(" bhp", "", data$Power)
View(data)
#lakh from “New_price”
data$New_Price <- sub(" Lakh", "", data$New_Price)
View(data)
#c)
library(caret)
categorical_data <- data[, c("Fuel_Type", "Transmission")]
one_hot_encoded <- dummyVars(" ~ .", data = categorical_data)
data_encoded <- predict(one_hot_encoded, newdata = categorical_data)
head(data_encoded)
#d)
current_year <- as.numeric(format(Sys.Date(), "%Y"))
#calculating the current age
library(dplyr)
data <- data %>% mutate(Car_Age = current_year - Year)
View(data)
write.csv(data,"C:/Users/chsin/OneDrive/Desktop/cleandatapds2.csv")
