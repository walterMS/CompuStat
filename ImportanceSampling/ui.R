
library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Importance Sampling"),
  
  sidebarPanel(
    
    sliderInput("nsim",
                "Número de obs por muestra:",
                min = 100,
                max = 10000,
                value = 4000),
    
    sliderInput("tam_muestras",
                "Número de muestras:",
                min = 50,
                max = 100,
                value = 75),
    
    sliderInput("lambda2",
                "Valor de lambda f(x):",
                min = 0.1,
                max = 5,
                value = 1),
    
    sliderInput("lambda1",
                "Valor de lambda g(x):",
                min = 1,
                max = 5,
                value = 2),
  
    sliderInput("a",
                "Alpha para Fn Beta:",
                min = 0.5,
                max = 5,
                value = 1),
    
    sliderInput("b",
                "Beta para Fn Beta:",
                min = 0.5,
                max = 5,
                value = 2)
    
    ),
  # Show a plot of the generated distribution
  mainPanel(
    tableOutput("view"),
    plotOutput("distPlot1"),
    plotOutput("distPlot2"),
    plotOutput("distPlot3")
   
  )
  
  
  ))