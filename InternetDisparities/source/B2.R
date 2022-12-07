

## DATA
## I pushed the cvs files on github repo, run the line and click on the file to read it :).

ATT_price <- read.csv("data/speed_price_att.csv.gz")



## Packages
library("tidyverse")

## Summary

Variables_ATT <- ncol(ATT_price)

Observations_ATT <- nrow(ATT_price)

Max_download_speed_ATT <- ATT_price %>% 
  select(speed_down) %>% 
  filter(speed_down == max(speed_down, na.rm = TRUE)) %>% 
  pull(speed_down)

Max_upload_speed_ATT <- ATT_price %>% 
  select(speed_up) %>% 
  filter(speed_up == max(speed_up , na.rm = TRUE)) %>% 
  pull(speed_up)




ATT_price <- ATT_price %>%
  mutate(location = paste0(incorporated_place,", ", major_city , ", " , state))



locations_with_lowest_Redling_Grade_ATT <- ATT_price %>% 
  select(location, redlining_grade) %>% 
  filter(redlining_grade == min(redlining_grade , na.rm = TRUE)) %>% 
  summarise(location = unique(location))



lowest_speed_in_non_white_location_ATT <- ATT_price %>% 
  select(race_perc_non_white, speed_down, location) %>% 
  filter(race_perc_non_white == max(race_perc_non_white , na.rm = TRUE), 
         speed_down == min(speed_down , na.rm = TRUE)) %>% 
  summarise(location = unique(location) , 
            race_perc_non_white = unique(race_perc_non_white) , 
            speed = unique(speed_down))

Income_ATT <- ATT_price %>% 
  mutate(location = paste0(ATT_price$major_city , ", " , ATT_price$state)) %>% 
  summarise(location, income_dollars_below_median, price) %>% 
  na.omit()

  poor_families <- Income_ATT %>% 
  filter(income_dollars_below_median < 0 , price > 54) %>% 
  summarise(income_dollars_below_median)
  
count<- nrow(poor_families)

