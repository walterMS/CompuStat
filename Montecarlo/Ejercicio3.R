#calculando la integral de 6/sqrt(4-x^2) de 0 a 1
set.seed(32789)

h<-function(x){6/sqrt(4-x^2)}
n=20000
m=100
res=seq(1,m)

for (i in 1:m){
  u=runif(n)
  res[i]=mean(h(u))
}

mean(res)


#calculando la integral de 6/sqrt(4-x^2) de 0 a 2
set.seed(32789)

h<-function(x){6/sqrt(4-x^2)}
n=20000
m=100
res=seq(1,m)

for (i in 1:m){
  u=runif(n,0,2)
  res[i]=mean(h(u))
}

mean(res)