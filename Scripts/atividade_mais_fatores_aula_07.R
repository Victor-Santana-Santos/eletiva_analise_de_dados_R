# ATIVIDADE MAIS FATORES

library(ade4)
library(arules)
library(forcats)

# filtro por tipo de dado

factorsChickWeight <- unlist(lapply(ChickWeight, is.factor))  
ChickWeightFactor <- ChickWeight[ , factorsChickWeight]
str(ChickWeightFactor)

# One Hot Encoding
ChickWeightDummy <- acm.disjonctif(ChickWeightFactor)

ChickWeightDummy
