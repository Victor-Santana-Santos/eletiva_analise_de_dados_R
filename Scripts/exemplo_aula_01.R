library(tidyverse)

#Objeto simples (vetor)
vetor <- c(1:10)

#Complexidade do vetor
str(vetor)

#Pesquisa das variáveis do banco de dados
?iris

#Objeto complexo (Regressão com duas variáveis do banco de dados)
regPetalas <- lm(Petal.Length ~ Species, iris)

#Resultados da regressão
regPetalas

#Complexidade da regressão
str(regPetalas) 

#Estrutura da base de dados
str(iris)

#Sumário da base de dados
summary(iris)