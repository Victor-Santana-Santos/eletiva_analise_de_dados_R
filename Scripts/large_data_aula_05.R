library(ff)

enderecoBase <- 'bases_originais/largeData.csv'

# criando o arquivo ff
system.time(extracaoLD3 <- read.csv.ffdf(file=enderecoBase))

# classe do objeto
class(extracaoLD3)

# Comparação do tamanho
object.size(extracaoLD2) 
object.size(extracaoLD3) 

# ATIVIDADE: operações
sum(extracaoLD3[,3])

mean(extracaoLD3[,3])

median(extracaoLD3[,3])

sd(extracaoLD3[,3])

# ATIVIDADE: amostragem e regressão linear
extracaoLD3Amostra <- extracaoLD3[sample(nrow(extracaoLD3), 100000) , ]

lm(c ~ ., extracaoLD3Amostra)
