# ATIVIDADE: ESTRUTURAÇÃO

library(data.table)
library(dplyr)
library(tidyverse)

general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") 

freq(general_data$location)

# vetor que identifica países da UE
european_union_countries<-c("Austria", "Belgium", "Bulgaria", "Croatia", 
                            "Cyprus", "Czechia", "Denmark", "Estonia", "Finland",
                            "France", "Germany", "Greece", "Hungary", "Ireland", 
                            "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", 
                            "Netherlands", "Poland", "Portugal", "Romania", 
                            "Slovakia", "Slovenia", "Spain", "Sweden") 

# Filtragem dos casos
EU <- general_data %>% filter(location %in% european_union_countries)

# Matriz com variáveis e países de interesse
mEU <- EU %>% group_by(location) %>% mutate(row = row_number()) %>% 
  select(location, new_cases, row)

# filtra dados para garantir que todos os países tenham mesmo nro de casos
result <- mEU %>% group_by(location) %>% filter(row == max(row))
mEU <- mEU %>% filter(row<=min(result$row)) 

# pivota o data frame de long para wide
mEUw <- mEU %>% pivot_wider(names_from = row, values_from = new_cases) %>% 
  remove_rownames %>% column_to_rownames(var="location") 