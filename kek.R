help("sin");
help.search("logarithm")
??logarithm
?sin


cats <- 2
dogs <- 12
pets <- cats + dogs
pets

ls() # все глобальные переменные
?rnorm
rnorm(15)
rnorm(15, mean = 5, sd = 3)

returntwo <- function() {
  y <- 2
  return(y)
}

returntwo()


addten <- function(x) {
  kekdogs <<- x + 10 #глобальное присваивание
}
addten(dogs)
kekdogs

rm(kekdogs) # удаляет переменные из глобального окружения
rm(moredogs)

rm(list = ls()) # удаление всех переменных из глобального окружения

