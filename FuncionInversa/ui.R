

library(shiny)


shinyUI(fluidPage(
  
  
  titlePanel("Método de la función Inversa para una Exponencial"),
  
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("naleatorios",
                  "Números Aleatorios:",
                  min = 10,
                  max = 100000,
                  value=100
      ),
      
      sliderInput("lambdas",
                  "Valor del Parámetro Lambda:",
                  min = 0.0001,
                  max = 10,
                  value = 1
      ),
      sliderInput("bloques",
                  "Bloques:",
                  min = 5,
                  max = 1000,
                  value = 100
      )
    ),
    
    
    mainPanel(
      plotOutput("distPlot"),
      dataTableOutput("distTabla")
    )
  )
))