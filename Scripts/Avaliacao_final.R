# AVALIAÇÃO

library(dplyr)
library(tidyverse)
library(data.table)
library(funModeling)
library(naniar)
library(lubridate)

Covid19PE <- read.csv2('https://dados.seplag.pe.gov.br/apps/basegeral.csv', 
                       header=T, na.strings=c("","NA"))

Covid19PE$dt_notificacao <- as.Date(Covid19PE$dt_notificacao, format = "%Y-%m-%d")

# Variável Semana Epidemológica

Covid19PE_trat <- Covid19PE %>% mutate(semana_epi = epiweek(dt_notificacao))

# Casos confirmados e óbitos por município

Covid19PE_casos_conf <- Covid19PE_trat %>% 
  select(classe, dt_notificacao, municipio, semana_epi) %>% 
  group_by(municipio, semana_epi) %>% count(classe) %>%
  mutate(casos_mun = n)

Covid19PE_obitos_mun <- Covid19PE_trat %>% 
  select(dt_notificacao, municipio, semana_epi, evolucao, dt_obito) %>% 
  group_by(municipio, semana_epi) %>% count(evolucao) %>% 
  mutate (obitos_mun = n)

# Enriquecimento com muncípios

library(stringr)
library(tidyr)
library(textreadr)

# OBS: Modifiquei o arquivo no Excel para poder operacionalizar as variáveis

library(readxl)
tabela6579 <- read_excel("bases_originais/tabela6579.xlsx", 
                         col_types = c("text", "numeric"))

Covid19PE_casos_pop <- left_join(Covid19PE_casos_conf, tabela6579, by = c('municipio' = 'Municipio'))                              

Covid19PE_obitos_pop <- left_join(Covid19PE_obitos_mun, tabela6579, by = c('municipio' = 'Municipio'))

# Incidência e letalidade por 100 mil habitantes

Covid19PE_casos_pop <- Covid19PE_casos_pop [grepl("CONFIRMADO", Covid19PE_casos_pop$classe), ]

Covid19PE_obitos_pop <- Covid19PE_obitos_pop [grepl("OBITO", Covid19PE_obitos_pop$evolucao), ]

Covid19PE_casos_pop <- Covid19PE_casos_pop %>% 
  mutate(incidencia = (n/Populacao)/100000)

Covid19PE_obitos_pop <- Covid19PE_obitos_pop %>%
  mutate(letalidade = (n/Populacao)/100000)
