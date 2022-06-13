#список библиотек
.libPaths()

#установленные пакеты
installed.packages()

grid.newpage()

#подключение пакета
library(grid) #аналог require(pkgname)
#library вернет ошибку, если не знает пакета, а require вернет FALSE

grid.newpage()
grid.lines()

install.packages("xts", dependencies = TRUE)
library(xts)

#обновление пакетов
update.packages()

#справка
#показывает пакеты которые подключены в сессию
sessionInfo()

#ctrl + shift + f10 обновление сессии

install.packages("randtoolbox", dependencies = TRUE)
library(randtoolbox)

help(package = "stats")

install.packages("quantmod", dependencies = TRUE)
library(quantmod)