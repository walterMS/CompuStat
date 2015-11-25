
f<-function(x,sigma){    
  if(any(x<0)) return(0)
  stopifnot(sigma > 0)
  return( (x/sigma^2)*exp(-x^2/(2*sigma^2)) )
  
}

m<-20000
sigma<-4
x<-numeric(m)
x[1]<-rchisq(1,df=1)
k<-0
u<-runif(m)


for(i in 2:m){
  xt<-x[i-1]
  y<-rchisq(1,df=xt)
  num<-f(y,sigma)*dchisq(xt,df=y)
  den<-f(xt,sigma)*dchisq(y,df=xt)
  if(u[i]<=num/den)
    x[i]<-y
  else{
    x[i]<-xt
    k<-k+1
  }
  
}

print (k)

index<-5000:6000
y1<-x[index]
plot(index,y1,type="l", main="mcmc",ylab="X")

hist(x,freq =F)
curve(f(x,sigma),0.1,15,add=T)
