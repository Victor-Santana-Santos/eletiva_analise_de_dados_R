# ATIVIDADE DATATABLE

library(data.table)

quakesDT <- quakes %>% setDT()
class(quakesDT)

quakesDT[ , lm(formula = mag ~ lat + long + depth)]
