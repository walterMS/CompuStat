#Despliegue de la exponencial

library(shiny)
shinyServer(function(input, output) {
  
  u <- reactive(runif(input$naleatorios))
  x<-reactive((1/input$lambdas)*log((1-u())^(-1)))
  
  output$distPlot <- renderPlot({
    hist(x(),breaks=input$bloques,col='skyblue',main='Variable Aleatoria Exponecial',freq=FALSE)
    lines(density(x()), col="green", lwd=3,na.rm=TRUE) 
    
  })
  
  output$distTabla <- renderDataTable({
    tabla_datos<-data.frame(X=sort(x()))
    tabla_datos
  })
})