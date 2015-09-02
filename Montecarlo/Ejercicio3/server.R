

library(shiny)
shinyServer(function(input, output) {
  
  set.seed(32789)
  h<-function(x){6/sqrt(4-x^2)}
  m=100
  res=seq(1,m)
  
  for (i in 1:m){
    u=reactive(runif(input$n,0,1))
   # res[i]= reactive  (  mean (( h(u() ))) )
  }
  
  r<-reactive(mean(res())*2)
 
   
  
  output$distPlot <- renderPlot({
    plot(u(),(h(u())),type="h",col="green")
    curve(6/sqrt(4-x^2),col="red",add=T)
    
  })
  
  
  
})