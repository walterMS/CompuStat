x=runif(100)
y=runif(100)
interior<-(x^2+y^2<=1)
frac<-sum(interior)/length(x)
plot(x,y)

