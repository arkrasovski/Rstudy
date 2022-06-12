if(sqrt(2) > 1.5) {
  print("Greater")
} else {
  print("Less!")
}

if(c(TRUE, FALSE)) print("Hmm...?")

ifelse(runif(8) > 0.5, "Орёл", "Решка")
#runif для 8 значений от 0 до 1 с равномерным распределением
#ifelse векторизованный тип if  
x <- runif(8)
ifelse(x > 2/3, "Камень", 
       ifelse(x > 1/3, "Ножницы", "Бумага"))

switch("factorial", 
       sum = 5+5,
       product = 5*5,
       factorial = factorial(5),
       0)

#циклы 
i <- 0
repeat {
  i <- i + runif(1)
  print(i)
  if(i > 5) break
}

i <- 2^14
while(i > 1000) {
  i <- i/2
  print(i)
}

for(j in 1:8) {
  if(j %% 2 == 0) print(j)
}

for(i in letters) { #letters - все буквы англ алфавита
  if(i == "b") next
  if(i == "d") break
  print(i)
}

for(i in 1:8) i

v <- 1:1e5 #100 000
system.time({
     x <- 0
     for (i in v) {x[i] <- sqrt(v[i])}
   })

system.time({
    y <- sqrt(v)
 })

identical(x,y)
all.equal(x,y)

?letters

set.seed(1337)
x <- runif(1e6, min = -1, max = 1)

i <- 0
for(j in x) {
  if(j > -0.2 & j < 0.3){
    i <- i + 1
  }
}
print(i)

dice_roll <- function(n) {
  x <- floor(runif(n, min = 1, max = 7))
  print(x)
}
dice_roll(200)
