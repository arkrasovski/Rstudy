x <- vector(length = 2)
x[1] <- 5
x[2] <- 8
x

x <- c(8, 5) #присваивание вектора
x

y <- c(x, 1, c(3,4), x, NA)
y

#числовые последовательности
5:9

3:-1

seq(1, 2, by = 0.25) #шаг 0.25 от 1 до 2

seq(3, 4, length.out = )

seq(3, 4, length=5)

# Повторение векторов
rep(1:3, times = 3)

rep(1:3, each=4)

rep(1:3, length.out = 5)

#Приоритет операторов
?Syntax

hello <- "Hello world!"
print(hello)
hello


c(1, 3, 2)

0.1 + 0.1 == 0.2

0.1 + 0.05 == 0.15

# Сравнивает double

all.equal(0.1 + 0.05, 0.15)

u <- seq(0, 1, 1/3)
v <- seq(0, 1, 1/7)
c(u, v)

#сортируем по возрастанию
help.search("sort")
w <- sort(c(u, v))
w

#убираем повторы
w <- unique(w)
w

get_fractions <- function(m, n) {
  u <- seq(0, 1, 1/m)
  v <- seq(0, 1, 1/n)
  w <- unique(sort(c(u, v), decreasing=TRUE))
  return(w)
}
get_fractions(3, 7)

#типы векторов

a <- c("Дуб", "Роза - цветок", "Воробей - птица")
typeof(a)

is.character(a)
is.logical(a)

b <- c(FALSE, 1.5)
typeof(b)

b <- c(5, b, 'abc')
typeof(b)

b

rm(b)

#Привeдение типов

as.numeric(b)
b

as.integer(b)

x <- 1:100
x
length(x)

length(x) <- 4;
x

length(x) <- 7
x

#Именованные вектора
a <- c(uno = 1, dos = 2, "universal answer" = 42, 99)
names(a)

names(a) <- c("one", "two", "fourty two", "ninety nine")
a

names(a) <- NULL
a

#Векторная арифметика (поэлементно)
1:3 + c(-1, 2, 0)

1:3 * c(-1, 2, 0)

c(TRUE, TRUE, TRUE) & c(0, 1, 999)


#Векторизация
sqrt(1:4)
#округление вниз
floor(seq(0, 3, by = 0.25))

#не векторизована
sum(1:100)


??'valid name'
make.names("2b.or.not.2b", unique=TRUE)1+10



