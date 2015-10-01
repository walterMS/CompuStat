
library(shiny)

shinyServer(function(input, output) {
  
  output$distPlot1 <- renderPlot({
    
    Fun1 <- function (nsim,lambda1,lambda2,a,b){
      u <- runif(nsim)
      #EXPONENCIAL
      #Generamos x con forma exponencial por metodo de funcion inversa:
      u <- runif(nsim)#debe de ser de 0 a 2 pero me marca error
      c <- (1/lambda1)*log(1/(1-(1-exp(-2*lambda1))*u))
      #Funcion objetivo:
      f_obj <- function(x){
        (lambda2*exp(-lambda2*x))
      }
      #Importance weight
      w <- function(x){
        dexp(x,lambda1)/(1-exp(-2*lambda1))
      }
      #Para calcular la integral
      f_obj2<- function(x){
        (f_obj(x)/w(x))
        }
      #Intervalos Importance Sampling Exponencial
      alpha=0.05
      estim1<- mean(f_obj2(c))
      S2_1 <-var(f_obj2(c))
      quant1 <- qexp(alpha/2,lower.tail=FALSE)
      int.upper1 <- estim1 + sqrt(S2_1/input$nsim)*quant1
      int.lower1 <- estim1 - sqrt(S2_1/input$nsim)*quant1
      
      #MONTECARLO
      un <- runif(nsim,0,2)
      d <- function(u){
        (lambda2*exp(-lambda2*u))*2
        }
      #Intervalos Monte Carlo Crudo
      estim2<- mean(d(un))
      S2_2 <-var(d(un))
      quant2 <- qexp(alpha/2,lower.tail=FALSE)
      int.upper2 <- estim2 + sqrt(S2_2/nsim)*quant2
      int.lower2 <- estim2 - sqrt(S2_2/nsim)*quant2
  
      #BETA
      y <- rbeta(nsim,a,b)
      f_objb <- function(x){
        lambda1*exp(-lambda1*x)
        }
      w2 <- function(x){
        dexp(x,lambda2)/(dbeta(x,a,b,ncp = 0,log = FALSE))
        }
      f_objb2 <- function(x){
        (f_objb(x)/w2(x))
        }
      
      estim3<- mean(f_objb2(y))
      
    
      return(data.frame(estim1,int.lower1,int.upper1,estim2,int.lower2,int.upper2,estim3))
    }
    
  Fun1(input$nsim,input$lambda1,input$lambda2,input$a,input$b)
    
  resultado <- data.frame()
  vec <- seq(1,input$tam_muestras,1)
    for(i in vec){
      resultado <- rbind(resultado,Fun1(input$nsim,input$lambda1,input$lambda2,input$a,input$b))
                  }

      
      plot(resultado$estim1, type="l", col="black", ylim=c(min(resultado$int.lower1),max(resultado$int.upper1)), main = "Importance Sampling Exponencial",ylab = "Media", xlab = "tamaño muestras")
      lines(resultado$int.lower1, type="l", col ="blue",lty=4)
      lines(resultado$int.upper1, type="l", col ="green",lty=4)
      
    output$distPlot2 <- renderPlot({
      plot(resultado$estim2, type="l", col="black", ylim=c(min(resultado$int.lower2),max(resultado$int.upper2)),main = "Monte Carlo Crudo",ylab = "Media",xlab = "tamaño muestras")
      lines(resultado$int.lower2, type="l", col ="blue",lty=4)
      lines(resultado$int.upper2, type="l", col ="green",lty=4)
      })
      
    output$distPlot3 <- renderPlot({
      plot(resultado$estim3, type="l", col="blue", ylim=c(min(resultado$estim3),max(resultado$estim3)),main = "Importance Sampling Beta",ylab = "Media",xlab = "tamaño muestras")
      })
   
  output$view <- renderTable({
    data <- as.data.frame(cbind(mean(resultado$estim1),mean(resultado$int.lower1),mean(resultado$int.upper1),mean(resultado$estim2),mean(resultado$int.lower2),mean(resultado$int.upper2),mean(resultado$estim3)))  
      
    names(data)<- c("Exponencial M","LInf Exp","LSup Exp","MC Crudo","LInf MCC","LSup MCC","Beta")
      
    data})
  })

})
