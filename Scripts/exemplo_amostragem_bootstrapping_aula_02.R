#amostragem sem reposição usando função sample
sample(distNormalSimulacao, 75, replace = FALSE)

#amostragem com reposição usando função sample
sample(distNormalSimulacao, 75, replace = TRUE)

#bootstraping com função replicate
set.seed(412)

bootsDistNormal50 <- replicate(10, sample(distNormalSimulacao, 50, replace
                                               = TRUE))
bootsDistNormal50

#calculando uma estatística com bootstrapping (50 amostras)
mediaBootsNormal50 <- replicate(50, mean(sample(distNormalSimulacao, 50,
                                                replace = TRUE)))

mediaBootsNormal250 <- replicate(250, mean(sample(distNormalSimulacao, 50, 
                                                  replace = TRUE)))

mediaBootsNormal500 <- replicate(500, mean(sample(distNormalSimulacao, 50,
                                                  replace = TRUE)))

#Comparação
mean(mediaBootsNormal50)
mean(mediaBootsNormal250)
mean(mediaBootsNormal500)
mean(distNormalSimulacao)
