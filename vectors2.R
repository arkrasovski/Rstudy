#Правила переписывания

#1. Длина результата равна длине большего из векторов
#2. Меньший вектор дублируется (переписывается) несколько раз, чтобы длина переписанного вектора совпала с длиной большего
#3. Если длина большего вектора не делится нацело на длину меньшего, выдается предупреждение

1:5 + 0:1

1:10 + 3

(5:8)^2

1:4 >= 3

x <- seq(10, 100, by = 10)

x[ind]
val <- x[ind]
x[ind] <- val

x[]

x[1]

x[3:4]

x[c(8, 7, 3, 6:8, x[1])]

#отрицательные индексы
#"все элементы кроме указанных"
x[-5]

x[-(2:6)]

x[c(-3, -5, -length(x), -5)]


#все элементы с нечетными номерами
x[rep(c(TRUE, FALSE), 5)]

#правило переписывания
x[c(TRUE, FALSE)]

x[x > 77 & x < 99]

a[c("two", "one", "fourty two")]

a[c("fourty two", "forty three", 'forty four')]

#функции all и any
#все
all(x < 200) 
all(x > 20)
#хотя бы один
any(x > 150)
any(x < 15)


#номера индексов
which(x >= 50)

#возвращают индекс только первых найденных
which.min(x)

which.max(x)



x <- c(5, 3, 9)
names(x) <- c("V", "III", "IX")

attr(x, "author") <- "Caesar"
attributes(x)

attributes(x) <- NULL
attributes(x)

?max

which.max(c("1", "99", "HI"))


#fizz-buzz, imperative style
y <- vector(mode="character", length=100) #ниже аналог
y <- character(100) #100 строк

for(i in 1:100) {
  if(i %% 15 == 0) {
    y[i] <- "fizz buzz"
  } else if (i %% 3 == 0) {
    y[i] <- "fizz"
  } else if (i %% 5 == 0) {
    y[i] <- "buzz"
  } else {
    y[i] <- i
  }
}
y

#fizz-buzz, vector-oriented style
x <- 1:100
z <- 1:100

x %% 5
x %% 5 == 0

z[x %% 5 == 0] <- "buzz"
z[x %% 3 == 0] <- "fizz"
z[x %% 15 == 0] <- "fizz buzz"

all (z == y)

letters[c(1, 23, 5, 19, 15, 13, 5)]

x <- 2 ^ (0:10)
x
log2(x)




set.seed(42) # зафиксировали сид чтобы совпали результаты рандома
x <- sample(1:100, 50) #50 элементов, случайные числа от 1 до 100

#два соседних числа которые отличаются на макс длину
x[-1]
x[-length(x)]

x[-1] - x[-length(x)] #вектор разниц между соседними числами
k <- which.max(abs(x[-1] - x[-length(x)]))
k
x[c(k, k+1)]


a <- 0
maxindex <- 0
for(i in 1:(length(x) - 1)) {
  if( abs(x[i + 1] - x[i]) > a){
    a <- abs(x[i + 1] - x[i])
    maxindex <- i
  } 
}
x[c(maxindex, maxindex + 1)]
maxindex

#multiple min max
x <- sample(1:100, 50, replace=TRUE) #TRUE значит с повторениями
min(x)
which.min(x)
which(x == min(x))


maxdiff <- function(x) {
  y <- abs(x[-1] - x[-length(x)])
  k <- which(y == max(y))
  print(k)
  print("first neighbor(s):")
  print(x[k])
  print("second neighbor(s):")
  print(x[k + 1])
  print("max absolute diff is:")
  print(max(y))
}
xx <- sample(1:100, 1e4, replace=TRUE)
maxdiff(xx)

is_monotone <- function(x) {
  y <- all(((x[-1] - x[-length(x)]) >= 0)) || all(((x[-1] - x[-length(x)]) <= 0))
  print(y)
  return(y)
}

is_monotone(c(0, 0, 0))
rep(0, 10)

combin_count <- function(n, k, with_repretitions = FALSE) {
 
  if(with_repretitions){
    return(factorial(n + k - 1) / (factorial(k) * factorial(n-1)))
  } 
  return(factorial(n) / (factorial(k) * factorial(n-k)))
}
x <- seq(-2*pi, 2*pi, 0.1)
plot(x, cos(x))

