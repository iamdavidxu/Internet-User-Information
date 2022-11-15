

## DATA
## I pushed the cvs files on github repo, run the line and click on the file to read it :).


ATT_price <- read.csv(file.choose())
#att
ATT_other_price <- read.csv(file.choose())
#attother
Centurylink_price <- read.csv(file.choose())
#centurylink
Earthlink_price <- read.csv(file.choose())
#earthlink
Verizon_price <- read.csv(file.choose())
#Verizon



## Packages

library("dplyr")
library("stringr")

## Code

ATT_price <- ATT_price %>%
  mutate(location = paste0(incorporated_place,", ", major_city , ", " , state))
  View(ATT_price)

  
locations_with_lowest_Redling_Grade_ATT <- ATT_price %>% 
  select(location, redlining_grade) %>% 
  filter(redlining_grade == min(redlining_grade , na.rm = TRUE)) %>% 
  summarise(location = unique(location))


===+=
lowest_speed_in_non_white_location_ATT <- ATT_price %>% 
  select(race_perc_non_white, speed_down, location) %>% 
  filter(race_perc_non_white == max(race_perc_non_white , na.rm = TRUE), 
         speed_down == min(speed_down , na.rm = TRUE)) %>% 
  summarise(location = (location) , 
            race_perc_non_white = (race_perc_non_white) , 
            speed = (speed_down))

table1_for_testing <- left_join(locations_with_lowest_Redling_Grade_ATT , lowest_speed_in_non_white_location_ATT)





data_in_la <- ATT_price %>% 
  select(state, major_city , location, fastest_speed_down, fastest_speed_price , redlining_grade, race_perc_non_white, ppl_per_sq_mile, median_household_income) %>% 
  filter(state == "LA", median_household_income > 0) %>% 
  group_by(major_city) %>% 
  summarise(location, fastest_speed_price, fastest_speed_down, redlining_grade, 
            race_perc_non_white = round(race_perc_non_white, 2), 
            ppl_per_sq_mile = round(ppl_per_sq_mile, 2),
            median_household_income)

na.omit(data_in_la)
View(data_in_la)

## This table analyze the Internet condition in LA. it includes the race percentage and redlining grade in contrast 
## to Internet speed which present the economic inbalance in different regions. 


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
View(data_in_nation)


## The data of mean Internet record on national level. The data is categorize by state. 

## The actual table


