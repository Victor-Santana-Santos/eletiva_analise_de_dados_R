# Instalação do pacote
library(data.table)

# Criação do large data
casos= 1e7

# cria o data.frame com o total de casos definido acima
largeData = data.table(a=rpois(casos, 3),
                       b=rbinom(casos, 1, 0.7),
                       c=rnorm(casos),
                       d=sample(c("fogo","agua","terra","ar"), casos, replace=TRUE),
                       e=rnorm(casos),
                       f=rpois(casos, 3),
                       g=rnorm(casos)
)

# Tamanho do objeto
object.size(largeData)

# Salvar dados
write.table(largeData,"bases_originais/largeData.csv",sep=",",row.names=FALSE,quote=FALSE)


enderecoBase <- 'bases_originais/largeData.csv'

# extração direta via read.csv
system.time(extracaoLD1 <- read.csv2(enderecoBase))

# extração via função fread, que já faz amostragem automaticamente
system.time(extracaoLD2 <- fread(enderecoBase))
