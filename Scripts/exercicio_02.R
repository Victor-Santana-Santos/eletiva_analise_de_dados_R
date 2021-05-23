# EXERCÍCIO 02

library(ff)

situacaofinalalunos2011 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2011.csv')
situacaofinalalunos2012 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2012.csv')
situacaofinalalunos2013 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2013.csv')
situacaofinalalunos2014 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2014.csv')
situacaofinalalunos2015 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2015.csv')
situacaofinalalunos2016 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2016.csv')
situacaofinalalunos2017 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2017.csv')
situacaofinalalunos2018 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2018.csv')
situacaofinalalunos2019 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2019.csv')
situacaofinalalunos2020 <- read.csv.ffdf(file='bases_originais/situacaofinalalunos2020.csv')

library(data.table)
install.packages('ffbase')
library(ffbase)

situacaofinalalunosGeral <- ffdfrbind.fill(situacaofinalalunos2011, situacaofinalalunos2012,
                                       situacaofinalalunos2013, situacaofinalalunos2014,
                                       situacaofinalalunos2015, situacaofinalalunos2016,
                                       situacaofinalalunos2017, situacaofinalalunos2018,
                                       situacaofinalalunos2019, situacaofinalalunos2020)

# Limpando a staging area

rm(list = c(situacaofinalalunos2011, situacaofinalalunos2012,
            situacaofinalalunos2013, situacaofinalalunos2014,
            situacaofinalalunos2015, situacaofinalalunos2016,
            situacaofinalalunos2017, situacaofinalalunos2018,
            situacaofinalalunos2019, situacaofinalalunos2020))

# Salvando no formato .rds

saveRDS(situacaofinalalunosGeral, "bases_originais/situacaofinalalunosGeral")
