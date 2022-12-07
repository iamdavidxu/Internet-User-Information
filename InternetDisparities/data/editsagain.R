library(readr)
edit <- att_total %>% select(state)
write_csv(edit, "name.csv")


ATT_price <- read.csv("data/speed_price_att.csv.gz")
#filter by selecting all the variables/columns that are used in B2 and B3 
#then delete the old csvs and this file