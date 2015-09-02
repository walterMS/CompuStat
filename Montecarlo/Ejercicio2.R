#calculando la integral de 4/(1+x^2) de 0 a 1
set.seed(32789)

h<-function(x){4/(1+x^2)}
n=20000
m=100
res=seq(1,m)

for (i in 1:m){
  u=runif(n)
  res[i]=mean(h(u))
}

mean(res)