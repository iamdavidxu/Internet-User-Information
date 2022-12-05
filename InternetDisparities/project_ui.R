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

number_slider <- sliderInput(
  inputId = "slider",
  label = "Test Slider",
  min = 0,
  max = 10,
  value = 5,
)

state_chose <- selectInput(
  "state.choice",
  label = "State Picker",
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
                          p("What types of Internet are most often used, and what are the implications of usage of those types?"),
                          p("How does the Internet speed for each provider vary by download and upload speed?"),
                          p("How are different areas across the country impacted by internet redlining practices?")
                        ),
                        mainPanel(
                         
                          img(src = "https://mrkp-static-production.themarkup.org/uploads/2022/10/isp_main-841x473.jpg", height = 841, width = 1000)
                          
                          )
                      )
                      
              ),
             tabPanel("Page 1",
                      sidebarLayout(
                        sidebarPanel(
                          
                        ),
                        
                        mainPanel(
                          plotlyOutput("speed_chart"),
                          p("This chart is a bar chart that, based on who the provider is, shows the 
                          average upload and download speed across all the data we have. This chart is 
                          also interactive, when you hover over each column, you can see the exact upload 
                          and download speed. This chart allows users to see which Internet Service Providers 
                          (ISPs) have the fastest average internet.")
                        )
                      )
             ),
             tabPanel("Page 2",  
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
                            users and fiber and fiber-based internet is _significantly_ more purchased. 
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
             tabPanel("Page 3",
                      sidebarLayout(
                        sidebarPanel(
                          #add widgets and input things here
                          
                        ),
                        
                        mainPanel(
                          plotOutput("plot_choropleth")
                          
                        )
                      )
             ), 
             tabPanel("Summary"),
                    
  )  
  
))
