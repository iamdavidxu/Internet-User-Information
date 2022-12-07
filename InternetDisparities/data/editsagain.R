library(readr)
edit <- att_total %>% select(state)
write_csv(edit, "name.csv")


ATT_price <- read.csv("data/speed_price_att.csv.gz")
