matrix(1:6, nrow=2, ncol=3) #вектор уложен по столбцам

matrix(1:6, nrow=2)

#вектор уложен по строкам
matrix(1:6, nrow=2, byrow=TRUE)

matrix(7:8, nrow=2, ncol=5)

m <- matrix(1:6, ncol=3)
m
dim(m)

#превращает матрицу в вектор
dim(m) <- NULL
m

dim(m) <- c(2, 3)
m

m1 <- matrix(1:4, nrow = 2)
m2 <- matrix(c(1, 2, 2, 3), nrow = 2)

m1 + m2

m1 + 5

m1 * 2

m1 * m2

#умножение линейной алгебры

m1 %*% m2

m <- matrix(1:10, ncol=5)
m[1, 3]
#доступ ко всей строке
m[2, ]

#доступ ко всему столбцу
m[, 4]

m[1, ] <- 0
m[, -5] <- 11:18
m

m <- matrix(1:10, ncol=5)
#выбираем столбцы и получаем подматрицу из выбранных стобцов
ind <- c(1, 3, 5)
m[, ind]
#выбрался только вектор из 3 столбца, не матрица
ind <- 3
m[, ind]

#убрать схлопывание в вектор, результат - матрица из одного столбца
m[, ind, drop=FALSE]

m <- matrix(1:10, ncol=5)
rownames(m) <- c("row1", "row2")
colnames(m) <- paste0("column", 1:5) #склеивает аргументы в вектор строк

m

m["row1", c("column2", "column4"), drop=F]

#присоединение матриц
rbind(m1, m2) #по строкам (строки приписываются снизу)

cbind(m1, m2) #по столбцам (столбцы приклеиваются справа)


cbind(m1, m2, 1:2, c(5,3), m2[, 1], m1 * 3, cbind(m1, m2))

m <- matrix(1:25, 5) 
f <- function(x) sum(x^2)

?matrix

#apply
#1 Массив
#2 Индекс (1-строки, 2-столбцы)
#3 Функция

apply(m, 1, f)

apply(m, 2, f)

apply(m, 1:2, function(i) if(i > 13) i else 13) #анонимная функция

m[m <= 13] <- 13
m

m <- matrix(1:25, 5) 
rowSums(m)
colMeans(m)

all.equal(rowSums(m), apply(m, 1, sum))

all.equal(colMeans(m), apply(m, 2, mean)) #среднее
 
mat <- matrix(0, 5, 5)
mat
mat[mat < 5]
mat > 5


find_closest <- function(v, n) {
  z <- abs(v - n)
  k <- which(z == min(z))
  return(k)
}

find_closest(c(5, 2, 7, 7, 7, 2, 0, 0), 1)

bind_diag <- function (m1, m2, fill) {
  m3 <- matrix(fill, 
               nrow = nrow(m1) + nrow(m2),
               ncol = ncol(m1) + ncol(m2))
  m3[1:nrow(m1), 1:ncol(m1)] <- m1
  m3[nrow(m1) + 1:nrow(m2), ncol(m1) + 1:ncol(m2)] <- m2
  m3
  
}

m1 <- matrix(1:12, nrow = 3)
m2 <- matrix(10:15, ncol = 3)
bind_diag(m1, m2, fill = NA)
bind_diag(m2, m1, fill = 0)


build_ziggurat <- function(n) {
  mzig <- matrix(1, nrow= 2*n - 1, ncol = 2*n - 1)
  if(n == 1) {mzig
    } else {
  for(i in 1:(n-1)){
    mzig[(1+i):(2*n - 1 - i), (1+i):(2*n - 1 - i)] = i + 1
  }
  mzig}
}

build_ziggurat(1)

1:0



