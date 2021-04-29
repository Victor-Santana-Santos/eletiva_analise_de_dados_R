library(tidyverse)

# carrega a base de snistros de transito do site da PCR
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', 
                                    sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', 
                                    sep = ';', encoding = 'UTF-8')

# ATIVIDADE: carregar o ano de 2019 e combinar com os outros anos

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv',
                                    sep = ';', encoding = 'UTF-8')

# OBSERVAÇÃO: Achei melhor alterar o nome da coluna "DATA" no df de 2019 para 
# "data" para ficar igual aos outros anos, por isso usei o tidyverse mas só 
# nessa parte

sinistrosRecife2019Raw <- rename(sinistrosRecife2019Raw, data = DATA)

# ATIVIDADE: juntar as bases de dados com comando rbind (juntas por linhas)
# Obs: como o número de colunas é diferente, fiz a intersecção para excluir
# as colunas a mais do df de 2019.

common_cols <- intersect(colnames(sinistrosRecife2019Raw), 
                         colnames(sinistrosRecife2020Raw))

sinistros2019e2020 <- rbind(sinistrosRecife2019Raw[common_cols],
                            sinistrosRecife2020Raw[common_cols])

sinistrosRecifeRaw <- rbind(sinistros2019e2020, sinistrosRecife2021Raw)

# observa a estrutura dos dados
str(sinistrosRecifeRaw)

# modifca a data para formato date
sinistrosRecifeRaw$data <- as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")

# modifica natureza do sinistro de texto para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# cria funçaõ para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)

# ATIVIDADE: transformar mais uma coluna em factor. Variável escolhida: "tipo"
sinistrosRecifeRaw$tipo <- as.factor(sinistrosRecifeRaw$tipo)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")
