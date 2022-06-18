s <- c("Терпение и труд всё перетрут", 
        "Кончил дело — гуляй смело", 
        "Без труда не вытащишь и рыбку из пруда",
        'Работа не волк, в лес не убежит')

s <- 'Операция, "ы"'
s

#paste & paste0
#выполняют конкатенацию строковых векторов с учетом правил переписывания
#sep - разделитель между элементами (для paste по умолчанию пробел, для paste0 - пустая строка)
#аргумент collapse "схлопывает" вектор в одну строку

paste(c("углекислый", "веселящий"), "газ") #газ применяется к обоим строкам
?paste0

paste(c("углекислый", "веселящий"), "газ", sep = "_")

paste(c("углекислый", "веселящий", "буйный"), "газ", collapse = ", а также ")

#strsplit - разбиение строки 
#результат - список

strsplit(s, "и", fixed = TRUE)
#если не указать fixed то строка по которой проводится разбиение будет рассматривать как регулярное выражение

strsplit(s, "[[:punct:]]")

grep("труд", s) #покажет номера элементов в которые входит слово труд

grepl("труд", s) #вернет логический вектор длины s true где есть слово труд

gsub("\\b[[:alpha:]]{4,5}\\b", "####",  s) #ищет слова из 4-5 букв и заменяет на ####
gsub("[иае]", "?", s) #ctrl + shift + z возврат удаленного ctrl + z

#пакет stringr
install.packages("stringr")
library(stringr)

str_extract(s, "н.") #точка - любой сигнал (любой символ) первое вхождение н.
s
str_replace(s, "[иа]", "?") #первое вхождение и или а

#к вызовам функции можно добавить _all чтобы найти все вхождения
str_extract_all(s, "н.") #вернется список вхождений данной конструкции

str_replace_all(s, "[иае]", "?")

tolower(month.name)

toupper(month.abb) #трехбуквенные сокращения месяцев

length("Аэрофотосъёмка ландшафта уже выявила земли богачей и процветающих крестьян.")
length(NA)

??str_length

nchar("Аэрофотосъёмка ландшафта уже выявила земли богачей и процветающих крестьян.")
str_length("Аэрофотосъёмка ландшафта уже выявила земли богачей и процветающих крестьян.")



library(stringr)

hamlet <- "To be, or not to be: that is the question:
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles,
And by opposing end them?"

hamlet <- str_replace_all(hamlet, "[:punct:]", "")
hamlet <- tolower(unlist(str_split(hamlet, "[:space:]")))

length(which(hamlet == "to"))
length(grep("to", hamlet))
length(grep("[fqw]", hamlet))
length(grep("b.", hamlet))
length(grep("\\b[[:alpha:]]{7}\\b", hamlet))



