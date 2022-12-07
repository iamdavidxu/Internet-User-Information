library(tidyverse)
library(plotly)

att <- read.csv("datacopy/speed_price_att.csv.gz")
att_other <- read.csv("datacopy/speed_price_att_other_cities.csv.gz")
att_total <- full_join(att, att_other)

all <- att_total %>% 
  filter(median_household_income > 0)

all_WA <- filter(all, state == "WA") %>% 
  filter(median_household_income < 250000)

fiber_in_state <- att_total %>% group_by(state) %>% 
  count(tolower(technology)) %>% 
  na.omit()
colnames(fiber_in_state) [2] <- "Internet_Type"

#do this for each state
fiber_in_state_WA <- fiber_in_state %>% filter(state == "WA")

pie_WA <- ggplot(fiber_in_state_WA, aes(x="", y=n, fill=Internet_Type)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  theme_void()
pie_WA

pie_total <- ggplot(fiber_in_state, aes(x="", y=n, fill= tolower(Internet_Type))) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  theme_void() +
  scale_fill_discrete(name = "Internet Type", 
                      labels = c("Copper", "Fiber", "Fiber Based")) +
  labs(title="Types of Internet Service Purchased")
pie_total

#figure out how to add this or at least show percentages

#ggplot_ly(pie_total)

build_pie <- function(data){
  pie_total <- ggplot(data, aes(x="", y=n, fill= tolower(Internet_Type))) +
    geom_bar(stat="identity", width=1) +
    coord_polar("y", start=0) +
    theme_void() +
    scale_fill_discrete(name = "Internet Type", 
                        labels = c("Copper", "Fiber", "Fiber Based")) +
    labs(title="Types of Internet Service Purchased Averaged Across All States")
  return(pie_total)
}

build_state_pie <- function(data, state.choice){
  data <- data %>% filter(state == state.choice)
  
  pie_state <- ggplot(data, aes(x="", y=n, fill=Internet_Type)) +
    geom_bar(stat="identity", width=1, color="white") +
    coord_polar("y", start=0) +
    theme_void() +
    scale_fill_discrete(name = "Internet Type", 
                        labels = c("Copper", "Fiber", "Fiber Based")) +
    labs(title="Types of Internet Service Purchased In a Certain State")
  return(pie_state)
}
