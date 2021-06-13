# ATIVIDADE: IMPUTAÇÃO

library(data.table)

## imputação numérica

# tendência central
library(Hmisc)

statesDF <- states

statesDF$relig_import <- impute(statesDF$relig_import, fun = mean)

is.imputed(statesDF$relig_import)
table(is.imputed(statesDF$relig_import))

## Hot deck
# imputação aleatória

statesDF <- states

(statesDF$relig_import <- impute(statesDF$relig_import, "random"))

# imputação por instâncias

statesDF <- states

library(VIM)
statesDF2 <- kNN(statesDF)
