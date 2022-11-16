
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


all_providers <- all %>% 
  filter(median_household_income < 250000) %>% 
  filter(median_household_income > 0) %>% 
  group_by(provider) %>% 
  summarize(speed_down = mean(speed_down, na.rm = TRUE),
            speed_up = mean(speed_up, na.rm = TRUE), 
            income = mean(median_household_income, na.rm = TRUE)) %>% 
  print()

all_providers_state <- all %>% 
  filter(median_household_income < 250000) %>% 
  filter(median_household_income > 0) %>% 
  group_by(state, provider) %>% 
  summarize(speed_down = mean(speed_down, na.rm = TRUE),
            speed_up = mean(speed_up, na.rm = TRUE), 
            income = mean(median_household_income, na.rm = TRUE)) %>% 
  print()



fiber_in_state <- all %>% group_by(state) %>% 
  count(tolower(technology)) %>% 
  na.omit()
  colnames(fiber_in_state) [2] <- "Internet_Type"

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

  
  #figure out how to add this
ggplotly(pie_total)



library(tidyverse)
install.packages("plotly")
library(plotly)

att_price_per_state <- att_total %>% group_by(state) %>% 
  summarize(price = mean(price, na.rm = TRUE)) 

att_total <- att_total %>% filter(median_household_income > 0)

y  <- plot(att_total$price, att_total$median_household_income)
print(y)


speed <- c(125.96640, 109.58667, 94.31361, 68.69142, 
           37.76891, 26.76897, 210.61320, 209.82366)
up_or_down <- c("down","up","down","up",
            "down","up","down","up")

provider <- c("ATT","ATT","CenturyLink",
                   "CenturyLink","EarthLink","EarthLink",
                   "Verizon","Verizon")

circle <- data.frame(speed, up_or_down,provider)
ggplot(circle, aes(provider, speed, fill = up_or_down)) +
  geom_bar(stat="identity", position = "dodge") +
  labs(title="Upload and Download Speed By Provider") +
  xlab("Provider") + ylab("Internet Speed (Mbps)") +
  scale_fill_discrete(name = "Type of Speed", labels = c("Download", "Upload"))






TRY AND GROUP THE INCOMES TOGETHER. LIKE GROUP EVERY 5000$ CUZ THEN THERE
WOULD BE LESS POINTS STACKED ON EACH OTHER


plot <- ggplot(data = all_WA) +
  geom_bar(mapping = aes(
    y = median_household_income
  ), color = "red", alpha = .1) +
  geom_bar(mapping = aes(
    x = price
  ), color = "blue", alpha = .1)
plot

plot <- ggplot(data = all_WA) +
  geom_col(mapping = aes(
    x = median_household_income,
    y = speed_down
  ), color = "red", alpha = .1) +
  geom_smooth(aes(
    x = median_household_income,
    y = speed_down
  ))
plot

bubble <- ggplot( data = all) + 
  geom_point(mapping = aes(
    x=median_household_income, 
    y=price
    ), alpha = 0.7) +
  scale_size(range = c(1.4, 19), name="X") 
bubble

plot <- ggplot(data = all) +
  geom_jitter(mapping = aes(
    x = median_household_income,
    y = price
  ), color = "red", alpha = .1) +
  geom_smooth(mapping = aes(
    x = median_household_income,
    y = price
  ))
plot

#better trendline
plot_zoomed <- ggplot(data = all) +
  geom_jitter(mapping = aes(
    x = median_household_income,
    y = price
  ), color = "purple", alpha = .1) +
  geom_smooth(mapping = aes(
    x = median_household_income,
    y = price
  )) +
  ylim(28, 75)
plot_zoomed

violin <- ggplot(data = all) +
  geom_violin(mapping = aes(
    x = median_household_income,
    y = price
  ))
violin

#Shows density pretty well
b <- ggplot(all, aes(
  x = median_household_income, 
  y = price
  ), color = "blue", linewidth = .5, na.rm = TRUE
  ) + geom_density_2d()
b
plotly(b)

b_WA <- ggplot(all_WA, aes(
  x = median_household_income, 
  y = price
), color = "blue", linewidth = .5, na.rm = TRUE
) + geom_density_2d()
B_WA <- plotly(b_WA)
B_WA

#this doesnt really work 
b_zoomed <- ggplot(all, aes(
  x = median_household_income, 
  y = price
)) + geom_density_2d() + 
ylim(55, 55)
b_zoomed


plot <- ggplot(data = all) +
  geom_line(mapping = aes(
    x = median_household_income,
    y = price
  ))
plot

#sort of shows density
plot <- ggplot(data = all) +
  geom_hex(mapping = aes(
    x = median_household_income,
    y = price
  ))
plot
plot <- ggplot(data = att_total) +
  geom_density2d(mapping = aes(
    x = median_household_income,
    y = price
  ), na.rm = TRUE)
plot
?geom_density2d
