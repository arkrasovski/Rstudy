df <- data.frame(x = 1:4, y = LETTERS[1:4], z = c(T, F))
df

#краткая сводка
str(df)

df <- data.frame(x = 1:4, y = LETTERS[1:4], z = c(T, F),
                 row.names = c("Alpha", "Bravo", "Charlie", "Delta"))
df

rownames(df)
colnames(df)

dimnames(df) #список из rownames и colnames

nrow(df)
ncol(df)

dim(df) #вектор размерности (строки, столбцы)

is.vector(dim(df))

length(df) #возвращает количество столбцов
names(df) #возвращает имена столбцов
row.names(df)
df[3]
df[3:4, -1] #результат - датафрейм

df[c(F, T), c("z", "x")]

df[, 1] #размерность схлопывается
df[, 1, drop=FALSE]

df$z 
df[[3]]
df[["z"]] #результат - вектор 

df[df$x > 2,]

subset(df, x > 2)
subset(df, x > 2, select = c(x, z))

#присоединение дата фрейма снизу к df (имена должны совпадать)
rbind(df, data.frame(x = 5:6, y = c("K", "Z"), z = TRUE, row.names = c("Kappa", "Zulu")))

#присоединение дата фрейма сбоку к df (число наблюдений должно совпадать)
cbind(df, data.frame(season = c("Summer", "Autumn", "Winter", "Spring"), temp = c(20, 5, -10, 5)))

#комбинирование data frame 
df_salary <- data.frame(x = c(3, 2, 6, 1), salary = c(100, 1000, 300, 500))
merge(df, df_salary, by="x") #inner join

as.matrix(df)
?sort
sort(attitude$learning, decreasing=T)[1:5]
  
t1 <- subset(attitude, attitude$learning >= min(sort(attitude$learning, decreasing=T)[1:5]))
t1
which(attitude$complaints + attitude$raises + attitude$advance == max(t1$complaints + t1$raises + t1$advance))

?within


attitude[rating < 50, names(attitude) != "rating"]

attitude[attitude$rating < 50, names(attitude) != "rating"]

subset(attitude, rating < 50, -rating)

subset(sel = -rating, sub = rating < 50, attitude)

?quakes
max(quakes[, 4])
min(quakes[, 4])

mean(quakes[,3])
median(quakes[,3])
?median

quakes[3, ]
quakes[nrow(quakes) - 1, ]