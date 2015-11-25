
f<-function(x,mu,sigman){    
  return( 1/(sigman*sqrt(2*pi))*exp( -.5*( (x-mu)/sigman   )^2    ) )
  
}

m<-10000
sigman<-2
mu<-70
x<-numeric(m)
x[1]<-rchisq(1,df=1)
k<-0
u<-runif(m)


for(i in 2:m){
  xt<-x[i-1]
  y<-rchisq(1,df=xt)
  num<-f(y,mu,sigman)*dchisq(xt,df=y)
  den<-f(xt,mu,sigman)*dchisq(y,df=xt)
  if(u[i]<=num/den)
    x[i]<-y
  else{
    x[i]<-xt
    k<-k+1
  }
  
}

print (k)

index<-5000:5500
y1<-x[index]
plot(index,y1,type="l", main="mcmc",ylab="X")

hist(x[650:10000],freq=F,nclass = 15)
curve(f(x,mu,sigman),50,80,add=T)
valores<-seq(60,70,.001)
sum(f(valores,mu,sigman))
sum(f(valores,mu,sigman))*.001
valores<-seq(60,75,.001)
sum(f(valores,mu,sigman))*.001
valores<-seq(60,72,.001)
sum(f(valores,mu,sigman)*.001)

