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
rnorm(15) #15 элементов из норм распределения
rnorm(15, mean = 5, sd = 3) #среднее = 5, стандартное отклонение 3

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

#rm(kekdogs) # удаляет переменные из глобального окружения
#rm(moredogs)

rm(list = ls()) # удаление всех переменных из глобального окружения
ls()

??logarithm

log2((sin(atan(1)))^2)

divide <- function(x, y) {
  return(x/y)
}
divide(1, 0)
divide(-99999, 0)
divide(0, 0)
divide(Inf, Inf)

#Общий глоссарий для этого урока:
?help
?help.search
?"<-"
?ls
?"function"
?rm
#?rnorm

?save
save.image(file=".RData")