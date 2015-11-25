N=10000
X=1:N
p=c(.2,.8)
pt=matrix(c(.7,.3,.4,.6),nrow=2,byrow=T)
U=runif(N)

for (i in 1:N){
  if(U[i]<=p[1])
    X[i]=1
  else
    X[i]=2
  p=pt[X[i],]
  
}

#X
table(X)
ph=pt
for(i in 1:30)
{
  ph=ph%*%pt
}
ph
