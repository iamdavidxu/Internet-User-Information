speed <- c(125.96640, 109.58667, 94.31361, 68.69142, 
           37.76891, 26.76897, 210.61320, 209.82366)

up_or_down <- c("down","up","down","up",
                "down","up","down","up")

provider <- c("AT&T","AT&T","Century Link",
              "Century Link","EarthLink","EarthLink",
              "Verizon","Verizon")

ISP_Speeds <- data.frame(speed,up_or_down,provider)
ISP_Speeds_plot <- ggplot(ISP_Speeds, aes(provider, speed, fill = up_or_down)) +
  geom_bar(stat="identity", position = "dodge") +
  labs(title="Upload and Download Speed By Provider") +
  xlab("Provider") + ylab("Internet Speed (Mbps)") +
  scale_fill_discrete(name = "Type of Speed", labels = c("Download", "Upload"))
ISP_Speeds_plot
#Why does plotly mess up the legend
ggplotly(ISP_Speeds_plot)
