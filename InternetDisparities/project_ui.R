#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)
library(maps)
library(scales)
library(plotly)


race_slider <- sliderInput("race_perc", "Range of Percentage of Non-white People in an Area",
            min = 0, max = 1,
            value = c(0, 1)
)

state_chose <- selectInput(
  "state.choice",
  label = "State",
  choices = list(
    "AL" = "AL", "AR" = "AR", "CA" = "CA", "FL" = "FL", "GA" = "GA", 
    "IL" = "IL", "IN" = "IN", "KS" = "KS", 
    "KY" = "KY", "LA" = "LA", "MI" = "MI", "MO" = "MO", "MS" = "MS", 
    "NC"  = "NC", "OH" = "OH", "OK" = "OK", 
    "SC" = "SC", "TN" = "TN", "TX" = "TX", "WI" = "WI"
  )
)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(theme = shinytheme("superhero"),
  
  navbarPage("Internet Information", 
             tabPanel("Introduction",
                      sidebarLayout(
                        sidebarPanel(
                          h1("Introduction"),
                          p("For this project we plan on exploring the relationship between internet service speed and prices in different areas across the United States, and how different internet service providers redline certain areas to essentially price-gouge lower income areas."),
                          p("During the Covid-19 pandemic, people were forced to remain online for a much more extensive amount of time than ever before, and this lead to internet service providers increasing prices to maximize profits.
                          Lower-income areas often have high prices for low internet speeds, something that is completely unnecessary and only goes to further the socioeconomic differences in major cities and the United States as a whole.
                          The data we are using for this project is hosted on Kaggle and has three data files with information primarily on AT&T, as well as a summary file with specific demographic breakdowns of areas.
                          We will compare the data for AT&T across the country to determine which areas are experiencing the most Internet Redlining."),
                          p("Some questions we are exploring include:"),
                          p("Do internet service providers charge more for internet based on race and/or income?"),
                          p("What types of Internet are most often used, and what are the implications of usage of those types?"),
                          p("How are different areas across the country impacted by internet redlining practices?")
                        ),
                        mainPanel(
                          img(src = "https://mrkp-static-production.themarkup.org/uploads/2022/10/isp_main-841x473.jpg", height = 500, width = 800)
                          
                          )
                      )
                      
              ),
             tabPanel("Cost",
                      sidebarLayout(
                        sidebarPanel(
                          race_slider
                        ),
                        
                        mainPanel(
                          h1("Cost of Internet Related to Race and Income"),
                          plotOutput("race_scatter"),
                         p("This data visualization takes into account multiple aspects of our dataset:
                             the percentage of non-white people living in the recorded area, the income 
                           of those people, and the amount of money that they are paying for their internet. 
                           The interactive aspect, the ranger slider to the left, allows users to investigate 
                           the economic differences between groups with specific amounts of ethnicity to determine 
                           for themselves if internet service providers (ISPs, in this case specifically AT&T) 
                           potentially upcharge people who live in areas with a smaller white population."),
                         h3("Our Findings"),
                         p("There is too much data (which was poorly collected and is clearly generalized) 
                           to really discern whether or not AT&T charges people more money for internet based 
                           on the racial makeup of the place they live, however this visualization does show a 
                           strong correlation between the price and percentage of non-white people in the area 
                          ", strong(" as well as "), "people who are living significantly below the average income for their area."),
                         p("If we completely neglect the colors that describe the price of internet, we see that this 
                           graph also demonstrates a much stronger correlation between the average income and race makeup 
                           of a certain area. That in itself is completely seperate from anything related to an 
                           Internet Service Provider, but the it is nonetheless a problem in the United States. ")

                         
                        )
                      )
             ),
             tabPanel("Type",  
                      sidebarLayout(
                        sidebarPanel(
                          state_chose,     
                          plotOutput("pie_chart_state")
                    
                        ),
                        
                        mainPanel(
                          h1("Types of Internet Purchased From AT&T"),
                          plotOutput("pie_chart"),
                          p("This chart shows the most popular types of internet purchased from AT&T. 
                            This chart specifically combines all the states that we have data for. 
                            As you can see, copper is the least purchased type of internet by AT&T 
                            users and fiber and fiber-based internet is", strong(" significantly "), "more purchased. 
                            The differences between the types of internet are clear: copper is cheaper, has 
                            lower speeds, and has to be replaced/fixed more often compared to fiber internet 
                            which is more expensive but has faster speeds and less maintenance."),
                          h3("Environmental and Money Implications of This Data"),
                          p("'Not only does fiber offer consumers the fastest possible internet speeds, 
                          but it's also better for the environment than most copper broadband. 
                          It uses more sustainable materials, has a smaller carbon footprint and reduces 
                          waste and pollution.'"),
                          tags$div(
                            "This quote is cited from the ",
                            tags$a(href="https://blog.frontier.com/2022/09/how-does-choosing-fiber-internet-
                                   benefit-the-environment/#:~:text=Not%20only%20does%20fiber%20offer,and%20
                                   reduces%20waste%20and%20pollution.", 
                                   "Frontier Blog")
                          ),
                          p("By interacting with the chart on the left, the chart will change to show which 
                            types of internet are purchased the most in the chosen state. This interactive 
                            visualization shows us that some states purchase copper much more than others, 
                            possibly meaning that the state is not as financially stable and must choose the 
                            cheaper option, or it could be that the state’s internet is out-of-date and the 
                            most current and best internet (fiber) is not available. This also allows us to 
                            see which states’ internet is having the worst impact on the environment. For example, 
                            Louisiana has the worst impact on the environment all for internet, because a very 
                            small percentage of the population has fiber, more have fiber-based which is better 
                            than copper, but still not as safe as pure fiber internet and the majority have copper 
                            internet, the cheapest but worst available option.")
                        )
                      )
             ), 
             tabPanel("Redlining",
             
                      sidebarLayout(
                        sidebarPanel(
                         
                          sliderInput("redlining_pct_pt_diff", "Redlining % Point Difference",
                                      min = -0.2, max = 0.5,
                                      value = c(-0.2, 0.5),
                          ),
                          #plotlyOutput("redlining_slider")
                          
                        ),
                        mainPanel(
                          h1("Internet Redlining by State"),
                          plotlyOutput("redlining_map"),
                          p("This data visualization includes a choropleth map that displays the percentage point 
                            difference of lower income areas across the country with slower internet speeds. 
                            This chart allows users to visualize the overall impacts of internet redlining across the 
                            country through a scale of redlining grades represented by varying shades of blue. 
                            A lighter shade of blue represents less internet redlining, whereas a darker shade 
                            represents a higher level of internet redlining and grey represents areas where the data 
                            was NA.")
                        )
                
                      ),
                      
                     
             ), 
             tabPanel("Summary", 
                      sidebarLayout(
                        sidebarPanel
                        (
                        h1("Summary Takeaways")
                        ),
                      mainPanel(
                        plotlyOutput("speed_chart"),
                        p("This chart is a bar chart that, based on who the provider is, shows the 
                          average upload and download speed across all the data we have. This chart is 
                          also interactive, when you hover over each column, you can see the exact upload 
                          and download speed. This chart allows users to see which Internet Service Providers 
                          (ISPs) have the fastest average internet."),
                        h4("Here is the mean data of AT&T group by state."),
                        tableOutput("md"),
                        h4("Location with the lowest Internet Redlining grade."),
                        tableOutput("lrg"),
                        h4("The lowest speed of internet service provided in non-white areas by AT&T"),
                        tableOutput("lsn"),
                        h4("Families that receives below average wage and maximun Internet price."),
                        textOutput("fam"),
                        h6("Percentage =", round(158422/432303), 2)
                        
                      )
                    )
              ),
             tabPanel("Report Page",
                      sidebarLayout(
                        sidebarPanel
                        (
                          h1("Report")
                        ),
                        mainPanel(
                          h2("Internet Service Inequality"),
                          h3("AT&T Internet Service Analysis"),
                          h4("Neha Venkatesh, ", em("nehav22@uw.edu"),", 
                             Aidan Bartlett ",em("aidanb04@uw.edu"),",
                             David Xu ", em("bingsen@uw.edu"),"
                            "),
                          h4("INFO-201:Technical foundations of Informatics - The Information School - University of Washington"),
                          h4("Autumn 2022"),
                          h2("Abstract"),
                          p("Our main question is 'How do internet service providers contribute to socioeconomic disparities?‘ 
                            We are interested in answering this question to explore the effects of practices like redlining 
                            and upcharging by internet service providers, specifically AT&T. To address this question, we will 
                            investigate the relationships between internet speeds and service prices, and the relationships 
                            between the price of internet and the race makeup and income of certain areas."),
                          h2("Keywords"),
                          p("Internet, Redlining, Income distributions, Regression, Exploratory data analysis, Upcharging"),
                          h2("Introduction"),
                          p("For this project we plan on exploring the relationship between internet service speed and prices in different areas across the United States, and how different internet service providers redline certain areas to essentially price-gouge lower income areas. During the Covid-19 pandemic, people were forced to remain online for a much more extensive amount of time than ever before, and this lead to internet service providers increasing prices to maximize profits. Lower-income areas often have high prices for low internet speeds, something that is completely unnecessary and only goes to further the socioeconomic differences in major cities and the United States as a whole.  The data we are using for this project is hosted  on [kaggle](https://www.kaggle.com/datasets) and has five data files with information on four different internet service companies. We will compare the companies to determine which are being the most equitable, and which should be held accountable for the situations they are creating."),
                          h2("Problem Domain"),
                          p("Background: 
                             The appearance of Covid-19 led to a great number of issues in society, both economically, patricianly, and socially. Accordingly to the article “New data shows long Covid is keeping as many as 4 million people out of work” by Katie Bach in 2022 from Pew Brookings, the virus significantly shrinks the economy and causes people to rely on technology and the Internet.1 This increase in demand accordingly increases the providence of internet services. In the dataset “Internet Service Offers” created by Leon Yin and Aaron Sankin, we can see the address and internet speed of over a million houses serviced in the US, and this is only a portion of the overall services provided during the pandemic.4 This great amount of demand and increase in internet service, however, brought out the existing economic and social inequality. It appears that the majority of the population receiving good internet services are white and high-income groups. In the contrast, the lower-income group and non-white population tend to receive slower or no internet access. As the economy deteriorates during the pandemic, the employment rate decreased greatly and the demand for working remotely increased. This stimulates people to choose better service plans with faster speed and conditions. However, lower-income groups usually don’t have the access to ‘blazing’ internet speed due to financial issues. It appears that the location and different regions people live in also influence the service they get. As major cities have faster internet, rural areas or not developed regions use slower options. The authors utilized multiple variables to sort and distribute the data they collected. Mainly focusing on races and ethnicities, speeds, redline areas, and income. Through using these categories, the readers are able to understand the inequality distribution more directly and clearly. 

                             Direct and indirect stakeholders:
                             The users of the internet services are mostly students or working classmen. Therefore the direct stakeholders for this information will be people who need internet access and use technology devices regularly. The assumption is that they have basic skills in computing and using electronic devices. They are likely to use the internet for working, learning as well as communication. While there could be many values stakeholders hold, the major ones are likely to be benefiting others, creating better solutions, and so on. The indirect stakeholders can be the government and business owners. The federal sometimes proposes policies that assist people in need with the internet. One of the programs created in 2021 is the Affordable Connectivity Program.2 According to the official website of the Federal Communication Commission and the article “Yes, FCC Affordable Connectivity Program’s $30 discount is real” by Emery Winter in August 2021, the government provides discounts on internet services to assist the lower-income population. Business owners' profits could be influenced by the accessibility of the internet. 

                             Human Values:
                             The social inequality presented through the data is not only an economical issue but an ethical problem. It has been shown that racism is also a factor that creates the social and economic gap and tension between different communities. 3Accordingly to the article “U.S. labor market inches back from the COVID-19 shock, but recovery is far from complete” by Rakesh Kochhar and Jesse Bennett from Pew Research Center,  there is discrimination towards different gender as well as identity. It is crucial for us to address these problems and prevent them from deteriorating relationships between different groups. 

                             Potential benefits and Harms:
                             The benefits of using this dataset are to analyze the service in different areas to create better solutions and records of the social status. These data could be very beneficial for providing useful information. It could be used to create solutions and improve people’s standards, in addition to accessibility to the internet. The potential harm this dataset might cause could be increasing the tension between the high and low-income groups. The publication of this information could lead to dissatisfaction or discrimination which will both create damage to society. (Sustain ‘Friendship’ in the envisioning card)

                             Influence on other fields:
                             This dataset can be used in political studies, social studies, and many other fields. When preparing for elections or political events, this data could be a good reference for creating promotion strategies to gather votes. It could also be used by the government to determine which area to develop in the future."),
                          h2("Research questions"),
                          p("1. Do internet service providers charge more for internet based on race and/or income?"),
                          
                          p("2. What types of Internet are most often used, and what are the implications of usage of those types?"),
                          
                          p("3. How are different areas across the country impacted by internet redlining practices?"),
                          
                          h2("The Dataset"),
                          p("Our dataset summarizes the disparities in internet service speeds and prices in different neighborhoods based on racial and economic makeup as well as redlining status. The connections presented in these datasets inform us on how big-name internet service providers disproportionately offer slower internet services to lower-income, BIPOC communities for the same price as faster services in higher-income communities with more white populations."),
                            
                          p("As a nonprofit organization, ", em("The Markup") , "conducts its investigations through funds collected from readers as well as various donors. They have a list of organizations which support their work, which can be viewed "),
                            tags$div("Here on their website",href="https://themarkup.org/donors")
                            ,
                          p( em("The Markup") , "describes their mission as investigating how technology influences our society, utilizing data science and computational methods to unveil secrecy around big tech, and rebuild trust in journalism. The money they collect goes toward building this nonprofit newsroom to “serve the public”, through openly publishing their methods and encouraging people of all backgrounds to engage with their findings. "),

                          p("Whereas previous studies around internet access relied on data from the Federal Communications Commission, Sankin and Yin looked to an information source called the “broadband availability tools” (located in service provider’s own websites) to collect their data. They discovered that companies were exaggerating where they offered service to the FCC, therefore making data collected by the FCC unreliable. Sankin and Yin then used two open-source datasets to gather over 12 million addresses, organized them based on Census block groups, and used a stratified sampling method to collect a representative sample of the speed and price of offers for each city and internet service provider. They then grouped offers into four speed categories for both download and upload — “Slow”, “Moderate”, “Fast”, and “Blazing”. For income distributions, the team collected the median incomes for block groups, and classified them as “lower”, “middle-lower”, “middle-upper”, or “upper”. For race and ethnicity distributions, they categorized addresses as “least White”, “less White”, “more White”, and “most White”. For redlined areas, Sankin and Yin used the University of Richmond’s"),
                            tags$div("Mapping inequaility Porject",href = "https://dsl.richmond.edu/panorama/redlining/#loc=5/39.1/-94.58&text=intro ")
                            ,
                          p("To avoid nonrepresentative results, the team took the COVID-19 pandemic into consideration when collecting data for income distributions. Though the",strong ("American Community Survey") ,"had data from 2020 available, they chose to use the data from 2019 instead to produce more accurate results. Sankin and Yin also addressed any limitations their data may have regarding their information sources and data collection methods."),
                          p("We found this dataset through" ,em("Kaggle")," a community repository with numerous datasets organized into various categories. Though this dataset has been reshared on ", em("Kaggle"), "it was originally hosted by The Markup on", em("Github"), "which we credit as the source of our data."),

                          h2("Expected Implications"),
                          p("By answering our proposed research questions, we will have a much better understanding of to what extent internet service providers are manipulating prices unnecessarily in places where they know they can get away with it, which increases the socioeconomic seperation between class groups, which reinforces stereotypes and thoughts about certain areas in the United States such as redlining. We will be able to know whether or not internet service providers should be held partially responsible for maintaining the notion that redlined areas are somehow 'worse' than other areas close by. Policy makers could use this data to potentially hold internet service providers accountable for price-gouging people in lower income areas. Urban designers could use this information to design areas similar to internet cafes in places where the internet is cheaper, where people who live in the redlined expensive areas can go to and use the internet at a more affordable rate. A technological possibility would be to create a service which would act as a VPN so people in redlined areas could simply purchase their internet at a cheaper rate, as if they lived across town in a non-redlined area."),
                          
                          h2("Limitations"),
                          p("One limitation that will need to be addressed in some way is the fact that there are a large number of NULL values in the redlining_grade column of each csv file. The NULL percentages of the redlining_grade for each file are as follows: att has a 57%, att_other_cities has a 44%, centurylink has a 70%, earthlink has a 60%, and verizon has a 25%. Since this column of data is important for the conclusions that we are trying to make, much of the data will need to be excluded by na.rm = TRUE so we are able to actually work with our dataset and come to some kind of conclusion. A technological limitation that we also currently have is that we would like to make an interactive data visualization using maps and the data, but we simply do not know how to code that yet. We will work on learning more about how to actually build interactove data visualizations, but currently that is a limitation that will impact how useful our report is."),
                          h2("Findings"),
                          p("1.  Since the dataset does not contain much information about the Seattle area, it is hard to analyze which region has the worst Internet service. However, through analyzing the data from Los Angles, California, which is also west coast state, we can see an obvious trend that non-white areas receive slower internet speed. While these regions usually have a higher population, they somehow receive higher charges for internet services. By analyzing the people per mile, speed price, and income variables. It is clear that inequality is significantly affecting many families in California."),
                          p("2. As high-income classes receive more access to faster internet, poorer communities tend to receive slower internet. It is also shown that white people usually enroll in higher-income jobs while the non-white population receives lower wages. These ideas have also been reflected in the data collected. The data also shows non-white population tends to receive income less than the medium value in the state, white regions with higher white percentage appears to have more income much higher than average."),
                          p("3. Since people weren’t able to afford bills, rural areas or regions with poor conditions couldn’t receive internet access. Thus creating an imbalance between different areas. This gap continues to increase as wealthier become richer and the poor remains poor. It appears that the gap will continuously expand if no further action is taken. This information has also been presented in the dataset, the researchers use redlines to separate regions with different economic conditions. The accessibility to the Internet thus becomes a problem. "),
                          p("4. This dataset will help with seeing if internet service companies do their own sort of redlining where they know they can drive up prices and people will still pay them; for example, if they know they can inflate prices in rural areas since there are no other options. It will be interesting to see if the areas with less internet company competition have higher prices than places where there are more options for internet. It turns out that rural areas do charge higher for Internet speed and cities with lower redlining grade causes the price to be higher as well. While the areas that are less competitive receive higher Internet bills, they also need to use slower internet speeds due to the lack of sufficient development in some areas."),
                          h2("Discussions"),
                          p("Our analysis implies the inequality between different social groups and locations. The dataset we choose presents the Internet Service condition from different providers. Since the data is too big to analyze we focus mainly on the service AT&T. The data contains multiple variables including ethnicity in the service area, Internet upload and download speed, redlining grade, and so on. Ever since Covid started, the demand for Internet services increases while the economic condition decreases. Therefore the economic gap between higher and lower classes expanded which causes the imbalance distribution of Internet services.  This is a very large issue that is outside the scope of our research and data, but we have done enough research to have realized that to some degree, Internet Service Providers like AT&T does charge more money to people they know cannot afford it, but still rely on it. ISPs put these people in a chokehold because they know everyone needs the internet, and there is nothing to stop them from doing so. We are only able to draw conclusions about the data that we observed, but we would like our readers to come to their own conclusions about the ethicality of these internet companies, and ponder the question, of whether people are charged extra just for the internet, what else are they charged more for? This overcharging of people in poverty and the racist price gouging tactics employed by large companies are one of the many reasons why people in poverty often stay in poverty, and why minorities are more likely to have an income below the average for their area. Through exploring and conspiring the materials used in the internet wires, we found out that most of the lower-income communities received copper as the major source. According to reliable research, copper will express harmful particles that reduce people’s health and shorten their life. While this might be an efficient money-saving method for internet companies, this treatment greatly affected people’s health in lower income classes. On the contrary, higher-income regions receive more stable and efficient materials such as Fiber. This comparison has shown how the economic gap affects people’s living standards. In addition to the fact that this gap is continuously expanding due to the pandemic and growing unemployment."),
                          h2("Conclusion"),
                          p("As the economy deteriorates during the pandemic, the employment rate decreased greatly, and the demand for working remotely increased. This stimulates people to choose better service plans with faster speed and conditions. However, lower-income groups usually don’t have the access to ‘blazing’ internet speed due to financial issues. It appears that the location and different regions people live in also influence the service they get. As major cities have faster internet, rural areas or not developed regions use slower options. The authors utilized multiple variables to sort and distribute the data they collected. Mainly focusing on races and ethnicities, speeds, redline areas, and income. Through using these categories, the readers are able to understand the inequality distribution more directly and clearly. While the wealthier become richer, the poor remain poor. The accessibility to Internet service is also a factor we considered during the data analysis. We discovered that rural areas receive relatively slower Internet than urban regions. While a possible factor could be the undeveloped technology, the financial differences are the main factor that leads to this issue. Also indicated the imbalance distribution of Internet service, showing the unequal treatment towards different social classes. These data could be very beneficial for providing useful information. It could be used to create solutions and improve people’s standards, in addition to accessibility to the internet. From the summary takeaway page, we can see that the regions with more non-white populations receive slower Internet than others. Meanwhile, their Internet speed and price ratio are not as efficient as the location that has a higher white percentage. It is also clear that wealthy people tend to receive better Internet services at lower prices, while low-income groups receive worse Internet services at higher prices. As the data imply, inequality is becoming a more usual problem in the US since the pandemic. Internet service disparities are not the only factor in this issue, instead, the increasing economic and social deterioration is caused by a series of events including police abuse, education limitations, discrimination in institutions, and so on. One of the most intense protests in recent years Black Lives Metter also shows the dissatisfaction of the public with the political and economical structure nowadays. "),
                          h2("References"),
                          p("1. Bach, K. (2022, August 24). New data shows long covid is keeping as many as 4 million people out of work. Brookings. Retrieved October 30, 2022, from https://www.brookings.edu/research/new-data-shows-long-covid-is-keeping-as-many-as-4-million-people-out-of-work/ "),

                          p("2. Bryant, M. (2022, October 26). Internet service offers dataset. Kaggle. Retrieved October 30, 2022, from https://www.kaggle.com/datasets/michaelbryantds/internet-speeds-and-prices?resource=download&amp;select=speed_price_att.csv "),

                          p("3. Kochhar, R., &amp; Bennett, J. (2021, April 14). U.S. labor market inches back from the COVID-19 shock, but recovery is far from complete. Pew Research Center. Retrieved October 30, 2022, from https://www.pewresearch.org/fact-tank/2021/04/14/u-s-labor-market-inches-back-from-the-covid-19-shock-but-recovery-is-far-from-complete/ "),

                          p("4. Sankin, A., & Yin, L. (2022a). speed_price_att [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_att.csv.gz"),

                          p("5. Sankin, A., & Yin, L. (2022b). speed_price_att_other_cities [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_att_other_cities.csv.gz"),

                          p("6. Sankin, A., & Yin, L. (2022c). speed_price_centurylink [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_centurylink.csv.gz"),

                          p("7. Sankin, A., & Yin, L. (2022d). speed_price_earthlink [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_earthlink.csv.gz"),

                          p("8. Sankin, A., & Yin, L. (2022e). speed_price_verizon [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_verizon.csv.gz"),

                          p("9. Winter, A. E. (2022, August 24). Yes, FCC affordable connectivity program's $30 discount is real. verifythis.com. Retrieved October 30, 2022, from https://www.verifythis.com/article/news/verify/money-verify/fcc-affordable-connectivity-program-30-dollar-internet-discount-real/536-c1de0bfb-4545-43bc-9bd8-4219d6b9f040 "),
                        )
                      )
                      )
                    )))

