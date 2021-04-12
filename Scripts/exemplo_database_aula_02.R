install.packages("eeptools")

library (eeptools)
library (tidyverse)

#Vetor com os nomes dos estados do Nordeste do Brasil
estadosNordeste <- c("Alagoas", "Bahia", "Ceará", "Maranhão", "Paraíba", 
                     "Pernambuco", "Piauí", "Rio Grande do Norte", "Sergipe")

#Vetor com os nomes das capitais dos estados
capitaisNordeste <- c("Maceió", "Salvador", "Fortaleza", "São Luís", 
                      "João Pessoa", "Recife", "Teresina", "Natal", "Aracaju")

#Vetor com a população de cada estado
populacaoEstados <- c(3337357, 14873064, 9132078, 7075181, 4018127, 9557071,
                      3273227, 3506853, 2298696)

#vetor com a população das regiões metropolitanas de cada capital
populacaoRegioesMetro <- c(1310520, 3929209, 4106245, 1633117, 1278401, 
                           4079575, 1223902, 1604067, 961120)

#vetor com a porcentagem da população que habita na RM da capital
porcentagemRegioesMetro <- populacaoRegioesMetro/populacaoEstados

#dataframe com base nos vetores
listaEstadosNordeste <- data.frame(
  estado = estadosNordeste,                        # Estados
  capital = capitaisNordeste,                      # Capitais
  populacao_estados = populacaoEstados,            # População (estados)
  populacao_reg_metro = populacaoRegioesMetro,     # População (RM)
  porcentagem_reg_metro = porcentagemRegioesMetro  # Porcentagem (RM/estados)
)
