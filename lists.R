list(1:5, "my_data", matrix(0, 2, 2))

list(a = 1, b = 1:3, "1to5" = 1:5, 42)

#рекурсивный список
list(a = list(1, 2, 3), b = list(list(4), 5, 6))

#конкантенация списков
l1 <- list(name = "john", salary = 1000)
l2 <- list(has_car = TRUE, car = "lamborghini")

c(l1, l2)

#любой вектор легко привести к списку единичной длины
v <- 1:7
list(v)


#сведение unlist
l <- list(1:3, 4:5, last=6)
unlist(l)

unlist(c(l, "spy!"))

l

#индексирование 
l[3:2]
l[-(1:2)]

l[c(F, T, F)]
l["last"] # результат - список

#доступ к конкретному элементу
l[[1]] #непосредственно элемент (вектор)
l[["last"]]

#доступ по имени с частичным дополнением
l$last #непосредственно элемент (вектор)
l$l #l$la l$las

l <- list(1:3, 4:5, last=6)
l[[3]] <- NULL #удаление элемента
l

l[[4]] <- 99
l

l <- list(vec = 1:7, fun = sqrt)
l$fun(4)

names(l)

is.null(l$string)

l$string <- "Citius, altius, fortius"
l

l <- list(a = c("12", "34"), b = LETTERS[5:10], c=1:5) #letters в верхнем регистре
lapply(l, length)

?paste

lapply(l, paste, collapse = "|") #paste склеивает строки по аргументу collapse
lapply(l, function(s) paste(s, collapse = "|"))
sapply(l, paste, collapse="|") #результат - вектор

l <- list(some_name = 1, increadibly_long_name = 2)
l$incr + 1

f <- function (x, ridiculously_long_arg) x + ridiculously_long_arg
f(3, ridic = 5)

#is.na, is.nan и is.null

?diag
diag(matrix(1, 5, 5))

get_longest <- function(l){
  len <- sapply(l, length)
  ind <- which.max(len)
  list(number = ind, element = l[[ind]])
}


gen_list <- function(n_elements, max_len, seed = 111) {
  set.seed(seed)
  len <- sample(1:max_len, n_elements)
  print(len)
  lapply(1:n_elements, function(i) rnorm(len[i])) #rnorm генерирует len[i] чисел
}
?rnorm
l1 <- gen_list(4, 10)
l1
gl1 <- get_longest(l1)
gl1$number
gl1$el


l2 <- gen_list(4, 10, 777)
l2
get_longest(l2)

?unique

sort(unique(c(5, 2, 7, 7, 7, 2, 0, 0)))
length(which(c(5, 2, 7, 7, 7, 2, 0, 0) == 7))
m1 <- matrix(sort(unique(c(5, 2, 7, 7, 7, 2, 0, 0))), nrow = 2, ncol = length(unique(c(5, 2, 7, 7, 7, 2, 0, 0))), byrow = T)
m1        

for(i in 1:ncol(m1)) {
  print(i)
  m1[2, i] <- length(which(c(5, 2, 7, 7, 7, 2, 0, 0) == m1[1, i]))
}
m1

count_elements <- function(x) {
  m1 <- matrix(sort(unique(x)), nrow = 2, ncol = length(unique(x)), byrow = T)
  for(i in 1:ncol(m1)) {
    m1[2, i] <- length(which(x == m1[1, i]))
  }
 return(m1)
}

count_elements(c(5, 2, 7, 7, 7, 2, 0, 0))

set.seed(1789)
bastille <- list(
  "La Chapelle Tower" = rbinom(5, 10, 1/2), 
  "Tresor Tower" = rbinom(8, 12, 1/4), 
  "Comte Tower" = rbinom(14, 3, 1/5) + 1,
  "Baziniere Tower" = rbinom(8, 4, 4/5), 
  "Bertaudiere Tower" = rbinom(4, 8, 2/3),
  "Liberte Tower" = rbinom(1, 100, 0.1), 
  "Puits Tower" = rbinom(5, 5, 0.7),
  "Coin Tower" = rbinom(3, 16, 0.4)
)

min(unlist(lapply(bastille, sum)))
sum(unlist(bastille))
which(lapply(bastille, sum) == min(unlist(lapply(bastille, sum))))

