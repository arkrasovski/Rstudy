
options(stringsAsFactors = F)
avian <- read.csv("E:/studies/rproject/avianHabitat.csv")
avian$Observer <- as.factor(avian$Observer)
str(avian)
head(avian)
summary(avian) #статистика

any(!complete.cases(avian)) #проверяет на пропущенные значения
any(avian$PDB < 0)
any(avian$PDB > 100)

check_percent_range <- function(x) {
  any (x < 0 | x > 100) #
  
}
?'|'


library(stringr)
coverage_variables <- names(avian)[str_detect(names(avian), "^P")] #^ - начало строки
?str_detect

sapply(coverage_variables, function(name) check_percent_range(avian[[name]])) ##[[]] результат - вектор

names(avian)

avian[["PDB"]]

#CTRL + L очистка консоли

#coverage_variables <- names(avian)[-(1:4)][c(T, F)] #записали в новую переменную все переменные с процентами

avian$total_coverage <- rowSums(avian[, coverage_variables]) #добавили в фрейм переменную с суммами по данным процентам
summary(avian$total_coverage)

avian$site_name <- factor(str_replace(avian$Site, "[:digit:]+", "")) #+ это цифра повторенная произвольное количество раз
which.min(tapply(avian$total_coverage, avian$site_name, mean))

names_height <- names(avian)[str_detect(names(avian), "Ht$")]

sapply(names_height, function(name) which.max(avian[[name]] ))
sapply(names_height, function(type_of_plant) avian$Observer[which.max(avian[[type_of_plant]])])
avian$Observer[[994]]



#avian2 <- read.csv("https://raw.githubusercontent.com/tonytonov/Rcourse/master/R%20programming/avianHabitat2.csv", sep=";",
#                   skip = 5, comment.char = "%", na.strings = "Don't remember", #quote = ""
#                   )
#avian2
#avian2$total_coverage <- rowSums(avian2[, coverage_variables]) #добавили в фрейм переменную с суммами по данным процентам
#summary(avian2$total_coverage)
#avian2$observer <- "karlo"
#avian2

#avian$Observer <- NULL
#avian <- rbind(avian, avian2)

#summary(avian$total_coverage)

#my_var <- "Site"; avian$my_var
#my_var <- "Site"; avian[[my_var]]

#names(avian)[-ncol(avian)]

#height <- names(avian)[-c(1:4, ncol(avian))][c(F, T)]
#height
#avian
#sort(apply(avian[, height], 2, max), decreasing = T)
#
#avian$total_height

#==============================2nd lesson=======================================

head(avian)

list.files(pattern = ".*\\.csv$") #.* - любое количество символов
                                  # \\. экранировали точку (не любой символ, просто точка)
                                  # $ - конец строки
readLines("avianHabitat.csv", 5) #количество строк которые надо прочитать
#avian <- read.table("avianHabitat.csv", header=T, sep=",", dec=".")
