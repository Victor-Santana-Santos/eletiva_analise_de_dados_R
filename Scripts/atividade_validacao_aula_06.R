# ATIVIDADE VALIDAÇÃO

library(validate)

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

# Seleção das variáveis
EU <- EU %>% select(location, new_cases, new_deaths)

regras_EU <- validator(new_cases >= 0, new_deaths >= 0)

validacao_EU <- confront(EU, regras_EU)

summary(validacao_EU)

plot(validacao_EU)

# Limpeza da base de dados

EU_limpo <- EU %>% filter(new_cases>=0, new_deaths >= 0)

# Removendo NAs

EU_limpo <- na.omit(EU_limpo)

status(EU_limpo)

# Validação após limpeza

validacao_EU_limpo <- confront(EU_limpo, regras_EU)

plot(validacao_EU_limpo)
