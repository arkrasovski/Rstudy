# Концепция "tidy data"


#В статистике стандартная форма записи табличных данных: 
#   стоблец -- переменная
#   строка -- наблюдение

# Это очень удобно для дата фрейма в R
# Не во всех областях анализа данных это так

set.seed(1122)
df <- data.frame(Name = c("John", "Peter", "Mary", "Caroline"),
                 DrugA_T1 = runif(4, 35, 36),
                 DrugA_T2 = runif(4, 36, 39),
                 DrugB_T1 = runif(4, 36, 36.6),
                 DrugB_T2 = runif(4, 37, 38.5)
); df

#сначала скачать dplyr а потом tidyr иначе ругалось
install.packages("dplyr")
install.packages("tidyr")
library(tidyr)
library(dplyr)

# Связка gather-spread
gather(df, Variable, Temperature, -Name)

# Связка separate-unite
df <- gather(df, Variable, Temperature, -Name)
df <- separate(df, Variable, c("DrugType", "Time"), "_")
df

select(df, Time, Temperature)

select(df, 3:4)
select(df, starts_with("T"))
select(df, -Name, -DrugType)

#select по колонкам

#filter по строкам

?dplyr::filter
?stats::filter

filter(df, Temperature > 37, Name %in% c("John", "Mary"))

# dplyr: функция arrange

arrange(df, Name, -Temperature) #минус - по убыванию

mutate(df, DrugType = gsub("Drug", "", DrugType)) #удаляет из переменных частицу Drug столбца DrugType

# dplyr: связка функций group_by и summarise

  summarize(group_by(df, Time), 
            AvgTemp = formatC(mean(Temperature), digits = 7))

#alt + '-' добавление знака присваивания <- 
