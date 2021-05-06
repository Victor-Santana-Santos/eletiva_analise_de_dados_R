# ATIVIDADE WEBSCRAPPING

# arquivos html
library(rvest)
library(dplyr)

# tabelas da wikipedia
url <- "https://pt.wikipedia.org/wiki/Regi%C3%A3o_Metropolitana_do_Recife"

urlTables <- url %>% read_html %>% html_nodes("table")

RegMetroRecife <- as.data.frame(html_table(urlTables[3]))
