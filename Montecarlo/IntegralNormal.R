
monteCarlo<-function(fx,a,b,c,d,n){
  
  
  X<-runif(n,a,b)
  Y<-runif(n,c,d)
  
  Z<- (Y<=sapply(X,fx))
  I<-(b-a)*c +(cumsum(Z)/(1:n))*(b-a)*(d-c)
  plot(1:n,I,type="l",col="blue")
  return (I[n])
}

f<-function(x)exp((x)^2*(-0.5))/sqrt(2*pi)

monteCarlo(f,-3,3,0,.5,9000)
abline(h=1,col="red")