tarefaSemente <- addTaskCallback(function(...) {set.seed(123); TRUE})

tarefaSemente

#distribuição normal simulada
distNormalSimulacao <- rnorm(500)

summary(distNormalSimulacao)

#distribuição binomial simulada
distBinomialSimulacao <- rbinom(500, 1, 0.7)

distBinomialSimulacao

#repetições

classeSimulacao <- c(rep("Pernambuco", length(distBinomialSimulacao)/2), rep
                     ("Sergipe", length(distBinomialSimulacao)/2))

classeSimulacao

#sequências
indexSimulacao <- seq(1, length(distNormalSimulacao))

indexSimulacao
