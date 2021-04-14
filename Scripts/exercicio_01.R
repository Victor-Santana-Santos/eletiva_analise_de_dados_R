library(eeptools)

#Criação das variáveis do data frame
normalSD01 <- rnorm(500, sd = 1)
normalSD02 <- rnorm(500, sd = 2)
poisson01 <- rpois(500, 1)
binomialNeg01 <- rnbinom(500, mu = 2, size = 10)
binomial01 <- rbinom(500, 1, 0.7)
turnout <- ifelse(binomial01, "Yes", "No")
indexNormal01 <- seq(1, length(binomial01))

#Criação do dataframe
dataFrame <- data.frame(
  IndexObjeto = indexNormal01,
  Normal01 = normalSD01,
  Normal02 = normalSD02,
  Poisson = poisson01,
  BinomialNeg = binomialNeg01,
  Binomial = binomial01,
  Turnout = turnout
  )

#Centralização das variáveis normais
normal01Central <- normalSD01 - mean(normalSD01)
normal02Central <- normalSD02 - mean(normalSD02)

#Trocando o 0 por 1 na variável binomial
binomialTrocada <- ifelse(binomial01, 0, 1)

# Não consegui trocar essas valores nas outras variáveis de contagem,
# testei a seguinte fórmula, mas além de mudar o objeto original
# ela criava apenas um objeto com valor único 0. Testei com if e também com
# ifelse mas não deu certo.


#binomialNegTrocada <- binomialNeg01[binomialNeg01 == 1] <- 0


#Novo dataframe com amostra de 100 casos
Amostra <- sample(nrow(dataFrame), 100)

Amostra_df <- dataFrame[Amostra, ]