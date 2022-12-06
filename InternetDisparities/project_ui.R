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

#redlining_slider <- 

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
                          img(src = "https://mrkp-static-production.themarkup.org/uploads/2022/10/isp_main-841x473.jpg", height = 841, width = 1000)
                          
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
                           Internet Service Provider, but the it is nonetheless a problem in the United States. 
                           This is a rea, very large issue that is outside the scope of our research and data, but 
                           we have done enough research to have realized that to some degree, Internet Service Providers 
                           like AT&T do charge more money to people they know cannot afford it, but still rely on it. ISP’s 
                           put these people in a chokehold because they know everyone needs internet, and there is nothing to 
                           stop them from doing so. We are only able to draw conclusions about the data that we observed, but 
                           we would like our readers to come to their own conclusions about the ethicality of these internet 
                           companies, and ponder the question, if people are charged extra just for internet, what else are they 
                           charged more for? This overhcharging of people in poverty and the racist price gouging tactics 
                           employed by large companies is one of the many reasons why people in poverty often stay in poverty, 
                           and why minorities are more likely to have an income below the average for their area.") 

                         
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
                          p("This data visualization includes a choropleth map that displays the percentage point difference of lower income areas across the country with slower internet speeds. This chart allows users to visualize the overall impacts of internet redlining across the country through a scale of redlining grades represented by varying shades of blue. A lighter shade of blue represents less internet redlining, whereas a darker shade represents a higher level of internet redlining and grey represents areas where the data was NA.")
                        )
                      ),
                      
                     
             ), 
             tabPanel("Summary", 
                      mainPanel(
                        plotOutput("speed_chart"),
                        p("This chart is a bar chart that, based on who the provider is, shows the 
                          average upload and download speed across all the data we have. This chart is 
                          also interactive, when you hover over each column, you can see the exact upload 
                          and download speed. This chart allows users to see which Internet Service Providers 
                          (ISPs) have the fastest average internet.")
                      )),
                    
    
  )
)
)

