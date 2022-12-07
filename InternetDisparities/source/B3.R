

## DATA
## I pushed the cvs files on github repo, run the line and click on the file to read it :).


ATT_price <- read.csv("data/speed_price_att.csv.gz")
#att



## Packages

library("dplyr")
library("stringr")

## Code

ATT_price <- ATT_price %>%
  mutate(location = paste0(incorporated_place,", ", major_city , ", " , state))


data_in_nation <- ATT_price %>% 
  select(state , location, fastest_speed_down, fastest_speed_price , race_perc_non_white, ppl_per_sq_mile, median_household_income) %>% 
  group_by(state) %>% 
  filter(median_household_income > 0) %>% 
  summarise(location = unique(location) , 
            fastest_speed_down = mean(fastest_speed_down), 
            fastest_speed_price = mean(fastest_speed_price),
            race_perc_non_white = mean(race_perc_non_white),
            ppl_per_sq_mile = mean(ppl_per_sq_mile),
            median_household_income = mean(median_household_income)
            )
            
na.omit(data_in_nation)



## The data of mean Internet record on national level. The data is categorize by state.It includes the race percentage and redlining grade in contrast 
## to Internet speed which present the economic imbalance in different regions. 

## The actual table


