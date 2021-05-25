# ATIVIDADE ENRIQUECIMENTO

# arquivos html
library(rvest)
library(dplyr)

# Webscrapping: tabela do wikipedia - Região Metropolitana do Recife

url <- "https://pt.wikipedia.org/wiki/Regi%C3%A3o_Metropolitana_do_Recife"

urlTables <- url %>% read_html %>% html_nodes("table")

RegMetroRecife <- as.data.frame(html_table(urlTables[3]))

# Webscrapping: tabela do wikipedia - Municípios de Pernambuco

url2 <- "https://pt.wikipedia.org/wiki/Lista_de_munic%C3%ADpios_de_Pernambuco"

url2Tables <- url2 %>% read_html %>% html_nodes("table")

MunicipiosPE <- as.data.frame(html_table(url2Tables[2]))

# Enriquecimento com left join

RegMetroRecifejoin <- left_join(RegMetroRecife, MunicipiosPE, by = c('Município' = 'Município'))
