set.seed(1337)
f <- factor(sample(LETTERS, 30, replace=TRUE))
f

as.numeric(f)
as.character(f)

levels(f) #уникальные уровни фактора
nlevels(f)

#индексирование определено только для == и !=
f[f == "X"] <- "Y" #можно только те значения присваивать, которые присутсвуют в левелах
f

(f <- droplevels(f)) #обновляет левелы фактора
#результат присвоения в круглых скобках сразу выводит на печать

levels(f) <- tolower(levels(f)) #меняет как уровни, так и метки которые присовоены значениям (первая строка)
f 

levels(f)[1] <- "bbb"
f
temp <- c("freezing cold", "cold", "comfortable", "hot", "burning hot")
ft <- ordered(sample(temp, 14, replace = TRUE), temp) #упорядочены по temp 
ft
ft[ft >= "hot"]

#cut разбивает numeric вектор на интервалы
#table производит подсчет количества элементов для каждого уровня фактора

cut(rnorm(10), -5:5)
table(cut(rnorm(1000), -5:5))



?options
options(stringsAsFactors = FALSE) #отменить автоматическое представление строковой переменной как фактора

?warpbreaks
str(warpbreaks)

tapply(warpbreaks$breaks, warpbreaks$wool, max) #первый аргумент - переменная по которой считается статистика
#второй аргумент - фактор который задает градации
#третий - функция которую мы хотим применить


str(quakes)
?seq
?cut


quakes$mag
cut(quakes$mag, seq(min(quakes$mag), ceiling(max(quakes$mag)), by = 0.5), right=FALSE)
sort(cut(quakes$mag, seq(min(quakes$mag), ceiling(max(quakes$mag)), by = 0.5), right=FALSE), decreasing = TRUE)
sort(table(cut(quakes$mag, seq(min(quakes$mag), ceiling(max(quakes$mag)), by = 0.5), right=FALSE)), decreasing=TRUE)

