women <- women

#média das variáveis do dataframe women
apply(women, 2, mean)
lapply(women, mean)
sapply(women, mean)

par(mfrow = c(1, 2))

sapply(women [, 1:2], hist)
mapply(hist, women[ ,1:2], MoreArgs = list(main = 'Histograma', xlab = 'Valores',
                                           ylab = 'Frequência'))


