library(dplyr)
library(ggplot2)
library(tidyr)


##Pie chart for Low income

income_disparities <- read.csv("https://raw.githubusercontent.com/the-markup/investigation-isp/main/data/output/figs/fig3_income.csv")
#View(income_disparities)


#transpose file
transposed_income_disparities <- as.data.frame(t(income_disparities))

#rename columns
colnames(transposed_income_disparities) <- c('Low', 'Middle_lower', 'Middle_upper', 'Upper')

#delete redundant row
transposed_income_disparities <- transposed_income_disparities[!(row.names(transposed_income_disparities) %in% c("income_level", "No.service")),]

#create empty column
transposed_income_disparities$internet_speeds <- NA

#create vector of internet speeds
speeds <- c("Slow", "Medium", "Fast", "Blazing")

#add vector to data frame as a new col
transposed_income_disparities$internet_speeds <- speeds


#create pie chart for low income
ggplot(transposed_income_disparities, aes(x ="", y = Low, fill = internet_speeds)) +
  geom_col(color = "black") +
  geom_text(aes(label = Low),
      position = position_stack(vjust = 0.5))+
  coord_polar(theta = "y") 

#create pie chart for middle-lower income
ggplot(transposed_income_disparities, aes(x ="", y = Middle_lower, fill = internet_speeds)) +
  geom_col(color = "black") +
  geom_text(aes(label = Middle_lower),
            position = position_stack(vjust = 0.5))+
  coord_polar(theta = "y") 

#create pie chart for middle_upper income
ggplot(transposed_income_disparities, aes(x ="", y = Middle_upper, fill = internet_speeds)) +
  geom_col(color = "black") +
  geom_text(aes(label = Middle_upper),
            position = position_stack(vjust = 0.5))+
  coord_polar(theta = "y") 

#create pie chart for upper income
ggplot(transposed_income_disparities, aes(x ="", y = Upper, fill = internet_speeds)) +
  geom_col(color = "black") +
  geom_text(aes(label = Upper),
            position = position_stack(vjust = 0.5))+
  coord_polar(theta = "y") 


##This data visualization includes four pie charts that show the internet speed of households 
##based on their income level. There is one pie chart for lower income households, one for 
##middle-lower, one for upper-middle, and one for upper. We chose a pie chart for this visualization
##because it allows viewers to easily understand the disparities in internet speeds between household 
##income levels. Rather than a bar chart or scatterplot, a pie charts is the most visually appealing
##for this purpose so that the differing speed levels can be easily perceived. 
