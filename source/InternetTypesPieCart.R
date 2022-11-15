library(tidyverse)
install.packages("plotly")
library(plotly)

att <- read.csv("speed_price_att.csv")
att_other <- read.csv("speed_price_att_other_cities.csv")
att_total <- full_join(att, att_other)
century_link <- read.csv("speed_price_centurylink.csv")
earthlink <- read.csv("speed_price_earthlink.csv")
verizon <- read.csv("speed_price_verizon.csv")

all <- full_join(att_total, century_link) %>% 
  full_join(earthlink) %>% 
  full_join(verizon) %>% 
  filter(median_household_income > 0)

all_WA <- filter(all, state == "WA") %>% 
  filter(median_household_income < 250000)

fiber_in_state <- all %>% group_by(state) %>% 
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
                      labels = c("Copper", "Fiber", "Fiber Based", "Not Fiber")) +
  labs(title="Types of Internet Service Purchased")
pie_total

#figure out how to add this or at least show percentages
ggplotly(pie_total)