##########

library(microbenchmark)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

# carrega base de dados em formato nativo R
sinistrosRecife <- readRDS('bases_tratadas/sinistrosRecife.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
sinistrosRecife <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';')

# ATIVIDADE: carregar base de dados em formato para excel (.xls)

library(writexl)

write_xlsx(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.xlsx")

# ATIVIDADE: comparar os TRÊS processos de exportação, usando a função microbenchmark

library(readxl)

microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds"), 
               b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"), 
               times = 30L)

microbenchmark(c <- write_xlsx(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.xlsx"),
               times = 30L)

microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife.rds'), 
               b <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';'),
               times = 10L)

microbenchmark(c <- read_xlsx('bases_tratadas/sinistrosRecife.xlsx'),
               times = 10L)
