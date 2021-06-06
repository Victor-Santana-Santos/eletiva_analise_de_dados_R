# ATIVIDADE DPLYR

# Sumário

library(dplyr)

count(iris, Species)

# Agrupamento

iris %>% group_by(Species) %>% summarise(avg = mean(Petal.Length))
iris %>% group_by(Species) %>% summarise(avg = mean(Petal.Width))
iris %>% group_by(Species) %>% summarise(avg = mean(Sepal.Length))
iris %>% group_by(Species) %>% summarise(avg = mean(Sepal.Width))

# Manipulação de casos

arrange(iris, Petal.Length)
arrange(iris, Petal.Width)
arrange(iris, Sepal.Length)
arrange(iris, Sepal.Width)

# Manipulação de colunas

iris %>% select(Species, Petal.Length, Petal.Width) %>% arrange(Petal.Length)

iris_new <- iris %>% mutate(Petal.Area = Petal.Length*Petal.Width,
                            Sepal.Area = Sepal.Length*Petal.Width)

arrange(iris_new, Petal.Area)
arrange(iris_new, Sepal.Area)
