install.packages("poliscidata")

library(poliscidata)

GSS <- gss %>% drop_na(authoritarianism)

summary(GSS$authoritarianism)

hist(GSS$authoritarianism)

simulacaoCentral <- GSS$authoritarianism - mean(GSS$authoritarianism)

hist(simulacaoCentral)
