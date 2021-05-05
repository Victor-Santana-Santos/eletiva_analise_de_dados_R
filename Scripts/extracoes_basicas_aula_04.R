#ATIVIDADE - EXTRAÇÕES BÁSICAS

# arquivos de texto com read.csv2
PessoasVacinadasRecCovid19 <- read.csv2('http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/966e9c4c-df45-40d7-9c58-2f13c61a6d28/download/vacinados.csv', 
                                        sep = ';', encoding = 'UTF-8')

# arquivos xml
install.packages('XML')
library(XML)

WSUCourses <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/wsu.xml")

# arquivos json
install.packages('rjson')
library(rjson)

PessoasVacinadasMetaDados <- fromJSON(file= "http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/159fabd3-f156-411a-a949-e6b5c0bc2ad8/download/metadados_vacinados.json")

PessoasVacinadasMetaDados <- as.data.frame(PessoasVacinadasMetaDados)