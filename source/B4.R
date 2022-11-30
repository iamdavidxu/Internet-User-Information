library(dplyr)
library(tidyr)
library(maps)
library(ggplot2)


#load us state map data
us_map <- map_data("state")

#rename region col to state
us_map <- us_map%>%
  rename(state = region)

#make base map
ggplot() + 
  geom_polygon(data = us_map, aes(x=long, y=lat, group=group),
               color="black", fill = "blue")

#load state disparities data (by major city only)
state_disparities <- read.csv("https://raw.githubusercontent.com/the-markup/investigation-isp/main/data/output/tables/table1_disparities_by_city.csv")

#convert column of state abb to state names
state_disparities$state <- state.name[match(state_disparities$state, state.abb)]

#convert to lowercase
state_disparities <- state_disparities %>% mutate(state = tolower(state))

#find % point difference in slow speed offers between historically D-rated and A/B-rated neighborhoods (in terms of redlining grade)
redlining_speed <- state_disparities%>%
  group_by(state)%>%
  summarize(redlining_pct_pt_diff = sum(redlining_pct_pt_diff))%>%
  select(state, redlining_pct_pt_diff)

#merge data
merged_disparities <- left_join(us_map, redlining_speed, by = "state")


#plot with merged
plot_choropleth <- ggplot()
plot_choropleth <- plot_choropleth + geom_polygon(data = merged_disparities, 
                                                  aes(x=long, y=lat, group=group, fill = redlining_pct_pt_diff), 
                                                  color="white", size = 0.2) +
  theme_minimal() +
  ggtitle("Percentage Point Difference of Lower Income Areas with Slower Internet Speeds")+
  labs(x = "Longitude", y = "Latitude", caption = "This is a choropleth map that displays the percentage point difference of lower income areas in major cities in each state with slow internet speeds.")+
  scale_fill_continuous(name="Percentage Point Difference of Lower Income Areas With Slow Internet", 
                        low = "lightblue", high = "darkblue",limits = c(-0.2, 0.5), 
                        breaks = c(-0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5), na.value = "grey")
