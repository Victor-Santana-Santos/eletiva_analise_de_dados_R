# EXERCÍCIO 03

library(dplyr)
library(tidyverse)
library(data.table)
library(funModeling)
library(naniar)

Covid19PE <- read.csv2('https://dados.seplag.pe.gov.br/apps/basegeral.csv', 
                       header=T, na.strings=c("","NA"))

status(Covid19PE)

# Retirando NAs por imputação randômica
(Covid19PE$sintomas <- impute(Covid19PE$sintomas, "random"))

# Calculando total de casos confirmados e negativos por município

Covid19PE_trat <- Covid19PE %>% select(classe, dt_notificacao, municipio, sintomas) 

Covid19PE_mun <- Covid19PE %>% group_by(municipio) %>% count(classe) %>% mutate (casos_mun = n)

Covid19PE_mun

# Variável binária: tosse ou não

library(stringr)
library(tidyr)
library(textreadr)

Covid19PE_trat$Tosse <-  ifelse( 
  grepl("TOSSE", Covid19PE_trat$sintomas), 1, 0)

Covid19PE_tosse <- Covid19PE_trat %>% group_by(Tosse) %>% count(classe) 

# Média móvel - 07 dias - confirmados e negativos

library(plotly)
library(zoo)

Covid19PE_trat$dt_notificacao <- as.Date(Covid19PE_trat$dt_notificacao, format = "%Y-%m-%d")

str(Covid19PE_trat)

Covid19PE_classe <- Covid19PE_trat %>% select(classe, dt_notificacao)

Covid19PE_classe <- Covid19PE_classe %>% 
  mutate(CONFIRMADO = ifelse(classe == 'CONFIRMADO', 1, 0),
         NEGATIVO = ifelse(classe == 'NEGATIVO', 1, 0),
         EM_INVESTIGACAO = ifelse(classe == 'EM INVESTIGACAO', 1, 0),
         DESCARTADO = ifelse(classe == 'DESCARTADO', 1, 0))

covid19PE_MM7 <- Covid19PE_classe %>% mutate(confirMM7 = round(rollmean(x = CONFIRMADO, 7, align = "right", fill = NA), 2),
                                             negatiMM7 = round(rollmean(x = NEGATIVO, 7, align = "right", fill = NA), 2))

plot_ly(covid19PE_MM7) %>% 
  add_trace(x = ~dt_notificacao, y = ~confirmMM7, type = 'scatter', mode = 'lines', name = "Média Móvel - Casos Confirmados") %>% add_trace(x = dt_notificacao, y = ~negatiMM7, name = "Média móvel - negativos", mode = 'lines') %>% layout(
  title = 'Média móvel Confirmados X Negativos em PE', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Casos', showgrid = FALSE),
  hovermode = "compare")

# o GRÁFICO INFELIZMENTE ESTÁ DANDO ERRO... MAS NÃO SEI O PORQUÊ, ELE NÃO
# ESTÁ ENCONTRANDO O OBJETO, MAS ISSO NÃO FAZ SENTIDO...
