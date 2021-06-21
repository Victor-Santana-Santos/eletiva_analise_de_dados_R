# ATIVIDADE: INTRODUÇÃO A DATAS E TEMPOS

# CRIANDO OBJETO + CONVERSÕES

(str(data_01 <- as.Date(c("2013-12-06 12:50:12", "2021-09-04 06:45:00")) ) )

(str(data_02 <- as.POSIXct(c("2013-12-06 12:50:12", "2021-09-04 06:45:00")) ) )
unclass(data_02)

(str(data_03 <- as.POSIXlt(c("2013-12-06 12:50:12", "2021-09-04 06:45:00")) ) )
unclass(data_03) # observamos o POSIXlt no formato original (componentes de tempo)

# EXTRAÇÕES

library(lubridate)

year(data_03)

month(data_03)

month(data_03, label = T)

wday(data_03, label = T, abbr = T)

# OPERAÇÕES

### Operações

(sequencia <- seq(as.Date('2013-12-06 12:50:12'), as.Date('2021-09-04 06:45:00'),
                  by = "day") )

intervalo <- as.interval(data_03[1], data_03[2])

now() %within% intervalo
table( (sequencia - months(18) ) %within% intervalo )
