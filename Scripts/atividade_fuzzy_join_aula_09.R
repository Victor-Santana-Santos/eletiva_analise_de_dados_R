# ATIVIDADE: fuzzy join
library(dplyr)


Municipios <- c("Abreu e Lima", "Araçoiaba", "Cabo de Santo Agostinho", 
                "Camaragibe", "Igarassu", "Ilha de Itamaracá", "Ipojuca", 
                "Itapissuma", "Jaboatão dos Guararapes", "Moreno", "Olinda", 
                "Paulista", "Recife", "São Lourenço da Mata")

Populacao_2020 <- c(100346, 20733, 208944, 158899, 118370, 26672, 97669, 26900, 
                    706867, 63294, 393115, 334376, 1653461, 114079)

df1 <- data.frame(Municipios, Populacao_2020)

Area <- c(126.384, 96.360, 445.343, 51.321, 306.879, 66.146, 521.801, 73.968, 
          258.724, 196.073, 41.300, 96.932, 218.843, 264.190)

Municipios <- c("Abreu e Lima", "Aracoiaba", "Cabo de Santo Agostinho", 
               "Camaragibe", "Igarassu", "Ilha de Itamaraca", "Ipojuca", 
               "Itapissuma", "Jaboatao dos Guararapes", "Moreno", "Olinda", 
               "Paulista", "Recife", "Sao Lourenco da Mata")

df2 <- data.frame(Municipios, Area)

# Fuzzy join

install.packages("fuzzyjoin")
library(fuzzyjoin)

df3 <- fuzzyjoin::stringdist_join(df1, df2, mode='left')

# Buscas

grep(pattern = "I", x = Municipios, value = TRUE)
