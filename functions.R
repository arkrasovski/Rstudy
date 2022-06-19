str(c(mean, max))
#ctrl + shift + '+' - увеличение окна
#ctrl + '-' - уменьшение окна

#перебор двух функций 
fun_list <- c(mean, max)
sapply(fun_list, function(f) f(1:100))

#функция как аргумент

apply_f <- function(f, x) f(x)
sapply(fun_list, apply_f, y=1:100)

apply_f(function(x) sum(x^2), 1:10)

#функция как возвращаемое значение

square <- function() function(x) x^2
square()
square()(5)

#функции внутри функций

f <- function(x) {
  g <- function(y) if (y > 0) 1 else if (y < 0) -1 else 0
  sapply(x, g)
}
all.equal(f(-100:100), sign(-100:100))

(f <- function(x) x^5)
sd
var
methods(plot)
norm

has_na <- function(v) {
  for (k in v) if (is.na(k)) return(TRUE)
  return(FALSE)}

has_na <- function(v) any(is.na(v))

is.na(c("kek", NA, "lol"))
anyNA(c("kek", NA, "lol"))


seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),
    length.out = NULL, along.with = NULL, ...)
# Аргументы могут иметь значения по умолчанию
# Значения могут вычисляться на лету!

seq() # from = 1, to = 1
seq(1, 5, length.out = 11) # by = (5 - 1)/(11 - 1)


{r, eval=FALSE}
f <- function(arg1, arg2, remove_na = TRUE, ..., optional_arg) {}
f(1, arg2 = 2, remove = F, optional_arg = 42, do_magic = TRUE)


#Разбор аргументов проходит в три этапа:
  
#1. Точное совпадение имени аргумента -- `arg2`, `optional_arg`
#2. Частичное совпадение имени аргумента (только до `...`) -- `remove_na`
#3. Разбор аргументов по позиции -- `arg1`

#Неразобранные аргументы попадают в `...` -- `do_magic`


#проброс аргументов
f <- function(x, pow = 2) x^pow
integrate(f, 0, 1) # lower = 0, upper = 1, pow = 2
integrate(f, 0, 1, pow = 5) # same, but pow = 5 функция integrate не имеет аргумента похожего на pow,
                            # она запакует его и передаст на уровень выше в функцию f

# Бинарные операторы
#Оператор `x %in% y`: есть ли вхождения элементов `x` в `y`? 

1:5 %in% c(1, 2, 5) #вернет логический вектор

"%nin%" <- function(x, y) !(x %in% y)  #создание собственного бинарного оператора
1:5 %nin% c(1, 2, 5)


decorate_string <- function(pattern, ...) {
  reverse_string <- function(str) {
    string_split <- strsplit(str, NULL)[[1]]
    reversed_string <- paste(rev(string_split), collapse="")
  }
  
  paste0(pattern, paste(...), reverse_string(pattern))
}

decorate_string(pattern = "123", "abc", "defd") 

decorate_string(pattern = "123", "abc", "def", sep = "+")

decorate_string(pattern = "!", c("x", "x"), collapse = "_")

?matrix

# Generate deck card
values <- c("Ace", 2:10, "Jack", "Queen", "King")
suits <- c("Clubs", "Diamonds", "Hearts", "Spades")
card_deck <- outer(values, suits, paste, sep = " of ") #outer применяет ко всевозможным комбинацям 
                                                       #векторов функцию paste

# Function factory
generator <- function(set) function(n) sample(set, n, replace = T)

# Define generators
card_generator <- generator(card_deck)
coin_generator <- generator(c("Heads", "Tails"))

# Let's play!
card_generator(10)
coin_generator(5)

"%+%" <- function(x, y) {z <- x + y
                        if (length(x) > length(y)) {
                          for(i in (length(y) + 1):length(x)) {
                            z[i] <- NA
                          }
                        } else if(length(x) < length(y)){
                          for(i in (length(x) + 1):length(y)) {
                            z[i] <- NA
                          }
                        }
return(z)}


1:5 %+% 1:2   # c(2, 4, NA, NA, NA)
5 %+% c(2, 6) # c(7, NA)
?warpbreaks
print(warpbreaks)


#Полезные функции

# replicate

#Задачи моделирования часто используют вызовы одной и той же функции, зависящей от датчика случайных чисел:

get_status <- function(n, p = 0.1) {
  x <- rbinom(n, 1, p)
  sum(x)
}
replicate(5, get_status(100))

# `mapply`
# Многомерная версия `sapply`:

mapply(seq, from = 1:4, to = 2:5, by = 1 / (1 + 1:4))

#суть результат вызовов


#list(
#  seq(1, 2, 1/2), seq(2, 3, 1/3),
#  seq(3, 4, 1/4), seq(4, 5, 1/5)
#)

# outer

# Перебор всевозможных комбинаций аргументов: 

m <- outer(letters, LETTERS, paste0)

dim(m)

diag(m)

m[1:5, 1:5]

# `Vectorize`

#Есть способ векторизовать функцию, которая таковой не является

lp_norm <- function(x, p = 2) {
  if (p >= 1) sum(abs(x)^p)^(1/p) else NaN
}
lp_norm(1:10, -1:4)

lp_norm <- Vectorize(lp_norm, "p")
lp_norm(1:10, -1:4)

df1 <- data.frame(id = 1:2, value = rnorm(2))
df2 <- data.frame(id = 3:4, value = runif(2))
df3 <- data.frame(id = 222, value = 7)
do.call(rbind, list(df1, df2, df3)) #rbind(df1, df2, df3)

do.call(rbind, lapply(list.files(), function(file) read.csv(file)))

