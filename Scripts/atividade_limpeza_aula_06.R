# ATIVIDADE LIMPEZA

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

# Filtragem das variáveis
EU_limpo <- EU %>% select(location, new_cases, new_deaths)

status(EU_limpo)
freq(EU_limpo)
plot_num(EU_limpo)
profiling_num(EU_limpo)

#Retirando casos abaixo de zero

EU_limpo %>% filter(new_cases < 0)

EU_limpo <- EU_limpo %>% filter(new_cases>=0)

# Removendo NAs

EU_limpo <- na.omit(EU_limpo)

status(EU_limpo)
