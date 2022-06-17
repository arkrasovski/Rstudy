avian <- read.csv("E:/studies/rproject/avianHabitat.csv")
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

names(avian)

#CTRL + L очистка консоли

coverage_variables <- names(avian)[-(1:4)][c(T, F)] #записали в новую переменную все переменные с процентами

avian$total_coverage <- rowSums(avian[, coverage_variables]) #добавили в фрейм переменную с суммами по данным процентам
summary(avian$total_coverage)



avian2 <- read.csv("https://raw.githubusercontent.com/tonytonov/Rcourse/master/R%20programming/avianHabitat2.csv", sep=";",
                   skip = 5, comment.char = "%", na.strings = "Don't remember", #quote = ""
                   )
avian2
avian2$total_coverage <- rowSums(avian2[, coverage_variables]) #добавили в фрейм переменную с суммами по данным процентам
summary(avian2$total_coverage)

avian$Observer <- NULL
avian <- rbind(avian, avian2)

summary(avian$total_coverage)

my_var <- "Site"; avian$my_var
my_var <- "Site"; avian[[my_var]]

names(avian)[-ncol(avian)]

height <- names(avian)[-c(1:4, ncol(avian))][c(F, T)]
height
avian
sort(apply(avian[, height], 2, max), decreasing = T)

avian$total_height