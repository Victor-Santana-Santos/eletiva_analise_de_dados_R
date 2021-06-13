# ATIVIDADE: VALORES AUSENTES - BÁSICO

library(data.table)
library(funModeling) 
library(tidyverse)
library(poliscidata)

states <- states

status(states)

# Shadow matrix

x <- as.data.frame(abs(is.na(states)))

head(x)

y <- x[which(sapply(x, sd) > 0)] # mantém apenas variáveis que possuem NA

round(cor(y), 3)

# Modificação

y <- cbind(y, state = states$state)

y_states <- y %>% group_by(state) %>% summarise(across(everything(), list(sum)))
