

library(shiny)
shinyServer(function(input, output) {
  
  u1 <- reactive(runif(input$n))
  u2 <- reactive(runif(input$n))
  angulo <- reactive(2*pi*u1())
  radio <- reactive( sqrt(-2*log(u2(),exp(1))) )
  x<-reactive(  radio()*cos(angulo()) )
  y <- reactive( radio()*sin(angulo()) )
  
  output$distPlot <- renderPlot({
    hist(x(),breaks=input$bins,col='skyblue',freq=FALSE,main='Normal de X')
    
  })
  
  output$distPlot2 <- renderPlot({
    hist(y(),breaks=input$bins,col='skyblue',freq=FALSE,main='Normal de Y')
    
  })
  
  
})