from <- 0
to <- 2
n <- 10000
f <- function (x) {sqrt(4-x^2)}

monteCarlo <- function(n, alpha = 0.05) {
  x <- runif(n, from, to)
  estimador <- 2*mean(f(x))
  cuantil <- qnorm(alpha/2, lower.tail = FALSE)
  varianza <- var(f(x))
  limsup <- estimador + cuantil*sqrt(varianza/n)
  liminf <- estimador - cuantil*sqrt(varianza/n)
  
  return(list(est=estimador, limsup = limsup, liminf = liminf))
}



N <- seq(10, 10000, by = 25)
res <- sapply(N, FUN = monteCarlo)
plot(as.numeric(res[1,]), type = "l",ylab="Intervalos",xlab="Número de simulaciones",main="Montecarlo con Intervalos de Confianza")
abline(h=pi, col = "red")
lines(as.numeric(res[2,]), col = "blue", lty=4)
lines(as.numeric(res[3,]), col = "green", lty=4)

print(monteCarlo(100000, .05))
