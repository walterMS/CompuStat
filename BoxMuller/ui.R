library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Método de BoxMuller para Normales"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                  "Número de aleatorios:",
                  min = 10,
                  max = 2000,
                  value=100
      ),
      sliderInput("bins",
                  "Bins:",
                  min = 1,
                  max = 1000,
                  value = 10
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("distPlot2")
    )
  )
))